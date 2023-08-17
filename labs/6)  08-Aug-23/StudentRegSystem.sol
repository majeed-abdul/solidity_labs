//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract StudentRegSystem {
    enum Department {
        AI,         //  0
        BlockChain, //  1
        E_Commerce, //  2
        Arts        //  3
    }
    enum Status {
        NotEnrolled,//  0
        Enrolled,   //  1
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
    uint public studentLength;
    uint[3] top3;

    function register(string memory _name,uint256 _age,uint256 _date,Department _departnment)public returns(uint){
        uint _roll=studentLength+1;
        allStudents[_roll]=Student(_name,_age,_date,_departnment,Status.NotEnrolled,0); 
        studentLength++;    
        return _roll;
    }
    function update(uint _rollNo,string memory _name,uint256 _age,uint256 _date,Department _departnment,Status _status,uint _obtainedMarks)public{
        if(_rollNo>0||_rollNo<=studentLength){
            // Student memory stu=allStudents[_rollNo];
            allStudents[_rollNo]=Student(_name,_age,_date,_departnment,_status,_obtainedMarks); 
        }
        
    }
    function retrieve(uint _rollNo)public view returns(string memory name,uint256 age,uint256 date,Department departnment, Status status,uint obtainedMarks){
        return (allStudents[_rollNo].name,allStudents[_rollNo].age,allStudents[_rollNo].date,allStudents[_rollNo].departnment,allStudents[_rollNo].status,allStudents[_rollNo].obtainedMarks);        
    }
    function countOfStudents()public view returns(uint ai,uint blockChain,uint e_commerce,uint arts){
        uint _ai;
        uint _block;
        uint _ecom;
        uint _art;
        for(uint i=1;i<=studentLength;i+1){
            if(allStudents[i].departnment==Department(0)){
                _ai++;
            }else if(allStudents[i].departnment==Department(1)){
                _block++;
            }else if(allStudents[i].departnment==Department(2)){
                _ecom++;
            }else if(allStudents[i].departnment==Department(3)){
                _art++;
            }
        }
        return (_ai,_block,_ecom,_art);       
    }
    function topGetter()public view returns(uint[3] memory){
        return top3;
    }
    function top3Achivers()public {
        uint[] memory _arr=new uint[](studentLength);
        for(uint j=0;j<_arr.length;j++){
            for (uint k=0;k<_arr.length-1;k++){
                if(allStudents[_arr[k]].obtainedMarks<allStudents[_arr[k+1]].obtainedMarks){
                    uint _bucket=_arr[k+1];
                    _arr[k+1]=_arr[k];
                    _arr[k]=_bucket;
                }
            }
        }
        top3[0]=_arr[0];
        top3[1]=_arr[1];
        top3[2]=_arr[2];
    }
}