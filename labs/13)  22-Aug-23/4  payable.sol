// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Payable {
    address payable public owner;

    constructor() payable {
        owner = payable(msg.sender);
    }

    function deposite() public payable returns (uint256 account, uint256 cont) {
        cont = address(this).balance;
        account = owner.balance;
    }

    function notPayable() public view returns (uint256 account, uint256 cont) {
        cont = address(this).balance;
        account = owner.balance;
    }
}
