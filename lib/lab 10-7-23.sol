// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract BooleanOperators {
    bool public _bool = true;
        function logicalNot() public view returns (bool) {
            return !_bool; }
        function logicalAnd() public view returns (bool) {
            return _bool && !_bool; }
        function logicalOr() public view returns (bool) {
            return _bool || !_bool; }
        function equality() public view returns (bool) {
            return _bool == !_bool; }
        function inequality() public view returns (bool) {
            return _bool != !_bool; }
}