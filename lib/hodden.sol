// SPDX-License-Identifier: MIT
pragma solidity ^ 0.8.17 ;

contract Counter{
    uint public count;
    function increment() external {
        count +=1;
    }
}

interface ICounter {
    function increment() external ;
    function count() external view returns(uint); 
} 

contract MyCounter {
    function IntrecmentCaller(address _addr) public{
        ICounter(_addr).increment();
    }
    function countCaller(address _addr) public view returns(uint){
        return  ICounter(_addr).count();
    }
}