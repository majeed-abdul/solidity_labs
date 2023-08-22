// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Encoding {
    function encode(address _address, uint256 data)public pure returns (bytes memory){
        return (abi.encode(_address, data));
    }
    function encodePacked(address _address, uint data) public pure returns(bytes memory result) {
        result = abi.encodePacked(_address, data);
    }
    function encodeWithSelector(address _address, uint data)public pure returns(bytes memory result) {
        result =abi.encodeWithSelector(bytes4(keccak256("encodeWithSelector(address, uint )")),_address, data);
    }
    function encodeWithSignature(address _address, uint data) public pure returns(bytes memory result) {
        result =abi.encodeWithSignature(("encodeWithSelector(address, uint)"),_address, data);
    }

}
contract Task{
    struct Laptop{
        string Model;
        uint Year;
        uint Memory;
        uint Storage;
    }
    Laptop[] stock;
    Laptop[] public stockDecoded;
    Laptop public L1_decode;
    bytes b;
    function addToStock(string memory _model,uint _year,uint _memory,uint _storage)public {
        stock.push(Laptop(_model,_year,_memory,_storage));
    }
    function encodeArray()public returns (bytes memory){
        require(stock.length>0,"Stock array is NULL !");
        b=(abi.encode(stock));
        return b;
    }  
    function encodeLaptop(string memory _model,uint _year,uint _memory,uint _storage)public returns (bytes memory){
        b=(abi.encode(Laptop(_model,_year,_memory,_storage)));
        return b;
    }    
    // function decodeArray()public {
    //     (stockDecoded)=abi.decode(b, (Laptop[]));
    // }   
    function decodeL1()public {
        (L1_decode)=abi.decode(b, (Laptop));
    }
}
contract LastTask{
    struct Vote{
        address Address;
        uint ID;
        string name;
        uint[3] DoB;
    }
    Vote public voterOrignal;
    Vote public voterDecoded;
    bytes public b;
     
    function setVoter(address _a,uint _id,string memory _n,uint[3] memory _dob)public{
        voterOrignal=Vote(_a,_id,_n,_dob);
    }  
    function encodeVoter()public returns (bytes memory){
        b=(abi.encode(voterOrignal));
        return b;
    } 
      
    function decodeVoter()public{
        voterDecoded=abi.decode(b, (Vote));
    } 
}