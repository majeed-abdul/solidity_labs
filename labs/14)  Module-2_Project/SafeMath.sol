// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

library SafeMath{
    function mul(uint a,uint b)public pure  returns(uint){
        if (a==0||b==0){//////////
            return 0;
        }
        uint c=a*b;
        assert(c/a==b);///////////
        return c;
    }
    function div(uint a,uint b)public pure returns(uint){
        assert(b!=0);////////////
        return a/b;
    }
    function sub(uint a,uint b) public pure returns (uint){
        assert(b<=a);////////////
        return a-b;
    }
    function add(uint a,uint b)public pure returns(uint){
        return a+b;
    }
}