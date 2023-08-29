// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import "./SafeMath.sol";
import "./Credit.sol";
import "./Ownable.sol";

contract PeerToPeerLending is Ownable{
    using SafeMath for uint;
    struct User{
        bool credited;
        address activeCredit;
        bool fraudStatus;
        address[] allCredits;
    }
    mapping (address=>User) public users;
    address[] public credits;
    event LogCreditCreated(address indexed _address,address indexed _borrower,uint indexed _timeStamp);
    event LogCreditStateChanged(address indexed _address,Credit.State indexed _state,uint indexed _timeStamp);
    event LogCreditActiveChanged(address indexed _address,bool indexed active,uint indexed _timeStamp);
    event LogUserSetFraud(address indexed _address,bool _fraudStatus,uint indexed _timeStamp);
    function applyForCredit(uint _requestedAmount,uint _repaymentCounts,uint _intrest,string memory _creditDiscription)
    public returns(address _credits){
        require(!users[owner].credited);
        require(!users[msg.sender].fraudStatus);
        assert(users[msg.sender].activeCredit==address(0));
        users[msg.sender].credited==true;
        Credit credit=new Credit(_requestedAmount,_repaymentCounts,_intrest,_creditDiscription);
        users[msg.sender].activeCredit=address(credit);
        credits.push(address(credit));
        users[msg.sender].allCredits.push(address(credit));
        emit LogCreditCreated(address(credit), msg.sender, block.timestamp);
        return address(credit);
    }
    function getCredits()public view returns (address[] memory){
        return credits;
    }
    function getUserCredits()public view returns (address[] memory){
        return users[msg.sender].allCredits;
    }
    function setFraudStatus(address _borrower)external returns (bool){
        users[_borrower].fraudStatus=true;
        emit LogUserSetFraud(_borrower, users[_borrower].fraudStatus, block.timestamp);
        return users[_borrower].fraudStatus;
    }
    function changeCreditState(Credit _credit,Credit.State _state) public  onlyOwner{
        Credit credit=Credit(_credit);
        credit.changeState(_state);
        emit LogCreditStateChanged(address(credit), _state, block.timestamp);
    }
    function toggleCreditState(Credit _credit) public onlyOwner{
        Credit credit=Credit(_credit);
        bool active=credit.toggelActive();
        emit LogCreditActiveChanged(address(credit), active, block.timestamp);
    }
}