pragma solidity ^0.8.14;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol"; 
contract FundMe
{
    address [] public funders;
    mapping (address =>uint) amountfunded;
    address payable owner;
    constructor()
    {
        owner=payable(msg.sender);
    }

    function fund() public payable 
    {
        require(getConversion(msg.value)>=min_usd,"Required amount is not given");
        funders.push(msg.sender);
        amountfunded[msg.sender]+=msg.value;

    }
     function withdraw() public{
        uint balance=address(this).balance;
        owner.transfer(balance);
    }
    uint min_usd=5*1e18;
    function getPrice() view public returns(uint)
    {
        AggregatorV3Interface instance=AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int price,,,)=instance.latestRoundData();
        return uint(price*1e10);
    }
    function getConversion(uint ethamount) public view returns  (uint)
    {
        return (ethamount*getPrice())/1e18;
    }
}
