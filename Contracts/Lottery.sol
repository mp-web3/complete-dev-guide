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

}