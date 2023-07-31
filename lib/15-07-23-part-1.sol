// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
pragma solidity ^0.8.17;
contract StateVariable {
    // uint public storedData; // State variable
    uint public constant Pi=31415;
    // constructor() {
    //     storedData = 10; // Using State variable
    // }
    function circleArea(uint r) public pure returns (uint){
        return Pi/10000*r*r; 
    }
}
