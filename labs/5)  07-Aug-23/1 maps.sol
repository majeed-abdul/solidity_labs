// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Mapper {
    mapping(uint => string) addresses;

    function set(uint _addr, string memory _name) public {
        addresses[_addr] = _name;
    }

    function get(uint _addr) public view returns (string memory) {
        return addresses[_addr];
    }
    function reset(uint _addr) public {
        delete addresses[_addr];
    }
}
contract NestedMapper {
    mapping(uint => mapping(uint => string)) addresses;

    function set(uint _add1,uint _add2, string memory _name) public {
        addresses[_add1][_add2] = _name;
    }

    function get(uint _add1,uint _add2) public view returns (string memory) {
        return addresses[_add1][_add2];
    }
    function reset(uint _add1,uint _add2) public {
        delete addresses[_add1][_add2];
    }
}