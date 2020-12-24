// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract TodoList {
    address public owner;
    uint256 public taskCount = 0;
    mapping(uint256 => Task) private tasks;
    event CompletedTask(uint256 id);
    event CreatedTask(uint256 id, string text, bool completed);

    struct Task {
        uint256 id;
        string text;
        bool completed;
    }

    constructor() public {
        createTask("Default task");
        owner = msg.sender;
    }

    modifier restricted() {
        require(
            msg.sender == owner,
            "This function is restricted to the contract's owner"
        );
        _;
    }

    function createTask(string memory _text) public {
        taskCount += 1;
        tasks[taskCount] = Task(taskCount, _text, false);
        emit CreatedTask(taskCount, _text, false);
    }

    function getTask(uint256 _id)
        public
        view
        returns (
            uint256,
            string memory,
            bool
        )
    {
        Task memory t = tasks[_id];
        return (t.id, t.text, t.completed);
    }

    function completeTask(uint256 _id) public restricted returns (bool) {
        Task memory t = tasks[_id];
        require(t.completed != true, "Already completed");
        tasks[_id].completed = true;
        emit CompletedTask(_id);
        return true;
    }
}
