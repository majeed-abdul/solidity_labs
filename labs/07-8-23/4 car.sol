//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract car {
    struct CAR {
        string maker;
        string model;
        uint256 varient;
    }
    CAR car1=CAR("Toyota","Pirus",2010);

    function initCar1() public returns (CAR memory state, CAR memory local) {
        CAR storage _car = car1;
        _car.maker="Honda";
        return (car1, _car);
    }

    function initCar2() public view returns (CAR memory state, CAR memory local){
        CAR memory _car = car1;         
        _car.maker="Honda";       
        return (car1, _car);
    }
}
