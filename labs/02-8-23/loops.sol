// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract Loop {
    uint[] data;
    function loop() public returns (uint[] memory) {
        for (uint8 i = 1; i < 20; i=i+2) {
            data.push(i);
        }
        return data;
    }

    function getter()public view returns(uint[] memory){
        return data;
    }
}

contract ControlFlow {

    function whileTest() public pure returns(uint256){
        uint sum = 0;
        uint i = 0;
        while(i < 15){
            sum +=i;        //  sum=sum+i
            i++;
        }
        return(sum);
    }

    function forTest() public pure returns(uint256){
        uint sum = 0;
        for (uint i=0;i<15;i++){
            sum +=i;        //  sum=sum+i
        }
        return(sum);
        
    }

    function dowhileTest() public pure returns(uint256){
        uint sum = 0;
        uint i = 0;
        do{            
            sum +=i;        //  sum=sum+i
            i++;
        }while(i < 15);
        return(sum);
    }
}
