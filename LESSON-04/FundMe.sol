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
    uint public minimum_usd=5;
    function fund() public payable {
        require(msg.value >= getconversion(),"Required amount not given");
        funders.push(msg.sender);
        amountfunded[msg.sender]+=msg.value;
    }
    function withdraw() public{
        uint balance=address(this).balance;
        owner.transfer(balance);
    }
    //0x694AA1769357215DE4FAC081bf1f309aDC325306
    function getPrice() public view returns (int)
    {
        AggregatorV3Interface instance=AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 price,,,)=instance.latestRoundData();
        return price;
    }
    function getconversion() public view returns (uint256)
    {
        uint val=uint256(getPrice());
        uint res=(minimum_usd*(1e18))/val;
        return res;
    }
}
