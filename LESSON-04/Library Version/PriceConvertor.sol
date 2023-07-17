pragma solidity ^0.8.14;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
library PriceConvertor
{
       function getPrice() public view returns (int)
    {
        AggregatorV3Interface instance=AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 price,,,)=instance.latestRoundData();
        return price;
    }
    function getconversion(uint minimum_usd) public view returns (uint256)
    {
        uint val=uint256(getPrice());
        uint res=(minimum_usd*(1e18))/val;
        return res;
    }
}
