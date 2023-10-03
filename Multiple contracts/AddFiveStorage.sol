// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

//inheritence
contract AddFiveStorage is SimpleStorage{
    function sayHello() public pure returns(string memory){
        return "hello";
    }

    //overriding function
    function store(uint256 _newNumber) public override {
        favoriteNumber = _newNumber+5;
    }  
}
