// SPDX-License-Indentifier : MIT

pragma solidity ^0.8.14;
import {SimpleStorage} from "./SimpleStorage.sol";
contract Add5Storage is SimpleStorage
{
   function store(uint y) public override 
   {
       favoriteNumber=y+5;
   }
}
