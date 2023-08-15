// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract Array {
    string[] public arr2;
    function push(string memory value ) public returns(uint){
        arr2.push(value);
        return arr2.length;
    }
    function pop() public returns(uint){
        arr2.pop();
        return arr2.length;
    }
    function length()public view returns(uint){
        return arr2.length;
    }
    function getter()public view returns (string[] memory){
        return arr2;
    }
}
// a) Declare a dynamic array of type string named arr2.
// b) Using push(), fill the array with your complete name.
// c) Return the length of the arr2 array.
// d) Using pop() remove the last name.
// e) Make a getter function for arr2, that now returns your first name.