// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// contract Base {
//     uint256 public x;

//     function setX(uint256 _x) public {
//         x = _x;
//     }
// }

// contract DerivedA is Base {
//     function getX() public view returns (uint256) {
//         return x;
//     }
// }

// contract DerivedB is Base {
//     function getXTimesTwo() public view returns (uint256) {
//         return x * 2;
//     }
// }
// contract DerivedC is Base {
//     function getXCube() public view returns (uint256) {
//         return x ** 3;
//     }
// }

// contract Car{
//     uint public model;
//     string public maker;
// }
// contract ElectricCar is Car{
//     uint public batteryCapacity;

// }
// contract HybridCar is Car{
//     uint public gasTankCapacity;
// }

// contract Engine{
//     uint public horsePower;
// }
// contract Transmession{
//     string public gearType;
// }
// contract Car is Engine, Transmession{}

// contract WorkerRole{
//     function submitWork()public pure returns (string memory){
//         return "Work Submitted";
//     }
// }
// contract ClientRole{
//     function createProject()public pure returns (string memory){
//         return "project Created";
//     }
// }
// contract Freelancer is WorkerRole,ClientRole{}

// contract Participant{}
// contract Supplier{
//     function placrOrder()public pure returns (string memory){
//         return "order Placed";
//     }
// }
// contract Manufacturer{
//     function manufactureProduct()public pure returns (string memory){
//         return "product manifactured";
//     }
// }
// contract Product is Supplier,Manufacturer{
//     function trackProduct()public pure returns (string memory){
//         return "product destnation and location";
//     }
// }

/* Inheritance tree：
 Car
 / \
TOYOTA BMW
 \ /
 Supra
*/
contract Car {
    event Log(string message);

    function demo() public virtual {
        emit Log("Base Car demo Called");
    }

    function temp() public virtual {
        emit Log("Base Car temp Called");
    }
}

contract TOYOTA is Car {
    function demo() public virtual override {
        emit Log("TOYOTA demo called");
    }

    function temp() public virtual override {
        emit Log("TOYOTA temp called");
        super.temp();
    }
}

contract BMW is Car {
    function demo() public virtual override {
        emit Log("BMW demo called");
    }

    function temp() public virtual override {
        emit Log("BMW temp called");
        super.temp();
    }
}

contract Supra is TOYOTA, BMW {
    function demo() public override(TOYOTA, BMW) {
        super.demo();
    }

    function temp() public override(TOYOTA, BMW) {
        super.temp();
    }
}
