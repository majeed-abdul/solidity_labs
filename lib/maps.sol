// SPDX-License-Identifier: MIT
pragma solidity ^ 0.8.17 ;
contract Enum{
    enum WeekDay{
        none,
        sunday,
        monday,
        tuesday,
        wednesday,
        thusday,
        friday,
        satarday
    }
    mapping(address => WeekDay) private person;

    function get (address _add) public view returns(WeekDay){
        return person[_add];
    }
    function set (WeekDay _day,address _add) public  {
        person[_add]=_day;
    }
}
