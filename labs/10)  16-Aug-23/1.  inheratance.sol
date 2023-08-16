// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// contract Base {
//     uint256 public x;

//     function setX(uint256 _x) private {
//         x = _x;
//     }
// }

// contract Derived is Base {
//     function getX() public view returns (uint256) {
//         return x;
//     }
// }                                

// contract Parent {
//     //  base
//     uint256 parentValue;
// }

// contract Child {
//     //  drive
//     uint256 childValue;
// }




// contract Base {
//     string public base = "Base Contract";

//     function foo() public view virtual returns (string memory) {
//         return base;
//     }
// }

// contract Middle is Base {
//     string public middle = "Middle Contract";

//     function foo() public view virtual override returns (string memory) {
//         return middle;
//     }
// }

// contract Derived is Middle {
//     string public derived = "Derived Contract";

//     function foo() public view virtual override returns (string memory) {
//         return derived;
//     }
// }




contract BaseUser{
    address public address1=0x472EbDcBB17076a3724C2bF14F234edD43103820;
    error print1(address);
    function Print()virtual public view{
        revert print1(address1);
    }
}
contract Moderator is BaseUser{
    string public name="majeed";     
    error print2(address,string);
    function Print() virtual override public view{
        revert print2(address1,name);
    }
}
contract Admin is Moderator{
    uint public pin=1234;
    error print3(address,string,uint);
    function Print()virtual override public view{
        revert print3(address1,name,pin);
    }
}