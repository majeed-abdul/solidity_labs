// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Base {
    uint256 public x;

    function setX(uint256 _x) public {
        x = _x;
    }
}

contract DerivedA is Base {
    function getX() public view returns (uint256) {
        return x;
    }
}

contract DerivedB is Base {
    function getXTimesTwo() public view returns (uint256) {
        return x * 2;
    }
}
contract DerivedC is Base {
    function getXCube() public view returns (uint256) {
        return x ** 3;
    }
}
