// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract IntegerChecker {
    function input(int _num) public pure returns(string memory) {
        if (_num<0){
            return "use \"int\" data type";
        }else{
            return "use \"uint\" date type";
        }
    }
}