// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {IRamsesV3PositionManager} from "src/interfaces/IRamsesV3PositionManager.sol";
import {BaseDecoderAndSanitizer, DecoderCustomTypes} from "src/base/DecodersAndSanitizers/BaseDecoderAndSanitizer.sol";

abstract contract RamsesV3DecoderAndSanitizer is BaseDecoderAndSanitizer {
    //============================== ERRORS ===============================

    error RamsesV3DecoderAndSanitizer__BadTokenId();

    //============================== IMMUTABLES ===============================

    /**
     * @notice The networks Ramses nonfungible position manager.
     * @notice Avalanche 0x0B4478e810D48B5882D4019D435A2f864Bab4F39
     * @notice
     */
    IRamsesV3PositionManager
        internal immutable ramsesNonFungiblePositionManager;

    constructor(address _ramsesNonFungiblePositionManager) {
        ramsesNonFungiblePositionManager = IRamsesV3PositionManager(
            _ramsesNonFungiblePositionManager
        );
    }

    //============================== RAMSES V3 ===============================

    function mint(
        DecoderCustomTypes.RamsesMintParams calldata params
    ) external pure virtual returns (bytes memory addressesFound) {
        // Return addresses found
        addressesFound = abi.encodePacked(
            params.token0,
            params.token1,
            params.recipient
        );
    }

    function increaseLiquidity(
        DecoderCustomTypes.IncreaseLiquidityParams calldata params
    ) external view virtual returns (bytes memory addressesFound) {
        // Sanitize raw data
        // NOTE ownerOf check is done in PositionManager contract as well, but it is added here
        // just for completeness.
        if (
            ramsesNonFungiblePositionManager.ownerOf(params.tokenId) !=
            boringVault
        ) {
            revert RamsesV3DecoderAndSanitizer__BadTokenId();
        }

        // Nothing to return
        return addressesFound;
    }

    function decreaseLiquidity(
        DecoderCustomTypes.DecreaseLiquidityParams calldata params
    ) external view virtual returns (bytes memory addressesFound) {
        // Sanitize raw data
        // NOTE ownerOf check is done in PositionManager contract as well, but it is added here
        // just for completeness.
        if (
            ramsesNonFungiblePositionManager.ownerOf(params.tokenId) !=
            boringVault
        ) {
            revert RamsesV3DecoderAndSanitizer__BadTokenId();
        }

        // Nothing to return
        return addressesFound;
    }

    function collect(
        DecoderCustomTypes.CollectParams calldata params
    ) external view virtual returns (bytes memory addressesFound) {
        // Sanitize raw data
        // NOTE ownerOf check is done in PositionManager contract as well, but it is added here
        // just for completeness.
        if (
            ramsesNonFungiblePositionManager.ownerOf(params.tokenId) !=
            boringVault
        ) {
            revert RamsesV3DecoderAndSanitizer__BadTokenId();
        }

        // Return addresses found
        addressesFound = abi.encodePacked(params.recipient);
    }

    function burn(
        uint256 /*tokenId*/
    ) external pure virtual returns (bytes memory addressesFound) {
        // positionManager.burn(tokenId) will verify that the tokenId has no liquidity, and no tokens owed.
        // Nothing to sanitize or return
        return addressesFound;
    }

    function getReward(
        uint256 /*tokenId*/,
        address[] calldata tokens
    ) external pure virtual returns (bytes memory addressesFound) {
        uint256 tokensLength = tokens.length;
        for (uint256 i; i < tokensLength; ++i) {
            addressesFound = abi.encodePacked(addressesFound, tokens[i]);
        }
    }
}
