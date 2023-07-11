// SPDX-License-Indentifier : MIT
pragma solidity ^0.8.14;
import {SimpleStorage} from "../src/SimpleStorage.sol";
import {Test} from "../lib/forge-std/src/Test.sol";
contract TestSimpleStorage
{
    SimpleStorage instance;
    function setUp() public 
    {
        instance=new SimpleStorage();
    }
    function testStore() public
    {
        instance.store(56);
        assert(instance.favoriteNumber()==56);
    }
    function testFriendStore() public
    {
       instance.addfriend("john", 86);
       assert(instance.getfavnum("john")==86);
    }
}