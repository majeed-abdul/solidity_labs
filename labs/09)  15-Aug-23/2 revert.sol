// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract QuotientCalculator{
    function calculateQuotient(uint _nominator,uint _denominator)public pure returns(uint){
        if (_denominator==0){
            revert("denominator is zero");
        }
        return _nominator/_denominator;
    }
}
contract VotingSystem {
    mapping (uint=>bool) votes;
    function vote(uint256 _candidateId)public{
        if(votes[_candidateId]){
            revert("user has already voted");
        }
        votes[_candidateId]=true;
    }
}