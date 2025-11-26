// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {BaseDecoderAndSanitizer, DecoderCustomTypes} from "src/base/DecodersAndSanitizers/BaseDecoderAndSanitizer.sol";
import {RamsesV3DecoderAndSanitizer} from "src/base/DecodersAndSanitizers/Protocols/ramses/RamsesV3DecoderAndSanitizer.sol";

contract RamsesDecoderAndSanitizer is
    BaseDecoderAndSanitizer,
    RamsesV3DecoderAndSanitizer
{
    constructor(
        address _boringVault,
        address _ramsesNonFungiblePositionManager
    ) 
        BaseDecoderAndSanitizer(_boringVault)
        RamsesV3DecoderAndSanitizer(_ramsesNonFungiblePositionManager)
    {}
}
