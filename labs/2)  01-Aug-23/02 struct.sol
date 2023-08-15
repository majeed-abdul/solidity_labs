// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
struct Voter {
    string Name;
    address addr;
    bool hasVoted;
    }
contract VotingSystem {
    // An array of 'Voter' structs
    Voter[] public voters;
    function create1(string memory _Name, address _addr)public {
        voters.push(Voter(_Name, _addr, false));
    }

    function create2(string memory _Name, address _addr) public {
        voters.push(Voter({Name: _Name, addr:_addr, hasVoted:false}));
    }
    function create3(string memory _Name, address _addr)public {
        Voter memory voter;
        voter.Name = _Name;
        voter.addr = _addr;        // Voter.hasVoted initialized to false
        voters.push(voter);
    }
    function get(uint _index) public view returns (string memory Name, address addr, bool hasVoted) {
        Voter storage voter = voters[_index];
        return (voter.Name, voter.addr,voter.hasVoted);
    }    // update hasVoted
    function togglehasVoted(uint _index) public {
        Voter storage voter = voters[_index];
        voter.hasVoted = !voter.hasVoted;
    }
}
contract Bank{
    struct BankAcount{
        uint ID;
        uint Balance;
        address Owner;
    }

    BankAcount a1;

    function createAcountM1() public {          //   Method 1
        BankAcount storage _a1 = a1;
        _a1.ID = 1;
        _a1.Owner = 0x472EbDcBB17076a3724C2bF14F234edD43103820; 
    }

    function createAcountM2() public {          //   Method 2
        a1.ID = 1;
        a1.Owner = 0x472EbDcBB17076a3724C2bF14F234edD43103820; 
    }

    function createAcountM3() public {          //   Method 3
        a1=BankAcount(1,0,0x472EbDcBB17076a3724C2bF14F234edD43103820);
    }

    function createAcountM4() public {          //   Method 4
        a1=BankAcount({
            ID:1,
            Balance:0,
            Owner:0x472EbDcBB17076a3724C2bF14F234edD43103820
        });
    }

    function AcountGetter()public view returns(BankAcount memory){
        return a1;
    }
    
}