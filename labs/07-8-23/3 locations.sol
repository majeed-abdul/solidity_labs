// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract StorageDLoc {
    uint256[] arr = [1, 2, 3]; // state variable

    function fStorage() public view {
        // Declare a local storage variable xStorage
        uint256[] memory xStorage = arr;
        xStorage[0] = 100;
    }

    function get() public view returns (uint256[] memory) {
        return arr;
    }
}

contract MemoryAssignment {
    function modifyMemory(uint256[] memory originalArray)
        public
        pure
        returns (uint256[] memory)
    {
        // Assign the input array to a new variable in memory
        uint256[] memory newArray = originalArray;
        // Modify a value within the new array
        if (newArray.length > 0) {
            newArray[0] = 999;
        }
        return originalArray; // Return the original array
    }
}

contract calldataDloc {
    function fCalldata(uint256[] calldata _x)
        public
        pure
        returns (uint256[] calldata)
    {
        // _x[0] = 0;
        return (_x);
    }
}
