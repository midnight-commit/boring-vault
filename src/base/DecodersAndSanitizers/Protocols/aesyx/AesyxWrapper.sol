// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {BaseDecoderAndSanitizer} from "src/base/DecodersAndSanitizers/BaseDecoderAndSanitizer.sol";

abstract contract AesyxWrapper is BaseDecoderAndSanitizer {
    //============================== AESYX ===============================

    function depositAndOpenTrove(
        uint256 /*ownerIndex*/,
        uint256 /*AXDAmount*/,
        uint256 /*collAmount*/,
        uint256 /*upperHint*/,
        uint256 /*lowerHint*/,
        uint256 /*annualInterestRate*/,
        uint256 /*maxUpfrontFee*/,
        address removeManager,
        address receiver,
        address axdReceiver
    )
        external
        pure
        virtual
        returns (bytes memory addressesFound)
    {
        return abi.encodePacked(removeManager, receiver, axdReceiver);
    }

    function depositAndAddColl(
        uint256 /*troveId*/,
        uint256 /*collAmount*/
    )
        external
        pure
        virtual
        returns (bytes memory addressesFound)
    {
        // No addresses to sanitize
        return addressesFound;
    }

    function depositAndAddCollToZombieTrove(
        uint256 /*troveId*/,
        uint256 /*collAmount*/,
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

    function withdraw(uint256 /*wrappedAmount*/)
        external
        pure
        virtual
        returns (bytes memory addressesFound)
    {
        // No addresses to sanitize
        return addressesFound;
    }

    function withdrawAll()
        external
        pure
        virtual
        returns (bytes memory addressesFound)
    {
        // No addresses to sanitize
        return addressesFound;
    }
}