// SPDX-License-Indentifier : MIT
pragma solidity ^0.8.14;
import {SimpleStorage} from "./SimpleStorage.sol";
contract StorageFactory
{
    SimpleStorage[] public listofinstances;
    function createsimplestorage() public 
    {
        SimpleStorage s=new SimpleStorage();
        listofinstances.push(s);
    }
    function addfavnumber(uint i,uint number) public
    {
        listofinstances[i].store(number);
    }
    function givefavnumber(uint i) view public returns (uint)
    {
        return listofinstances[i].favoriteNumber();
    }
}
