// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface Token {
    function transfer(address to, uint256 amount) external;
}
contract TokenContract is Token {
    mapping (address=>uint) public balance;
    constructor(){
        balance[msg.sender]+=1000;
    }
    function transfer(address to, uint256 amount) external{
        require(balance[msg.sender]>=amount,"insufficient balance");
        balance[msg.sender]-=amount;
        balance[to]+=amount;
    }
}