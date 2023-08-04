// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract FibonacciSeries {
    function generateFibonacci(uint256 n)
        public
        pure
        returns (uint256[] memory)
    {
        uint256[] memory fibonacciSeries = new uint256[](n);
        if (n >= 1) {
            fibonacciSeries[0] = 0;
        }
        if (n >= 2) {
            fibonacciSeries[1] = 1;
        }
        /********************** Change this Part Only ********************************
1. Initialization: unit i = 2.
2. Condition : i < n
3. Formula: fibonacciSeries[i] = fibonacciSeries[i - 1] + fibonacciSeries[i - 2];
4. Increment : i++
******************************************************************************
*/

        for (uint256 i = 2; i < n; i++) {
            fibonacciSeries[i] =
                fibonacciSeries[i - 1] +
                fibonacciSeries[i - 2];
        }

        return fibonacciSeries;
    }
}

contract Loop {
    //The value of cond that you will input will decide
    //the number of times the loop is run
    function iterate(uint256 con) public pure returns (uint256) {
        uint256 i;
        uint256 iteration;
        do {
            iteration++;
            i++;
        } while (i < con);
        //If you input the value of 'cond' as 0, the condition will be false
        //on the first try, however you will notice that the loop still runs once
        return iteration;
    }
}
