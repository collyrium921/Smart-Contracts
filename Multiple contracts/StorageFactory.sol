// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// import "./SimpleStorage.sol";

//named Imports, if any file has more than 1 contract
import {SimpleStorage} from "./SimpleStorage.sol";


contract Storagefactory{
    SimpleStorage public simpleStorage;
    SimpleStorage[] public listOfSimpleStorage;

    //deploying a list of contracts from SimpleStorage
    function createSimpleStorageContract() public {
        simpleStorage = new SimpleStorage();
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorage.push(newSimpleStorageContract);
    }

    //calling functions from other contract
    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber)  public{
        //address
        //ABI (Application Binary Interface)

        SimpleStorage mySimpleStorage = listOfSimpleStorage[_simpleStorageIndex];
        mySimpleStorage.store(_newSimpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        SimpleStorage mySimpleStorage = listOfSimpleStorage[_simpleStorageIndex];
        return mySimpleStorage.retrieve();
    }
}