// SPDX-License-Identifier: MIT
pragma solidity ^ 0.8.17 ;
contract Enum{
    enum dutyDay{
        none,
        sunday,
        monday,
        tuesday,
        wednesday,
        thusday,
        friday,
        satarday
    }
    mapping(address => student) private person;

    function get (address _add) public view returns(string memory,uint,dutyDay,uint[] memory){
        return (person[_add].name,person[_add].age,person[_add].dutyDay,person[_add].childrens_age);
    }

    function set (dutyDay _day,address _add,uint _age,string memory _name) public {
        person[_add].dutyDay=_day;
        person[_add].age=_age;
        person[_add].name=_name;
    }

    function pushChildAge(address _addr,uint _age) public {
        person[_addr].childrens_age.push(_age);
    }
    
    function popChildAge(address _addr) public {
        person[_addr].childrens_age.pop();
    }

    struct student{
        string name;
        uint age;
        dutyDay dutyDay;
        uint[] childrens_age;
    }
    

}
