// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Events {
    enum Quality {
        Good,
        Moderate,
        Bad
    }
    struct specs {
        string microprocessor;
        uint256 RAM;
    }
    //A single event can have multiple parameters
    event multi(string laptop, uint256 price);
    //You can also emit enums and structs as well
    //An event can have upto 3 indexed parameters
    event multiple(
        string laptop,
        uint256 indexed price,
        Quality indexed q,
        specs indexed s
    );
    //Naming the variable in an event is not necessary
    event mu(string, Quality);

    //You can also emit empty events
    event empty();
    event details(Quality quality,specs specfications,uint ROM);

    function emits() public {
        emit multi("Hp", 150000);
        emit multiple("dell", 100000, Quality.Good, specs("intel", 8));
        emit mu("Lenovo", Quality.Moderate);
        emit details(Quality.Good,specs("intel",8),512);
        emit empty();
    }
}
contract Eventss{
    address owner;
    constructor(){
        owner=msg.sender;
    }
    event owners(address previousOwner,address newOwner);
    function NewOwner(address _newOwner)public {
        emit owners(owner,_newOwner);
        owner=_newOwner;
    }
}
contract PersonContract{
    struct PersonalInfo{
        string name;
        uint age;
    }
    event Update(PersonInfo oldValue,PersonInfo newValue,uint256 timestamp,uint256 blockNumber);
    PersonInfo public P1;
}
