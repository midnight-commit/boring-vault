// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {BaseDecoderAndSanitizer} from "src/base/DecodersAndSanitizers/BaseDecoderAndSanitizer.sol";

abstract contract AesyxBorrowerOperations is BaseDecoderAndSanitizer {
    //============================== AESYX ===============================

    function withdrawAXD(
        uint256 /*troveId*/, 
        uint256 /*AXDAmount*/, 
        uint256 /*maxUpfrontFee*/
    )
        external
        pure
        virtual
        returns (bytes memory addressesFound)
    {
        // No addresses to sanitize
        return addressesFound;
    }

    function repayAXD(
        uint256 /*troveId*/,
        uint256 /*AXDAmount*/
    )
        external
        pure
        virtual
        returns (bytes memory addressesFound)
    {
        // No addresses to sanitize
        return addressesFound;
    }

    function adjustTroveInterestRate(
        uint256 /*troveId*/, 
        uint256 /*newAnnualInterestRate*/, 
        uint256 /*upperHint*/, 
        uint256 /*lowerHint*/, 
        uint256 /*maxUpfrontFee*/
    )
        external
        pure
        virtual
        returns (bytes memory addressesFound)
    {
        // No addresses to sanitize
        return addressesFound;
    }

    function closeTrove(
        uint256 /*trodeId*/
    )
        external
        pure
        virtual
        returns (bytes memory addressesFound)
    {
        // No addresses to sanitize
        return addressesFound;
    }

    function withdrawColl(
        uint256 /*troveId*/,
        uint256 /*collWithdrawal*/
    )
        external
        pure
        virtual
        returns (bytes memory addressesFound)
    {
        // No addresses to sanitize
        return addressesFound;
    }

}