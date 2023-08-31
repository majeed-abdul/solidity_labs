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
    uint repaymentInstallment;
    uint requestedDate;
    uint lastRepaymentDate;
    string discription;
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
    constructor(uint _requestedAmount,uint _requestedRepaymemts,uint _intrest,string memory _discription){
        borrower=tx.origin;
        intrest=_intrest;
        requestedAmount=_requestedAmount;
        requestedRepaymemts=_requestedRepaymemts;
        remainingRepayments=_requestedRepaymemts;
        returnAmount=requestedAmount.add(intrest);
        repaymentInstallment=returnAmount.div(requestedRepaymemts);
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
    function repay()public onlyBorrower canRepay payable {
        require(remainingRepayments > 0);
        require(msg.value >= repaymentInstallment);
        assert(rePaidAmount<returnAmount);
        remainingRepayments--;
        lastRepaymentDate=block.timestamp;
        uint extraMoney=0;
        if (msg.value>repaymentInstallment){
            extraMoney=msg.value.sub(repaymentInstallment);
            assert(repaymentInstallment==msg.value.sub(extraMoney));
            assert(extraMoney<=msg.value);
            payable(msg.sender).transfer(extraMoney);
            emit LogBorrowerChangeReturned(msg.sender, extraMoney, block.timestamp);
        }
        emit LogBorrowerRepaymentInstallment(msg.sender, msg.value.sub(extraMoney), block.timestamp);
        rePaidAmount=rePaidAmount.add(msg.value.sub(extraMoney));
        if(rePaidAmount==returnAmount){
            emit LogBorrowerRepaymentFinished(msg.sender, block.timestamp);
            state=State.intrestReturns;
            emit logCreditStateChanged(state, block.timestamp);
        }
    } 
    function wirhdraw()public isActive onlyBorrower canWithdraw isNotFraud{
        state=State.repayment;
        emit logCreditStateChanged(state, block.timestamp);
        payable (borrower).transfer(address(this).balance);
        emit LogBorrowerWithdrawal(msg.sender,address(this).balance, block.timestamp);
    }
    function requestInterest() public isActive onlyLender canAskForInterest{
        uint lenderReturnAmount=lendersInvestedAmount[msg.sender].mul(returnAmount.div(lendersCount).div(lendersInvestedAmount[msg.sender]));
        assert(address(this).balance>=lenderReturnAmount);
        payable (msg.sender).transfer(lenderReturnAmount);
        emit LogLenderWithdrawal(msg.sender, lenderReturnAmount, block.timestamp);
        if (address(this).balance==0){
            active=false;
            emit LogCreditStateActiveChanged(active, block.timestamp);
            state=State.expired;
            emit logCreditStateChanged(state, block.timestamp);
        }
    }
    function getCreditInfo() public view returns(address,string memory,uint,uint,uint,uint,uint,uint,State,bool,uint){
        return (
            borrower,
            discription,
            requestedAmount,
            requestedRepaymemts,
            repaymentInstallment,
            remainingRepayments,
            intrest,
            returnAmount,
            state,
            active,
            address(this).balance
        );
    }
    function revokeVote()public isActive isRevokable onlyLender {
        require(revokeVoters[msg.sender]==false);
        revokeVotes++;
        revokeVoters[msg.sender]==true;
        emit LogLenderVoteForRevoking(msg.sender, block.timestamp);
        if(lendersCount==revokeVotes){
            revoke();
        }
    }
    function revoke()internal{
        state=State.revoke;
        emit logCreditStateChanged(state, block.timestamp);

    }
    function Refund()public isActive onlyLender isRevoked{
        assert(address(this).balance>=lendersInvestedAmount[msg.sender]);
        payable (msg.sender).transfer(lendersInvestedAmount[msg.sender]);
        emit LogLenderRefunded(msg.sender, lendersInvestedAmount[msg.sender], block.timestamp);
        if(address(this).balance==0){
            active=false;
            emit LogCreditStateActiveChanged(active, block.timestamp);
            state=State.expired;
            emit logCreditStateChanged(state, block.timestamp);
        }
    }
    function fraudVote()public isActive onlyLender{
        require(fraudVoters[msg.sender]==false);
        fraudVotes++;
        fraudVoters[msg.sender]=true;
        emit LogLenderVoteForFraud(msg.sender, block.timestamp);
    }
}