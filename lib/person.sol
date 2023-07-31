// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;
contract Person {

    string fName;
    string lName;

    function setFullName(string calldata _firstName, string calldata _lastName) public{
        fName=_firstName;
        lName=_lastName;
    }

    function getFullName() public view returns (string memory){
       return string(abi.encodePacked(fName, " ", lName));
    }
}
