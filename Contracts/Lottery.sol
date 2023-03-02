pragma solidity ^0.4.17;
contract Lottery {
    address public manager;
    address[] public players; //This create a dynamic array that can only take addresses
    // uint public winner_num;
    // address public winner;

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

    function pickWinner() public restricted {
        // require(msg.sender == manager); //enforce that nobady can call pickWinner but the manager, the address that deployed the contract

        uint index = random() % players.length;
        players[index].transfer(this.balance); //players.index is the address of the winner on which we can call the method transfer; this.balance is the total balance in the contract
        players = new address[](0); //empty the list by creating a new array of type address with 0 elements
    }

    modifier restricted() { // function modifier are used to reduce the amount of code. By adding the name of the modifier to a function will add the code behind the curtains
        require(msg.sender == manager);
        _;
    }

    function getPlayers() public view returns (address[]) {
        return players;
    }

}