// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import {Script} from "forge-std/Script.sol";
import {Inheritance} from "../src/Inheritance.sol";

contract DeployInheritance is Script {
    function run() external returns (Inheritance) {

        vm.startBroadcast();

        address inheritor = 0xcFAbD3697Cb170A03D7A67cFF59ed39786d53d6A;
        Inheritance inheritance = new Inheritance(inheritor);

        vm.stopBroadcast();

        return inheritance;
    }
}