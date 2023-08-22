// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
// import Foo.sol from current directory
import "./Callee.sol";

contract Import {
    Callee public demo = new Callee();

    // Test Callee.sol by getting it's name.
    function getdemoName() public view returns (string memory) {
        return demo.name();
    }
}
