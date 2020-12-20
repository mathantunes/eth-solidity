//"SPDX-License-Identifier:UNLICENSED"
pragma solidity ~0.7.3;

abstract contract Counter {

    //Event emitted when the value is changed
    event ValueChanged(uint256 newValue);
    
    // Private variable of type unsigned int to keep the number of counts
    uint256 private count;
    
     constructor(uint256 startValue) {
        count = startValue;
    }
    
    // Function that will modify our counter
    function setCounter(uint256 newValue) internal {
        count = newValue;
        emit ValueChanged(count);
    }
    
    // Getter to get the count value
     function getCount() public view returns (uint256) {
        return count;
    }
    
    // The function that child contracts need to implement  as an increment or decrement
    function step() virtual public;
}