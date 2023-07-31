// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract ThreeSeprateFunctions {   

    function function1() public pure returns (string memory,string memory,address ) {
        return ("Abdul Majeed","Male",0x472EbDcBB17076a3724C2bF14F234edD43103820);
    }  

    function function2() public pure returns (
        string memory name,
        string memory gender,
        address walletAddress
        ){
        return ("Abdul Majeed","Male",0x472EbDcBB17076a3724C2bF14F234edD43103820);
    }  

    function function3() public pure returns (
        string memory name,
        string memory gender,
        address walletAddress
        ){
        name="Abdul Majeed";
        gender="Male";
        walletAddress=0x472EbDcBB17076a3724C2bF14F234edD43103820;
    } 
}