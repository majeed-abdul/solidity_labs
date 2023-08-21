// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Student {
    string private stdName;
    uint256 private stdRollNum;

    // setting values of state variables
    constructor(string memory name, uint256 rollNum) {
        stdName = name;
        stdRollNum = rollNum;
    }
}

contract StudentsList {
    // array to store students ( composition )
    Student[] public students;

    constructor() {
        Student newStudent = new Student("Burak", 20);
        students.push(newStudent);
    }
}
