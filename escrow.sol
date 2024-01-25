// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Escrow {   
    address public sender;
    address public receiver;
    address public arbiter;
    // delare 3 address variables for the sender, receiver, and middleman

    event Approved (uint);
    // create an event called Approved which will emit a uint datatype

    constructor(address _arbiter, address _receiver) payable {
        arbiter = _arbiter;
        receiver = _receiver;
        sender = msg.sender;
    }
    // a constructor which will take 3 parameters and initialize the 3 already-declared addresses
    // the depositor will  be the message sender/ owner of the transaction
    // this constructor also has the 'payable' modifier, making it eligible to receive payments
    function approve () external {
        require (msg.sender == arbiter);
        uint balance = address(this).balance;
        payable(receiver).transfer (balance);
        emit Approved (balance);
    }
    // an approve function which is accessible ONLY to the arbiter
    // it delares a uint varaible called balance which is basically the total amount of money in the contract
    // this function when approved, transfers the balance to the receiver
    // this can also be modified by setting the amount of ether to be sent, using an if statement
    // it eventually emits the balance sent 
    
}