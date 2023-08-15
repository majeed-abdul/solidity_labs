// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract Circumference {
    uint public constant pi=31415;
    function circumference(uint r) public pure returns (uint c) {
        c= 2*(pi/10000)*r;
    }
}