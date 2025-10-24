// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {BaseDecoderAndSanitizer} from "src/base/DecodersAndSanitizers/BaseDecoderAndSanitizer.sol";

abstract contract AvantMintingV2 is BaseDecoderAndSanitizer {
    //============================== Avant ===============================

    function setDelegatedSigner(address _delegateTo)
        external
        pure
        virtual
        returns (bytes memory addressesFound)
    {
        addressesFound = abi.encodePacked(_delegateTo);
    }
    
    function removeDelegatedSigner(address _removedSigner)
        external
        pure
        virtual
        returns (bytes memory addressesFound)
    {
        addressesFound = abi.encodePacked(_removedSigner);
    }
}
