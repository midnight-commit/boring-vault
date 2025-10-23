// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {BaseDecoderAndSanitizer} from "src/base/DecodersAndSanitizers/BaseDecoderAndSanitizer.sol";

abstract contract AesyxStabilityPool is BaseDecoderAndSanitizer {
    //============================== AESYX ===============================

    function provideToSP(uint256 /*amount*/, bool /*doClaim*/)
        external
        pure
        virtual
        returns (bytes memory addressesFound) {
        // No addresses to sanitize
        return addressesFound;
    }

    function withdrawFromSP(uint256 /*amount*/, bool /*doClaim*/)
        external
        pure
        virtual
        returns (bytes memory addressesFound) {
        // No addresses to sanitize
        return addressesFound;
    }
}