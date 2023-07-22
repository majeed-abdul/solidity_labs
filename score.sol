// SPDX-License-Identifier: MIT
pragma solidity ^ 0.8.17 ;
contract Score {
    function check(uint score) public pure returns(bool,string memory){
        return score>=60?(true,(score>=80&&score<=100)?"A":"B"):
        (false,(score>=40&&score<60)?"C":"Better Luck Next Time");
    }
}
