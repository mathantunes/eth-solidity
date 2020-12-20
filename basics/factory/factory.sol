//"SPDX-License-Identifier:UNLICENSED"
pragma solidity ~0.7.3;
import "./counter.sol";

contract CounterFactory {
 
    mapping(address => Counter) _counters;

    modifier doesNotHaveCounter() {
        require (_counters[msg.sender] == Counter(0)); // Check if sender already owns a Counter
        _;
    }

    modifier hasCounter() {
        require (_counters[msg.sender] != Counter(0));
        _;
    }

    function createCounter() public doesNotHaveCounter {
        _counters[msg.sender] = new Counter(msg.sender);
    }
    
    function increment() public hasCounter {
        Counter(_counters[msg.sender]).increment(msg.sender);
    }
    
    function getCount(address account) public view hasCounter returns (uint256) {
        return (_counters[account].getCount());
    }
    
    function getMyCount() public view returns (uint256) {
        return (getCount(msg.sender));
    }
}