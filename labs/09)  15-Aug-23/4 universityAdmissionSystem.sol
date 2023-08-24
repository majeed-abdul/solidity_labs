// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract UniversityAdmissionSystem{

    enum Department{
        Civil,      //  0
        Mechanic,   //  1
        Electrical, //  2
        Software    //  3
    }

    mapping (uint=>bool) admissionStatus;
    mapping (uint=>Department) chosenDepartment;

    function setAdmissionStatus(uint _studentID,bool _hasPassed)public{
        admissionStatus[_studentID]=_hasPassed;
    }

    function chooseDepartment(uint _studentID,Department _department)public{
        assert(admissionStatus[_studentID]);
        chosenDepartment[_studentID]=_department;
    }

}
