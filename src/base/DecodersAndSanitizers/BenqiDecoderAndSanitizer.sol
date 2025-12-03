// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {BaseDecoderAndSanitizer, DecoderCustomTypes} from "src/base/DecodersAndSanitizers/BaseDecoderAndSanitizer.sol";
import {BenqiLendingDecoderAndSanitizer} from "src/base/DecodersAndSanitizers/Protocols/benqi/BenqiLendingDecoderAndSanitizer.sol";
import {BenqiSavaxDecoderAndSanitizer} from "src/base/DecodersAndSanitizers/Protocols/benqi/BenqiSavaxDecoderAndSanitizer.sol";

contract BenqiDecoderAndSanitizer is
    BaseDecoderAndSanitizer,
    BenqiLendingDecoderAndSanitizer,
    BenqiSavaxDecoderAndSanitizer
{
    constructor(
        address _boringVault
    ) 
        BaseDecoderAndSanitizer(_boringVault)
        BenqiLendingDecoderAndSanitizer()
        BenqiSavaxDecoderAndSanitizer()
    {}
}
