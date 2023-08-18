// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract MarketPlace{
    mapping (address=>uint) balance;
    event Purchase(address buyerAddress,address sellerAddress,uint purchaseValue);
    function register(address _address,uint _initialBalance)public{
        require(_initialBalance!=0,"Acconut cannot be created with 0 balance !!!!");
        balance[_address]=_initialBalance;
    }
    function buy(address _buyerAddress,address _sellerAddress,uint _cash)public virtual{        
        require(balance[_buyerAddress]!=0,"You cannot buy with 0 balance !!!!");
        require(balance[_sellerAddress]!=0,"seller is not registerd !!!!");
        require(_cash!=0,"you cannot buy with 0 cash !!!!");
        balance[_buyerAddress]-=_cash;
        balance[_sellerAddress]+=_cash;
        emit Purchase(_buyerAddress,_sellerAddress,_cash);
    }
    function sell(address _sellerAddress,address _buyerAddress,uint _price)public virtual returns(string memory){   
        require(balance[_sellerAddress]!=0,"You cannot buy with 0 balance !!!!");
        require(balance[_sellerAddress]!=0,"seller is not registerd !!!!");
        require(_price!=0,"you cannot sell with 0 price !!!!");
        require(_sellerAddress!=_buyerAddress,"you cannot sell to your self !!!!");
        return "Item will be shipped to buyer's location";
    }
}
contract PremiumSeller is MarketPlace{
    uint fee;
    constructor(uint _fee){
        fee=_fee;
    }
    function sell(address _sellerAddress,address _buyerAddress,uint _price)public override returns(string memory){   
        require(_price!=0,"you cannot sell with 0 price !!!!");
        require(_sellerAddress!=_buyerAddress,"you cannot sell to your self !!!!");
        uint _newPrice= _price * fee / 100;
        balance[_sellerAddress]-=_newPrice-_price;
        balance[_buyerAddress]+=_newPrice-_price;
        return super.sell(_sellerAddress,_buyerAddress,_newPrice);
    }
}

contract RegularBuyer is MarketPlace{}

contract VIPBuyer is MarketPlace{
    uint discount;
    constructor(uint _discount){
        discount=_discount;
    }
    function buy(address _buyerAddress,address _sellerAddress,uint _cash)public override{        
        require(balance[_buyerAddress]!=0,"You cannot buy with 0 balance !!!!");
        require(balance[_sellerAddress]!=0,"seller is not registerd !!!!");
        require(_cash!=0,"you cannot buy with 0 cash !!!!");
        uint _finalAmount=_cash-(_cash * discount / 100);
        balance[_buyerAddress]-=_finalAmount;
        balance[_sellerAddress]+=_finalAmount;
        emit Purchase(_buyerAddress,_sellerAddress,_finalAmount);
    }
}