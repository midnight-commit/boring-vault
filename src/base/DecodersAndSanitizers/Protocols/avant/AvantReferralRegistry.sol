// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {BaseDecoderAndSanitizer} from "src/base/DecodersAndSanitizers/BaseDecoderAndSanitizer.sol";

abstract contract AvantReferralRegistry is BaseDecoderAndSanitizer {
    //============================== Avant ===============================

    function acknowledgeReferrer(string calldata /*key*/, address referrer) public pure virtual returns (bytes memory addressesFound) {
        addressesFound = abi.encodePacked(referrer);
    }
}