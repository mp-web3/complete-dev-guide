pragma solidity ^0.4.17;
contract Lottery {
    address public manager;
    address[] public players; //This create a dynamic array that can only take addresses

    function Lottery() public {
        manager = msg.sender; // msg.sender identify the address that invoke the function
    }

    function enter() public payable { //when someone call this function can send along some amount of ether
        require(msg.value > .01 ether);
        players.push(msg.sender); 
    } 

    function random() public view returns (uint) { // set as public just for the sake of testing
        return uint(keccak256(block.difficulty, now, players)); //sha3 is a global variable, we pass in the sources of pseudom randomnes: block difficulty, current time and array of players 
    }

}