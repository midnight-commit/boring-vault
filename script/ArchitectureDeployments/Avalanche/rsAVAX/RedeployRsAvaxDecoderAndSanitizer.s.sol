// SPDX-License-Identifier: Apache-2.0
pragma solidity 0.8.21;

import {Deployer} from "src/helper/Deployer.sol";
import {AvalancheAddresses} from "../AvalancheAddresses.sol";
import {SuzakuDecoderAndSanitizer} from "../../../../src/base/DecodersAndSanitizers/SuzakuDecoderAndSanitizer.sol";

import "forge-std/Script.sol";

/**
 *  source .env && forge script script/ArchitectureDeployments/Avalanche/rsAVAX/RedeployRsAvaxDecoderAndSanitizer.s.sol:RedeployRsAvaxDecoderAndSanitizer --broadcast --verifier-url 'https://api.routescan.io/v2/network/mainnet/evm/43114/etherscan' --etherscan-api-key "verifyContract" --verify
 * @dev Optionally can change `--with-gas-price` to something more reasonable
 */
contract RedeployRsAvaxDecoderAndSanitizer is Script, AvalancheAddresses {
    uint256 public privateKey;

    address public boringVault = 0xDf788AD40181894dA035B827cDF55C523bf52F67;

    function setUp() external {
        privateKey = vm.envUint("LIQUID_DEPLOYER");
        vm.createSelectFork("avalanche");
    }

    function run() external {
        vm.startBroadcast(privateKey);

        new SuzakuDecoderAndSanitizer(boringVault);

        vm.stopBroadcast();
    }
}
