// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract InputValidator{
    mapping (address=>uint) public wallets;
    constructor(){
        addAmounttoWallet(msg.sender, 10000);
    }
    function addAmounttoWallet(address _address,uint _amount)public{
        wallets[_address]=_amount;
    }
    function Transfer(uint _amount,address _recipient)public {
        require(_amount>0&&_amount<=100,"Balance is Insuficent");
        wallets[msg.sender]-=_amount;
        wallets[_recipient]+=_amount;
    }
}
contract QuotientCalculator{
    function calculateQuotient(uint _nominator,uint _denominator)public pure returns(uint){
        require(_denominator!=0);
        return _nominator/_denominator;
    }
}