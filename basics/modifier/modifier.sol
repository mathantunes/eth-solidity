//"SPDX-License-Identifier:UNLICENSED"
pragma solidity ~0.7.3;

contract Counter {

    uint256 private count;
    address private owner;    
    
    constructor() {
        owner = msg.sender;
    }

    // Acts as a validator by denying actions if msg.sender is not the owner set on constructor
    modifier onlyOwner() {
        require(msg.sender == owner, "caller is not the owner");
        _;
    }

    function increment() public onlyOwner {
        count += 1;
    }
    
    function decrement() public onlyOwner {
        count -= 1;
    }

    function getCount() public view returns (uint256) {
        return count;
    }
}