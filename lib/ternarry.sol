// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract ternary {  

    function returnfee(uint age,bool isGirl) public pure returns (string memory ,string memory){
        // return age>18?"adult":"child";
        // string memory gift="";
        // gift = age<18&&isGirl?"barbiDoll":"bayblad";
        // return age>18?("adult fee",gift):("child fee",gift);
        // return age<18?("child fee",isGirl?"barbiDoll":"bayblad"):("adult fee","noGift");
        
        return age<10?("child fee",(isGirl?"barbiDoll":"bayblad")):(age>50?("oldAgeFee","$50FoodVocher"):("adult_fee","noGift"));

    }
    function returnifelse(uint u2) public pure returns (string memory){
        if(u2<256){
            return "stored in uint8";
        }
        else if(u2<65536){
            return "stored in uint16";
        }
        else{
            return "value cannot be stored in uint8 or uint16";
        }

    }
}