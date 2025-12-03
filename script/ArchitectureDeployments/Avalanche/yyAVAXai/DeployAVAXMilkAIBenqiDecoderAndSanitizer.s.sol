// SPDX-License-Identifier: Apache-2.0
pragma solidity 0.8.21;

import {Deployer} from "src/helper/Deployer.sol";
import {AvalancheAddresses} from "../AvalancheAddresses.sol";
import {BenqiDecoderAndSanitizer} from "../../../../src/base/DecodersAndSanitizers/BenqiDecoderAndSanitizer.sol";

import "forge-std/Script.sol";

/**
 *  forge script script/ArchitectureDeployments/Avalanche/yyAVAXai/DeployAVAXMilkAIBenqiDecoderAndSanitizer.s.sol:DeployAVAXMilkAIBenqiDecoderAndSanitizer --account yak-deployer --broadcast --verifier-url 'https://api.routescan.io/v2/network/mainnet/evm/43114/etherscan' --etherscan-api-key "verifyContract" --verify
 * @dev Optionally can change `--with-gas-price` to something more reasonable
 */
contract DeployAVAXMilkAIBenqiDecoderAndSanitizer is Script, AvalancheAddresses {

    function setUp() external {
        vm.createSelectFork("avalanche");
    }

    function run() external {
        vm.startBroadcast();

        new BenqiDecoderAndSanitizer(aiAvaxBoringVault);

        vm.stopBroadcast();
    }
}