// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {BaseDecoderAndSanitizer, DecoderCustomTypes} from "src/base/DecodersAndSanitizers/BaseDecoderAndSanitizer.sol";
import {AaveV3DecoderAndSanitizer} from "src/base/DecodersAndSanitizers/Protocols/AaveV3DecoderAndSanitizer.sol";
import {BenqiDecoderAndSanitizer} from "src/base/DecodersAndSanitizers/Protocols/BenqiDecoderAndSanitizer.sol";
import {BlackholeDecoderAndSanitizer} from
    "src/base/DecodersAndSanitizers/Protocols/BlackholeDecoderAndSanitizer.sol";
import {DeltaPrimeDecoderAndSanitizer} from "src/base/DecodersAndSanitizers/Protocols/DeltaPrimeDecoderAndSanitizer.sol";
import {ERC4626DecoderAndSanitizer} from "src/base/DecodersAndSanitizers/Protocols/ERC4626DecoderAndSanitizer.sol";
import {LFJLBRouterDecoderAndSanitizer} from
    "src/base/DecodersAndSanitizers/Protocols/LFJLBRouterDecoderAndSanitizer.sol";
import {LFJLBHooksSimpleRewarderDecoderAndSanitizer} from
    "src/base/DecodersAndSanitizers/Protocols/LFJLBHooksSimpleRewarderDecoderAndSanitizer.sol";
import {LFJLBPairDecoderAndSanitizer} from
    "src/base/DecodersAndSanitizers/Protocols/LFJLBPairDecoderAndSanitizer.sol";
import {MasterChefDecoderAndSanitizer} from "src/base/DecodersAndSanitizers/Protocols/MasterChefDecoderAndSanitizer.sol";
import {MerklDecoderAndSanitizer} from "src/base/DecodersAndSanitizers/Protocols/MerklDecoderAndSanitizer.sol";
import {SiloIncentivesController} from "src/base/DecodersAndSanitizers/Protocols/silo/SiloIncentivesController.sol";
import {YakStrategyDecoderAndSanitizer} from
    "src/base/DecodersAndSanitizers/Protocols/YakStrategyDecoderAndSanitizer.sol";
import {YakSimpleSwapDecoderAndSanitizer} from
    "src/base/DecodersAndSanitizers/Protocols/YakSimpleSwapDecoderAndSanitizer.sol";

contract MilkUSDAIDecoderAndSanitizer is
    BaseDecoderAndSanitizer,
    AaveV3DecoderAndSanitizer,
    BenqiDecoderAndSanitizer,
    BlackholeDecoderAndSanitizer,
    DeltaPrimeDecoderAndSanitizer,
    ERC4626DecoderAndSanitizer,
    LFJLBRouterDecoderAndSanitizer,
    LFJLBHooksSimpleRewarderDecoderAndSanitizer,
    LFJLBPairDecoderAndSanitizer,
    MasterChefDecoderAndSanitizer,
    MerklDecoderAndSanitizer,
    SiloIncentivesController,
    YakStrategyDecoderAndSanitizer,
    YakSimpleSwapDecoderAndSanitizer
{
    constructor(address _boringVault) 
        BaseDecoderAndSanitizer(_boringVault)
    {}

    function deposit(uint256) 
        external 
        pure 
        override(BlackholeDecoderAndSanitizer, DeltaPrimeDecoderAndSanitizer, YakStrategyDecoderAndSanitizer)
        returns (bytes memory addressesFound)
    {
        // No addresses to sanitize
        return addressesFound;
    }

    function withdraw(uint256)
        external
        pure
        override(BlackholeDecoderAndSanitizer, YakStrategyDecoderAndSanitizer)
        returns (bytes memory addressesFound)
    {
        // No addresses to sanitize
        return addressesFound;
    }
}
