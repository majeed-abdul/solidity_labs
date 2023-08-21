// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Person{
    string name;
    uint age;
    constructor(string memory _n,uint _a){
        name=_n;
        age= _a;
    }
}

contract Patient is Person {
    string public disease;
    constructor(string memory _n,uint _a,string memory _d)Person(_n,_a){
        disease=_d;
    }
    function get()public view returns(string memory,uint,string memory){
        return (name,age,disease);
    }
}

contract HMS{    
    Patient[] list;
    function Add(string calldata _name,uint _age,string calldata _disease)public{
        list.push(new Patient(_name,_age,_disease));
    }
    function retrieve(uint _index)public view returns(string memory Name ,uint Age,string memory Disease){
        require(_index<list.length,"Invalid Index Entered");
        return list[_index].get();
    }
}