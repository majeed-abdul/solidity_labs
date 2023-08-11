//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Events {
    // event Transfer(address indexed from, address indexed to, uint256 value);
    // function _transfer(address from,address to,uint256 amount) external {
    //     _balances[from] = 10000000; // give some initial tokens to transfer address
    //     _balances[from] -= amount; // "from" address minus the number of transfer
    //     _balances[to] += amount; // "to" address adds the number oftransfer // emit event
    //     emit Transfer(from, to, amount);
    // }

    // Event declaration
    // Up to 3 parameters can be indexed.
    // Indexed parameters helps you filter the logs by the indexed parameter
    event Log(address indexed sender, string msg);
    event Log2(string name, address contractAddress,string department);
    event AnotherLog();

    function test() public {
        emit Log(msg.sender, "Hello Web3.0");
        emit Log(msg.sender, "It's all about Decentralization");
        emit Log2("Majeed", msg.sender, "block-chain");
        emit AnotherLog();
    }
}
contract PersonContract {
    struct PersonInfo {
        string name;
        uint age;        
    }
    PersonInfo public P1=PersonInfo("majeed",23);
    event Update(PersonInfo oldValue,PersonInfo newValue,uint256 timestamp,uint256 blockNumber);
    function setPersonInfo(string calldata _name,uint _age) public {
        PersonInfo memory oldValue = P1;
        P1=PersonInfo(_name,_age);
        emit Update(oldValue, P1, block.timestamp, block.number);
    }
}
contract ZeroAddress{
    event ZeroAddressInputted(string message);
    constructor(address _initialOwner){
        if (_initialOwner==0x0000000000000000000000000000000000000000){
            emit ZeroAddressInputted("Zero Address inputted on deployment of contract");
        }
    }
}
contract NoPrime {
    uint public num;
    event PrimeChecker(string, uint);
    function setter(uint _inputNum) public{
        num=_inputNum;
    }
    function check(uint number) public {
       if (PrimeNo(number)){
           emit PrimeChecker("The Number is Prime", number);
        }else{
            emit PrimeChecker("The Number is not Prime", number);
        } 
    }
    function PrimeNo(uint n) private pure returns(bool){
        for(uint i=2 ; i < n/2 ; i++) {
            if(n%i == 0) {                
                return false;
            }
        }
        return true;
    }
}