//"SPDX-License-Identifier:UNLICENSED"
pragma solidity ~0.7.3;
import "./safemath.sol";

contract Counter {

    using SafeMath for uint256;

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a.add(b);
    }
}