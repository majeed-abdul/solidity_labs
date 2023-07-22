// SPDX-License-Identifier: MIT
pragma solidity ^ 0.8.17 ;
contract A {
    function foo()public pure virtual returns (string memory){
        return "a"; 
    }
    function baz()public pure virtual returns (string memory){
        return "b"; 
    }
    function bar()public pure virtual returns (string memory){
        return "c"; 
    }    
}
contract B is A {    
    function foo()public pure override virtual returns (string memory){
        return "d"; 
    }
    // function baz()public pure override  returns (string memory){
    //     return "e"; 
    // }
    function br()public pure virtual returns (string memory){
        return "f"; 
    }  
}
contract Z is B {    
    function foo()public pure override virtual returns (string memory){
        return "zz"; 
    }
    function br()public pure override returns (string memory){
        return "g"; 
    }  
}


