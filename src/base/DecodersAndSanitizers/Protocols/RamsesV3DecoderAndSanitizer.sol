// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {IRamsesV3PositionManager} from "src/interfaces/IRamsesV3PositionManager.sol";
import {BaseDecoderAndSanitizer, DecoderCustomTypes} from "src/base/DecodersAndSanitizers/BaseDecoderAndSanitizer.sol";

abstract contract RamsesV3DecoderAndSanitizer is BaseDecoderAndSanitizer {
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
        DecoderCustomTypes.IncreaseLiquidityParams calldata /*params*/
    ) external view virtual returns (bytes memory addressesFound) {
        // Nothing to sanitize or return
        return addressesFound;
    }

    function decreaseLiquidity(
        DecoderCustomTypes.DecreaseLiquidityParams calldata /*params*/
    ) external view virtual returns (bytes memory addressesFound) {
        // Nothing to sanitize or return
        return addressesFound;
    }

    function collect(
        DecoderCustomTypes.CollectParams calldata params
    ) external view virtual returns (bytes memory addressesFound) {
        addressesFound = abi.encodePacked(params.recipient);
    }

    function burn(
        uint256 /*tokenId*/
    ) external pure virtual returns (bytes memory addressesFound) {
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
