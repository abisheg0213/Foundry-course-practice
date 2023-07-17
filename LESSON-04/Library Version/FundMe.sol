pragma solidity ^0.8.14;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import {PriceConvertor} from "./PriceConvertor.sol";
contract FundMe
{
    address [] public funders;
    mapping (address =>uint) amountfunded;
    address payable owner;
    using PriceConvertor for uint;
    constructor()
    {
        owner=payable(msg.sender);
    }
    uint public minimum_usd=5;
    function fund() public payable {
        require(msg.value >= minimum_usd.getconversion(),"Required amount not given");
        funders.push(msg.sender);
        amountfunded[msg.sender]+=msg.value;
    }
    function withdraw() public{
        uint balance=address(this).balance;
        owner.transfer(balance);
    }
}
