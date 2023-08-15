// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Assert {
    function subtract(uint256 num1, uint256 num2)public pure returns (uint256){
        assert(num2<=num1);
        uint256 sub;
        sub = num1 - num2;
        return sub;
    }
}
contract DynamicArray {
    uint[] array;
    function adding(uint _num)public{
        array.push(_num);
    }
    function removing()public{
        assert(array.length>0);
        array.pop();
    }
    function getter()public view returns (uint[] memory){
        return array;
    }
    
}
