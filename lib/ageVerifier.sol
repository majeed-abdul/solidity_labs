// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract AgeVerifier {
    function checkEligibility(uint age) public pure returns (bool){
        if (age>=18){
            return true;
        }
        else {
            return false;
        }
    }
    function TcheckEligibility(uint age) public pure returns (bool){
        return age>=18? true:false;
    }
}