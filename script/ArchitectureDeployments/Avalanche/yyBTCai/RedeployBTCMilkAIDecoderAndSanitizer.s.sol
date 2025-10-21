// SPDX-License-Identifier: Apache-2.0
pragma solidity 0.8.21;

import {Deployer} from "src/helper/Deployer.sol";
import {AvalancheAddresses} from "../AvalancheAddresses.sol";
import {MilkBTCAIDecoderAndSanitizer} from "../../../../src/base/DecodersAndSanitizers/MilkBTCAIDecoderAndSanitizer.sol";

import "forge-std/Script.sol";

/**
 *  forge script script/ArchitectureDeployments/Avalanche/yyBTCai/RedeployBTCMilkAIDecoderAndSanitizer.s.sol:RedeployBTCMilkAIDecoderAndSanitizer --account yak-deployer --broadcast --verifier-url 'https://api.routescan.io/v2/network/mainnet/evm/43114/etherscan' --etherscan-api-key "verifyContract" --verify
 * @dev Optionally can change `--with-gas-price` to something more reasonable
 */
contract RedeployBTCMilkAIDecoderAndSanitizer is Script, AvalancheAddresses {
    address public boringVault = 0x0FB51627a4D9E01B24C427BB62Ed8d5C9018f8F6;

    function setUp() external {
        vm.createSelectFork("avalanche");
    }

    function run() external {
        vm.startBroadcast();

        new MilkBTCAIDecoderAndSanitizer(boringVault);

        vm.stopBroadcast();
    }
}