// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {BaseDecoderAndSanitizer} from "src/base/DecodersAndSanitizers/BaseDecoderAndSanitizer.sol";

abstract contract BenqiDecoderAndSanitizer is BaseDecoderAndSanitizer {
    //============================== Benqi ===============================

    function mint(uint256 /*amount*/ )
        external
        pure
        virtual
        returns (bytes memory addressesFound)
    {
        // No addresses to sanitize
        return addressesFound;
    }

    // Payable variant for mint
    function mint()
        external
        pure
        virtual
        returns (bytes memory addressesFound)
    {
        // No addresses to sanitize
        return addressesFound;
    }

    function redeemUnderlying(uint256 /*amount*/ )
        external
        pure
        virtual
        returns (bytes memory addressesFound)
    {
        // No addresses to sanitize
        return addressesFound;
    }

    function borrow(uint256 /*borrowAmount*/ )
        external
        pure
        virtual
        returns (bytes memory addressesFound)
    {
        // No addresses to sanitize
        return addressesFound;
    }

    function repayBorrow(uint256 /*repayAmount*/ )
        external
        pure
        virtual
        returns (bytes memory addressesFound)
    {
        // No addresses to sanitize
        return addressesFound;
    }

    // Payable variant for repayBorrow
    function repayBorrow()
        external
        pure
        virtual
        returns (bytes memory addressesFound)
    {
        // No addresses to sanitize
        return addressesFound;
    }

    //============================== Comptroller ===============================

    function enterMarkets(address[] calldata markets)
        external
        pure
        virtual
        returns (bytes memory addressesFound)
    {
        uint256 marketsLength = markets.length;
        for (uint256 i; i < marketsLength; ++i) {
            addressesFound = abi.encodePacked(addressesFound, markets[i]);
        }
    }

    function exitMarket(address market)
        external
        pure
        virtual
        returns (bytes memory addressesFound)
    {
        return abi.encodePacked(market);
    }
}
