//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract StudentRegSystem {
    enum Department {
        AI,         //  0
        Blockchain, //  1
        E_Commerce, //  2
        Arts        //  3
    }
    enum Status {
        Enrolled,   //  0
        NotEnrolled,//  1
        Graduated,  //  2
        Expelled    //  3
    }
    struct Student {
        string name;
        uint256 age;
        uint256 date; // 31-Sep-2023 => 31092023
        Department departnment;
        Status status;
        uint obtainedMarks;
    }
    
    mapping (uint=>Student) allStudents;
    uint[] rollNoumbers;

    function register(string memory _name,uint256 _age,uint256 _date,Department _departnment,Status _status,uint _obtainedMarks)public{
        uint _roll=rollNoumbers.length+1;
        allStudents[_roll]=Student(_name,_age,_date,_departnment,_status,_obtainedMarks); 
        rollNoumbers.push(_roll);    
    }
    function update()public{
        
    }
    function register()public{
        
    }
    function retrieve()public{
        
    }
    function countOfStudents()public{
        
    }
    function top3Achivers()public{
        
    }
}
    //
    //     CAR car1=CAR("Toyota","Pirus",2010);

    //     function initCar1() public returns (CAR memory state, CAR memory local) {
    //         CAR storage _car = car1;
    //         _car.maker="Honda";
    //         return (car1, _car);
    //     }

    //     function initCar2() public view returns (CAR memory state, CAR memory local){
    //         CAR memory _car = car1;
    //         _car.maker="Honda";
    //         return (car1, _car);
    //     }
// }
