// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Loop {
    uint256[] public arr;
    function ODDNum(uint256 max) public {
        uint256 i = 1;
        do {
            if (i % 2 != 0) arr.push(i);
            i++;
        }while(i<=max);
    }
    function get() public view returns (uint256[] memory) {
        return arr;
    }
}
