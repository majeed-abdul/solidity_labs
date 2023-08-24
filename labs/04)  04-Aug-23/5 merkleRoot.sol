// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract MerkleTree {
    // Sum(H1,H2,H3,H4)
    // / \
    // Sum(H1,H2) Sum(H3,H4)
    // / \ / \
    // H1 H2 H3 H4
    uint[] arr = [1,1,1,1,1,1,1];

    function add() public {
        while (arr.length != 1) {
            if (arr.length % 2 == 1) {
                arr.push(0);  //  Pushes '0' When array is odd
            }
            for (uint256 i = 0; i < arr.length / 2; i++) {
                arr[i] = arr[i * 2] + arr[(i * 2) + 1];
            }
            for (uint256 i = 0; i < arr.length; i++) {
                arr.pop();  
            }
        }
    }
    function getter() public view returns (uint256[] memory) {
        return arr;
    }
}
