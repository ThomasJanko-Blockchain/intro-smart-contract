// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract SimpleStorage{
    uint storedData;
    uint result;

    function set(uint x) public{
        storedData = x;
    }

    function get() public view returns (uint) {
        return storedData;
    }

    function addition(uint x, uint y) public {
        result = x + y;
    }

     function getResult() public view returns (uint) {
        return result;
    }
}