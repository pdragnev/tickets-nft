// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.16;

import "forge-std/Script.sol";
import "../src/MintTickets.sol";

contract DeployTestnetScript is Script {
   function run() external {
        uint256 deployerPrivateKeyTestNet = vm.envUint("GOERLI_PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKeyTestNet);

        MintTickets mintTickets = new MintTickets();

        vm.stopBroadcast();
    }
}

contract DeployMainnetScript is Script {
   function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        MintTickets mintTickets = new MintTickets();

        vm.stopBroadcast();
    }
}