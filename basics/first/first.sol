//"SPDX-License-Identifier:UNLICENSED"
pragma solidity ~0.7.3;

contract Counter {
    uint256 private count = 0;
    
    function increment() public {
        count += 1;
    }
    
    function getCount() public view returns(uint256) {
        return count;
    }
}