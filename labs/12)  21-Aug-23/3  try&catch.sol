// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract PrimeChecker {
    constructor(uint256 a) {
        require(a != 0, "Invalid Entry");
        assert(a != 1);
    }

    function isPrime(uint256 b) internal pure returns (bool) {
        if (b <= 1) {
            return false;
        }
        if (b == 2) {
            return true;
        }
        if (b % 2 == 0) {
            return false;
        }
        for (uint256 i = 3; i * i <= b; i += 2) {
            if (b % i == 0) {
                return false;
            }
        }
        return true;
    }

    function onlyPrime(uint256 b) external pure returns (bool success) {
        // revert when a non-prime number is entered
        require(isPrime(b), "Ups! Reverting");
        success = true;
    }
}

contract TryCatch {
    // success event
    event SuccessEvent();
    // failure event
    event CatchEvent(string message);
    event CatchByte(bytes data);
    PrimeChecker even;

    constructor() {
        even = new PrimeChecker(2);
    }

    function execute(uint256 amount) external returns (bool success) {
        try even.onlyPrime(amount) returns (bool _success) {
            emit SuccessEvent();
            return _success;
        } catch Error(string memory reason) {
            // if call fails
            emit CatchEvent(reason);
        }
    }

    function executeNew(uint256 a) external returns (bool success) {
        try new PrimeChecker(a) returns (PrimeChecker _even) {
            // if call succeeds
            emit SuccessEvent();
            success = _even.onlyPrime(a);
        } catch Error(string memory reason) {
            emit CatchEvent(reason);
        } catch (bytes memory reason) {
            emit CatchByte(reason);
        }
    }
}
contract SimpleDivision{
    event Answer(uint);
    function Div2Nums(uint p,uint q)public{
        emit Answer(p/q);
    }
}
contract TryCatchDivision  {    
    event SuccessEvent();
    event CatchEvent(string message);
    event CatchByte(bytes data);
    SimpleDivision d;
    function Div2Nums(uint p,uint q)public{
        try d.Div2Nums(p, q){
            emit SuccessEvent();
        } catch Error(string memory reason) {
            emit CatchEvent(reason);
        } catch (bytes memory reason) {
            emit CatchByte(reason);
        }
    }
}