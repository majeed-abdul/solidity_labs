// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract CustomError {
    uint256[] arr;
    
    error invalid(string,uint);
    function upush(uint256 num) public {
        if (IsPrime(num)) {
            revert invalid("number is not prime",num);
        }
        arr.push(num);
    }

    function IsPrime(uint256 num) private pure returns (bool) {
        if (num == 0 || num == 1) {
            return false;
        }
        for (uint256 i = 2; i <= num / 2; i++) {
            if (num % i == 0) {
                return true;
            }
        }
        return false;
    }
    function getter() public view returns(uint[] memory){
        return arr;
    }
}
contract DriverLicense {
    error TooYoung(string message,uint mimiumAge);
    function DriverID(uint _age) public pure returns (uint){
        if(_age<18){
            revert TooYoung("too young to drive vehicle",_age);
        }
        return 1543;
    }    
}
contract ATM {
    uint CashAvailable;
    error insufficientFunds(string message,uint availableCash);
    function MoneyWithdraw(uint _withdrawAmount)public {
        if(CashAvailable<_withdrawAmount){
            revert insufficientFunds("your request exeeds available cash on ATM",CashAvailable); 
        }
        CashAvailable-=_withdrawAmount;
    }
    function ATMRefill(uint _refillAmount)public{
        CashAvailable+=_refillAmount;
    }    
}
