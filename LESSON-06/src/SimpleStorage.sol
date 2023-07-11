// SPDX-License-Indentifier : MIT
pragma solidity ^0.8.14;
contract SimpleStorage
{
    uint public favoriteNumber;
    struct person
    {
        uint  favNumber;
        string name;
    }
    mapping (string => uint )public favnumperson;
    person[] public  myfriends;
    function store(uint _favoriteNumber) public
    {
        favoriteNumber=_favoriteNumber;
    }
    function addfriend(string memory name,uint favnum) public
    {
        myfriends.push(person(favnum,name));
        favnumperson[name]=favnum;
    }
    function getfavnum(string memory name) view public returns (uint)
    {
        return favnumperson[name];
    }
}
