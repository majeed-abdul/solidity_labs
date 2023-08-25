// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Ownable{
    address public owner;
    constructor(){
        owner=msg.sender;
    }
    event LogOwnershipTransferd(address indexed _currentOwner,address indexed _newOwner);


    modifier onlyOwner(){
        require(msg.sender==owner);
        _;
    }
}