// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Ownable {
    address public ian;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor() {
        ian = msg.sender;
    }
    modifier onlyIan() {
        require(msg.sender == ian, "Ownable: caller is not the owner");
        _;
    }
    function transferOwnership(address newOwner) public onlyIan {
        emit OwnershipTransferred(ian, newOwner);
        ian = newOwner;
    }
}
