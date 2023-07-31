// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract ANDGate {
bool public _boolT = true;
bool public _boolF = false;
    function falseANDfalse() public view returns (bool) {
        return _boolF&&_boolF;}
    function falseANDtrue() public view returns (bool) {
        return _boolF&&_boolT;}
    function trueANDfalse() public view returns (bool) {
        return _boolT&&_boolT;}
    function trueANDtrue() public view returns (bool) {
        return _boolT&&_boolF;}
}