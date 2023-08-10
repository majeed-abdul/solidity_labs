//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract Array{
    int[] public MyArray;
    function add(int value) public{
        MyArray.push(value);
    }
    function retrive(uint index) public view returns(int){
        return MyArray[index];
    }
    function deletee(uint index)public{
        delete MyArray[index];
    }
    function pop()public{
        MyArray.pop();
    }
    function length()public view returns(uint){
        return MyArray.length;
    }
}