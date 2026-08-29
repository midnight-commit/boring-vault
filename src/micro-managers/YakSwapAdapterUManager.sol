// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {UManager, ManagerWithMerkleVerification, ERC20} from "src/micro-managers/UManager.sol";

interface IAdapter {
    function swap(uint256 amountIn, uint256 amountOut, address tokenIn, address tokenOut, address to)
        external
        returns (uint256);
}

/**
 * Required Merkle Root Leaves
 * - ERC20 transfer to adapter.
 * - IAdapter.swap with tokenIn, tokenOut, and boringVault as recipient.
 */
contract YakSwapAdapterUManager is UManager {
    //============================== ERRORS ===============================

    error YakSwapAdapterUManager__InsufficientAmountOut(uint256 amountOut, uint256 amountOutMin);

    constructor(address _owner, address _manager, address _boringVault) UManager(_owner, _manager, _boringVault) {}

    /**
     * @notice Performs a swap using a YakSwap adapter directly.
     * @param manageProofs 2 manage proofs, the first one for the ERC20 transfer, and the second
     *        for the adapter swap call
     * @param decodersAndSanitizers 2 DecodersAndSanitizers one that implements ERC20 transfer, and one that
     *        implements IAdapter.swap
     * @param adapter The adapter to swap through.
     * @dev Callable by STRATEGIST_ROLE.
     */
    function swap(
        bytes32[][] calldata manageProofs,
        address[] calldata decodersAndSanitizers,
        address adapter,
        ERC20 tokenIn,
        uint256 amountIn,
        ERC20 tokenOut,
        uint256 amountOutMin
    ) external requiresAuth enforceRateLimit {
        address[] memory targets = new address[](2);
        bytes[] memory targetData = new bytes[](2);
        uint256[] memory values = new uint256[](2);

        // Build transfer data - send tokenIn to adapter.
        targets[0] = address(tokenIn);
        targetData[0] = abi.encodeWithSelector(ERC20.transfer.selector, adapter, amountIn);
        // values[0] = 0;

        // Build swap data - adapter swaps and sends tokenOut to boringVault.
        targets[1] = adapter;
        targetData[1] = abi.encodeWithSelector(
            IAdapter.swap.selector, amountIn, amountOutMin, address(tokenIn), address(tokenOut), boringVault
        );
        // values[1] = 0;

        // Track tokenOut balance before swap.
        uint256 tokenOutBalanceBefore = tokenOut.balanceOf(boringVault);

        // Make the manage call.
        manager.manageVaultWithMerkleVerification(manageProofs, decodersAndSanitizers, targets, targetData, values);

        // Check slippage.
        uint256 amountOut = tokenOut.balanceOf(boringVault) - tokenOutBalanceBefore;
        if (amountOut < amountOutMin) {
            revert YakSwapAdapterUManager__InsufficientAmountOut(amountOut, amountOutMin);
        }
    }
}
