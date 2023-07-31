// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract AdminAddress {
    address public immutable admin_address=0x472EbDcBB17076a3724C2bF14F234edD43103820;
    function getAdminAddress() public view returns (address){
        return admin_address;
    }
}
