//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Mappings {
    mapping(address => mapping(string => mapping(string => uint))) public AddrWalletToName;

    function AddValue(address _addr,string memory _walletname,string memory _name,uint _amount) public {
        AddrWalletToName[_addr][_walletname][_name] = _amount;
    }

    function get(address _addr,string memory _walletname,string memory _name)public view returns (uint){
        return AddrWalletToName[_addr][_walletname][_name];
    }

    function remove(address _addr, string memory _walletname,string memory _name) public {
        delete AddrWalletToName[_addr][_walletname][_name];
    }
}
contract NameMap{    
    mapping(uint => mapping(address => mapping (string=>string))) public UserMap;
    function AddValue(uint _yearofbirth, address _wallet, string memory _codename, string memory _username) public {
        UserMap[_yearofbirth][_wallet][_codename] = _username;
    }
    function get(uint _yearofbirth, address _wallet, string memory _codename)public view returns (string memory){
        return UserMap[_yearofbirth][_wallet][_codename];
    }    
    function reset(uint _yearofbirth, address _wallet, string memory _codename) public {
        delete UserMap[_yearofbirth][_wallet][_codename];
    }
}