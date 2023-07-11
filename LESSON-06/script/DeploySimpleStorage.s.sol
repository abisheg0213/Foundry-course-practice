// SPDX-License-Indentifier : MIT
pragma solidity ^0.8.14;
import {SimpleStorage} from "../src/SimpleStorage.sol";
import {Script} from "../lib/forge-std/src/Script.sol";
contract DeploySimpleStorage is Script
{
    SimpleStorage instance;
    function run() public returns(SimpleStorage)
    {
        vm.startBroadcast();
        instance=new SimpleStorage();
        vm.stopBroadcast();
        return instance;
    }
}