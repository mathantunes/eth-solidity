//"SPDX-License-Identifier:UNLICENSED"
pragma solidity ~0.7.3;

import "./base.sol";

contract Increment is Counter {
    constructor(uint256 startValue) Counter(startValue) {}
    function step() override public {
        setCounter(getCount() + 1);
    }
}