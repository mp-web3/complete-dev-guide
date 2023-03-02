// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Test {
    string[] public myArray; 

    function pushStringToArray() public {
        myArray.push('Hi');
        myArray.push('Bye');
    }

    function getArray() public view returns (string[] memory) {
        return myArray;
    }

    function getArrayLength() public view returns (uint) {
        return myArray.length;
    }

}