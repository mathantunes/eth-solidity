//"SPDX-License-Identifier:UNLICENSED"
pragma solidity ~0.7.3;

contract Faucet {
    function withdraw(uint amount) public {
        require(amount <= 100000000000000000);
        msg.sender.transfer(amount);
    }

    receive() external payable {}
}