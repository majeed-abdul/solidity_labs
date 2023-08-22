// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

library Math {
    function sum(uint a, uint b) public pure returns (uint) {
        return a+b;
    }
    function difference(uint a, uint b) public pure returns (uint) {
        return a-b;
    }
    function power(uint256 a, uint256 b) public pure returns (uint) {
        return a**b;
    }
}