// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ForLoop {
    uint256[] public numtable;

    function table(uint256 num) public {
        uint256 temp = num;
        for (uint256 i = 1; i <= 20; i++) {
            numtable.push(num);
            num += temp;
        }
    }

    function get() public view returns (uint256[] memory) {
        return numtable;
    }

    function resetarr() public {
        delete numtable;
    }
}

contract ForLoop2 {
    int256[5] public arr = [-9, 8, 7, -2, 1];
    int256[] public positarr;
    int256[] public nagitarr;

    function positivepart() public {
        for (uint256 i = 0; i < arr.length; i++) {
            if (arr[i] >= 0) {
                positarr.push(arr[i]);
            }
        }
    }

    function nagativepart() public {
        for (uint256 i = 0; i < arr.length; i++) {
            if (arr[i] < 0) {
                nagitarr.push(arr[i]);
            }
        }
    }

    function getposit() public view returns (int256[] memory) {
        return positarr;
    }

    function getnagit() public view returns (int256[] memory) {
        return nagitarr;
    }
}

contract Factorial {
    function createFact(uint256 n) public pure returns (uint256) {
        uint256 factvalue;
        if (n == 0) {
            factvalue = 1;
            return factvalue;
        } else {
            factvalue = 1;
            for (uint256 i = n; i > 0; i--) {
                factvalue *= i;
            }
        }
        return factvalue;
    }
}
