// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract SimpleStorage{
   uint balance;

    constructor() public {
        balance = 1000;
    }

    function setBalance(uint newBalance) public {
        balance = newBalance;
    }

    function getBalance() public view returns(uint) {
        return balance;
    }


}