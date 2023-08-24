// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract Array {
    uint[4] public arr1;
    function convertElements() public {
        arr1[0]=2;
        arr1[3]=10;
    }
    function getter() public view returns(uint[4] memory){
        return arr1;
    } 
}
// a) Make a uint type fix-sized array of length 4 named arr1.
// b) Convert the 0th and 3rd element of arr1 into 2 and 10 respectively.
// c) Make a getter function for arr1.
