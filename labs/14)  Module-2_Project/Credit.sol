// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import "./SafeMath.sol";
import "./Ownable.sol";

contract Credit is Ownable {
    using SafeMath for uint;
    address borrower;
    uint requestedAmount;
    uint returnAmount;  //  requestedAmount + Intrest
    uint rePaidAmount;
    uint intrest;
    uint requestedRepaymemts;
    uint remainingRepayments;
    uint reypaymentInstallment;
    uint requestedDate;
    uint lastRepaymentDate;
    bytes discription;
    bool active=true;
    uint lendersCount=0;
    uint revokeVotes=0;
    uint revokeTimeNeeded=block.timestamp+1 seconds;
    uint fraudVotes=0;
    mapping (address=>bool) public lenders;
    mapping (address=>uint) public lendersInvestedAmount;
    mapping (address=>bool) public revokeVoters;
    mapping (address=>bool) public fraudVoters;
    enum State{
        investment,     //  0
        repayment,      //  1
        intrestReturns, //  2
        expired,        //  3
        revoke,         //  4
        fraud           //  5
    }
    State state;
    event LogCreditInitialized(address indexed _address,uint indexed _timeStamp);
    event logCreditStateChanged(State indexed _state,uint indexed _timeStamp);
    event LogCreditStateActiveChanged(bool indexed _isActive,uint indexed _timestamp);
    event LogBorrowerWithdrawal(address indexed _address,uint indexed _amount, uint indexed _timeStamp);
    event LogBorrowerRepaymentInstallment(address indexed _address,uint indexed _amount,uint indexed _timeStamp);
    event LogBorrowerRepaymentFinished(address indexed _address,uint indexed _timeStamp);
    event LogBorrowerChangeReturned(address indexed _address,uint indexed _amount,uint indexed _timeStamp);
    event LogLenderInvestment(address indexed _address,uint indexed _amount,uint indexed _timeStamp);
    event LogLenderWithdrawal(address indexed _address,uint indexed _amount,uint indexed _timeStamp);
    event LogLenderChangeReturned(address indexed _address,uint indexed _amount,uint indexed _timeStamp);
    event LogLenderVoteForRevoking(address indexed _address,uint indexed _timeStamp);
    event LogLenderVoteForFraud(address indexed _address,uint indexed _timeStamp);
    event LogLenderRefunded(address indexed _address,uint indexed _amount,uint indexed _timeStamp);
    modifier isActive(){
        require(active==true);
        _;
    }
    modifier onlyBorrower(){
        require(msg.sender==borrower);
        _;
    }
    modifier onlyLender(){
        require(lenders[msg.sender]==true);
        _;
    }
    modifier canAskForInterest(){
        require(state==State.intrestReturns);
        require(lendersInvestedAmount[msg.sender]>0);
        _;
    }
    modifier canInvest(){
        require(state==State.investment);
        _;
    }
    modifier canRepay(){
        require(state==State.repayment);
        _;
    }
    modifier canWithdraw(){
        require(address(this).balance>=requestedAmount);
        _;
    }
    modifier isNotFraud(){
        require(state!=State.fraud);
        _;
    }
    modifier isRevokable(){
        require(block.timestamp>=revokeTimeNeeded);
        require(state==State.investment);
        _;
    }
    modifier isRevoked(){
        require(state==State.revoke);
        _;
    }
    constructor(uint _requestedAmount,uint _requestedRepaymemts,uint _intrest,bytes memory _discription){
        borrower=tx.origin;
        intrest=_intrest;
        requestedAmount=_requestedAmount;
        requestedRepaymemts=_requestedRepaymemts;
        remainingRepayments=_requestedRepaymemts;
        returnAmount=requestedAmount.add(intrest);
        reypaymentInstallment=returnAmount.div(requestedRepaymemts);
        discription=_discription;
        requestedDate=block.timestamp;
        emit LogCreditInitialized(borrower,requestedDate);        
    }
    function getBalance() public view returns(uint){
        return address(this).balance;
    }
    function changeState(State _state) external onlyOwner{
        state=_state;
        emit logCreditStateChanged(state, block.timestamp);
    }
    function toggelActive() external onlyOwner returns (bool){
        active=!active;
        emit LogCreditStateActiveChanged(active, block.timestamp);
        return active;
    }
    function invest() public canInvest payable{
        uint extraMoney=0;
        if (address(this).balance>=requestedAmount){
            extraMoney=address(this).balance.sub(requestedAmount);
        }
        assert(requestedAmount!=address(this).balance.sub(extraMoney));
        assert(extraMoney<=msg.value);
        if (extraMoney>0){
            payable (msg.sender).transfer(extraMoney);
            emit LogLenderChangeReturned(msg.sender, extraMoney, block.timestamp);
        }
        state=State.repayment;
        emit logCreditStateChanged(state, block.timestamp);
        lenders[msg.sender]=true;
        lendersCount++;
        lendersInvestedAmount[msg.sender]=lendersInvestedAmount[msg.sender].add(msg.value.sub(extraMoney));
        emit LogLenderInvestment(msg.sender, msg.value.sub(extraMoney), block.timestamp);
    }
}