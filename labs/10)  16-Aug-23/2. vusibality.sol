// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// contract Public {
//     string public publicmsg = "Public Variable is Called";

//     function getpublic() public view returns (string memory) {
//         return publicmsg;
//     }
// }contract Public2 is Public {}

// contract PublicVisibality{
//     uint public publicData=12;
// }
// contract PublicChild is PublicVisibality{
//     function grtPublicData()public view returns(uint){
//         return publicData;
//     }
// }

// contract Private {
//     string private privatemsg = "Private Variable is Called";
//     function getprivate() private view returns (string memory) {
//         return privatemsg;
//     }
//     function getprivatevar() public view returns (string memory) {
//         return privatemsg;
//     }
//     function getprivatefunc() public view returns (string memory) {
//         //You are calling 'getprivate()' function here
//         //It returns a string value which is then returned by the
//         //'getprivatefunc()' function
//         return getprivate();
//     }
// }
// contract Private2 is Private{
// }

// contract Bank{
//     uint private balance;
//     function depisit(uint _fund) public{
//         balance+=_fund;
//     }
// }
// contract BankUser is Bank{
//     // function get()public view returns(uint){
//     //     return balance;
//     // }
// }

// contract Internal {
//     string public internalmsg = "Internal Variable is Called";
//     function getinternal() internal view returns (string memory) {
//         return internalmsg;
//     }
//     function getinternalvar() public view returns (string memory) {
//         return internalmsg;
//     }
//     function getinternalfunc() public view returns (string memory) {
//         return getinternal();
//     }
// }
// contract Internal2 is Internal{
//     function set() public {
//         internalmsg="changed by child contract";
//     }
// }

// contract FamilyFortune{
//     uint internal famelyMembers=9;
//     function addInheritance(uint amount)internal{
//         famelyMembers+=amount;
//     }
// }
// contract Heir is FamilyFortune{
//     function addToFamilyFortune(uint amount) public{
//         addInheritance(amount);
//     }
// }

contract External {
    string external externalmsg = "External Variable is Called";
    function getexternal() external pure returns (string memory) {
        return "External Function";
    }
    function getexternalfunc() public view returns(string memory){
        return getexternal();
    }
}
contract External2 is External{

    function getexternalfunc() public view returns(string memory){
        return getexternal();
    }
}
