// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import "./Mathlibrary.sol";


contract Task{    
    event SuccessEvent();
    event CatchEvent(string message);
    event CatchPanic(uint errorCode);
    event CatchByte(bytes data);
    function addition(uint a,uint b)public returns(uint result){
        try Math.sum(a, b) returns (uint _result){
            emit SuccessEvent();
            return _result;
        } catch Error(string memory reason) {
            emit CatchEvent(reason);
        } catch Panic(uint reason) {
            emit CatchPanic(reason);
        } catch (bytes memory reason) {
            emit CatchByte(reason);
        }
    }
    
    function subtraction(uint a,uint b)public returns(uint result){
        try Math.difference(a, b) returns (uint _result){
            emit SuccessEvent();
            return _result;
        } catch Error(string memory reason) {
            emit CatchEvent(reason);
        } catch Panic(uint reason) {
            emit CatchPanic(reason);
        } catch (bytes memory reason) {
            emit CatchByte(reason);
        }
    }
    
    function exponent(uint a,uint b)public returns(uint result){
        try Math.power(a, b) returns (uint _result){
            emit SuccessEvent();
            return _result;
        } catch Error(string memory reason) {
            emit CatchEvent(reason);
        } catch Panic(uint reason) {
            emit CatchPanic(reason);
        } catch (bytes memory reason) {
            emit CatchByte(reason);
        }
    }
}