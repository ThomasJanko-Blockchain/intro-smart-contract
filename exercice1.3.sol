// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Message{
   string public message;
    event changeMessage(string newMessage);
    constructor() public {
        message = 'Hello world !';
    }

    function setMessage(string memory newMessage) public {
        message = newMessage;
        emit changeMessage(newMessage);
    }

    function getMessage() public view returns(string memory) {
        return message;
    }


}