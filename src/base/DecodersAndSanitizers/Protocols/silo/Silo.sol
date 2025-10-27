// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {BaseDecoderAndSanitizer} from "src/base/DecodersAndSanitizers/BaseDecoderAndSanitizer.sol";

abstract contract Silo is BaseDecoderAndSanitizer {
    //============================== Silo ===============================

    function borrow(uint256 /*_assets*/, address _receiver, address _borrower)
        external
        pure
        virtual
        returns (bytes memory addressesFound)
    {
        addressesFound = abi.encodePacked(_receiver, _borrower);
    }

    function borrowShares(uint256 /*_shares*/, address _receiver, address _borrower)
        external
        pure
        virtual
        returns (bytes memory addressesFound)
    {
        addressesFound = abi.encodePacked(_receiver, _borrower);
    }

    function repay(uint256 /*_assets*/, address _borrower)
        external
        pure
        virtual
        returns (bytes memory addressesFound)
    {
        addressesFound = abi.encodePacked(_borrower);
    }

    function repayShares(uint256 /*_shares*/, address _borrower)
        external
        pure
        virtual
        returns (bytes memory addressesFound)
    {
        addressesFound = abi.encodePacked(_borrower);
    }
}