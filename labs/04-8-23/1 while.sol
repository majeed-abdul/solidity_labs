// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract Loop{
    uint[] public arr;
    function NaturalNum(uint max) public returns(uint[] memory){
        uint i = 4;
        while(i <= max){
            arr.push(i);
            i+=4;
        }
        return arr;
    }
    function getter()public view returns(uint[] memory){
        return arr;
    }
}
contract NumberProcessor {
    function calculateSumAndAverage(uint256[5] memory numbers) public pure returns (uint256 avg) {
        uint256 totalSum = 0;
        uint256 i = 0;
        while(i < numbers.length) {
            totalSum += numbers[i];
            i++;
        }
        avg = totalSum/5;
    }
}