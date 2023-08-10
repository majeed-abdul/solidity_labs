//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
contract Enum{
    enum Exam{
        Checking,   //  0  Default
        Pass,       //  1
        Fail,       //  2
        Scholarship //  3
    }
    Exam public e1;
    Exam public e2 = Exam.Scholarship;
    Exam public e3 = Exam(2); // it returns the value 2=Fail

    mapping(Exam=>Exam) a;

    function Fail() public{
        if(e1 == Exam.Checking){    // e1 to Fail, only if ‘e1’ is in the Checking state
            e1 = Exam.Fail;
        }
    }

    function Scholarship() public{
        if(e1 == Exam.Pass){    // e1 to Scholarship, only if ‘e1’ is in Pass state
            e1 = Exam.Scholarship;
        }
    }

    function iDelete() public{  //  Reset e1 to Default Value
        delete e1;
    }
}

contract PizzaDeli{
    enum PizaOrder{
        Pending,    //  0
        Preparing,  //  1
        Delivering, //  2
        Recieved    //  3
    }

    PizaOrder public P1;
    PizaOrder public P2 = PizaOrder.Preparing;  //  Using method 1
    PizaOrder public P3 = PizaOrder(3);         //  Using method 2 
    function p1Setter(PizaOrder _value) public{ //  Setter for P1
        P1=_value;
    }

    function GetterAll() public view returns(PizaOrder,PizaOrder,PizaOrder){    //  All Getter
        return (P1,P2,P3);
    }




}