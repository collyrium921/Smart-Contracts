//SPDX-License-Identifier:MIT
pragma solidity 0.8.18; //stating verision
//>=0.8.18 <0.9.0 a version between these 2 would work,  ^0.8.18 means will work with this or above version


// contract SimpleStorage {
//     bool hasFavoriteNumber = false;  //default false
//     uint favoriteNumber = 12; //default 0 //unsigned int, always +ve.  default is unint256 means 256 bits are used
//     int favoriteInt = -12;
//     string favoriteNumberText = "stringValue";
//     address myAddress = 0x571624D55e429f79acD7b4B2325a8b83f3314841;
//     bytes32 favoriteBytes = "cat";  //all the way upto 32 can be defined, also bytes alone is a different data type
// }

contract SimpleStorage {
    //default visibility is internal, others are public, private, internal and external
    // uint256 public  favoriteNumber;  //0
    uint256 favoriteNumber;  //0

    uint256[] listOfFavNumbers;

    struct Person{
        uint256 personFavNumber;
        string name;
    }
    //declaring array
    Person[] public listOfPeople; // dynamic array


    mapping(string => uint256) public nameToNumber; //serves as dictionary

    // Person[3] public listOfPeople; //static array

    // Person public myFriend = Person(7, "Pat");
    // Person public pat = Person({personFavNumber: 7,name:"Pat"});


    //adding virtual means that the function is overridable
    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
    }

    //view allows ro read only the favoriteNumber and not updating it
    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }

    //pure neither allows update nor reading a variable
    function retrievePure() public pure returns(uint256){
        return 7;
        // return favoriteNumber;
    }

    //we can only access _name variable only one time during the function call  
    function addPerson(string memory _name, uint256 _favNumber) public{
        //calldata and storage variables can not be modifies, however memory variables can be modified
        // _name ="Cat";
        listOfPeople.push(Person(_favNumber, _name));
        nameToNumber[_name] = _favNumber;
    }
 }