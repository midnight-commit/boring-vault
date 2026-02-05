// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {BaseDecoderAndSanitizer} from "src/base/DecodersAndSanitizers/BaseDecoderAndSanitizer.sol";

abstract contract SparkRewardsDecoderAndSanitizer is BaseDecoderAndSanitizer {
    function claim(
        uint256, /* epoch */
        address account,
        address token,
        uint256, /* cumulativeAmount */
        bytes32, /* expectedMerkleRoot */
        bytes32[] calldata /* merkleProof */
    ) external pure virtual returns (bytes memory addressesFound) {
        addressesFound = abi.encodePacked(account, token);
    }
}
