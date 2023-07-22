// SPDX-License-Identifier: MIT
pragma solidity ^ 0.8.17 ;
contract Revert {
    int public i;

    function set(int _i)public{
        i= _i;
    }

    // function int_into_uint() public view returns(uint){
    //     require(i>0,"");

    // }
    function Reevert(uint _amount) public pure{
        if (_amount>100){
            revert("error");
        }
        // withdraw(_amount);
    }
    
    function Required(uint _amount) public pure{
        require(!(_amount>100),"error");
        // withdraw(_amount);
    }
}
