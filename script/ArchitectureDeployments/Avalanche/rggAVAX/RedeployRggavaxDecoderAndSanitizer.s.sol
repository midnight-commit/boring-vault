// SPDX-License-Identifier: Apache-2.0
pragma solidity 0.8.21;

import {Deployer} from "src/helper/Deployer.sol";
import {AvalancheAddresses} from "../AvalancheAddresses.sol";
import {SuzakuDecoderAndSanitizer} from "../../../../src/base/DecodersAndSanitizers/SuzakuDecoderAndSanitizer.sol";

import "forge-std/Script.sol";

/**
 *  source .env && forge script script/ArchitectureDeployments/Avalanche/rggAVAX/RedeployRggavaxDecoderAndSanitizer.s.sol:RedeployRggavaxDecoderAndSanitizer --broadcast --account deployer --verifier-url 'https://api.routescan.io/v2/network/mainnet/evm/43114/etherscan' --etherscan-api-key "verifyContract" --verify
 * @dev Optionally can change `--with-gas-price` to something more reasonable
 */
contract RedeployRggavaxDecoderAndSanitizer is Script, AvalancheAddresses {
    address public boringVault = 0x9D15A28fCB96AF5e26dd0EF546D6a777C0ec34cd;

    function setUp() external {
        vm.createSelectFork("avalanche");
    }

    function run() external {
        vm.startBroadcast();

        new SuzakuDecoderAndSanitizer(boringVault);

        vm.stopBroadcast();
    }
}
