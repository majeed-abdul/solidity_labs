// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface Calculator {
    function getResult() external view returns (uint256);
}

contract Temp is Calculator {
    constructor() {}

    function getResult() external pure returns (uint256 result) {
        uint256 a = 2;
        uint256 b = 5;
        result = b / a;
    }
}
