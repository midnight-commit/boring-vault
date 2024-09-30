// // SPDX-License-Identifier: Apache-2.0
pragma solidity 0.8.21;

// import {ITBPositionDecoderAndSanitizer} from
//     "src/base/DecodersAndSanitizers/Protocols/ITB/ITBPositionDecoderAndSanitizer.sol";
// import {EtherFiLiquidUsdDecoderAndSanitizer} from
//     "src/base/DecodersAndSanitizers/EtherFiLiquidUsdDecoderAndSanitizer.sol";
// import {PancakeSwapV3FullDecoderAndSanitizer} from
//     "src/base/DecodersAndSanitizers/PancakeSwapV3FullDecoderAndSanitizer.sol";
// import {AerodromeDecoderAndSanitizer} from "src/base/DecodersAndSanitizers/AerodromeDecoderAndSanitizer.sol";
// import {Deployer} from "src/helper/Deployer.sol";
// import {SepoliaAddresses} from "test/resources/SepoliaAddresses.sol";
// import {ContractNames} from "resources/ContractNames.sol";

// import "forge-std/Script.sol";
// import "forge-std/StdJson.sol";

// /**
//  *  source .env && forge script script/DeployDecoderAndSanitizer.s.sol:DeployDecoderAndSanitizerScript --with-gas-price 30000000000 --broadcast --etherscan-api-key $ETHERSCAN_KEY --verify
//  * @dev Optionally can change `--with-gas-price` to something more reasonable
//  */
// contract DeployDecoderAndSanitizerScript is Script, ContractNames, SepoliaAddresses {
//     uint256 public privateKey;
//     Deployer public deployer = Deployer(deployerAddress);

//     address boringVault = 0x08c6F91e2B681FaF5e17227F2a44C307b3C1364C;

//     function setUp() external {
//         privateKey = vm.envUint("ETHERFI_LIQUID_DEPLOYER");
//         vm.createSelectFork("optimism");
//     }

//     function run() external {
//         bytes memory creationCode;
//         bytes memory constructorArgs;
//         vm.startBroadcast(privateKey);

//         creationCode = type(AerodromeDecoderAndSanitizer).creationCode;
//         constructorArgs =
//             abi.encode(0xf0bb20865277aBd641a307eCe5Ee04E79073416C, 0x416b433906b1B72FA758e166e239c43d68dC6F29);
//         deployer.deployContract(EtherFiLiquidEthAerodromeDecoderAndSanitizerName, creationCode, constructorArgs, 0);

//         // creationCode = type(EtherFiLiquidUsdDecoderAndSanitizer).creationCode;
//         // constructorArgs = abi.encode(boringVault, uniswapV3NonFungiblePositionManager);
//         // deployer.deployContract(EtherFiLiquidUsdDecoderAndSanitizerName, creationCode, constructorArgs, 0);

//         vm.stopBroadcast();
//     }
// }
