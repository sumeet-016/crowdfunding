// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Crowdfunding {
    address public owner;
    uint public goalAmount;
    uint public totalRaised;

    mapping(address => uint) public contributions;

    constructor(uint _goalAmount) {
        owner = msg.sender;
        goalAmount = _goalAmount;
    }

    function contribute() public payable {
        require(msg.value > 0, "Must send some ether");
        contributions[msg.sender] += msg.value;
        totalRaised += msg.value;
    }

    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw");
        require(totalRaised >= goalAmount, "Goal not reached yet");

        payable(owner).transfer(address(this).balance);
    }

    function getContribution(address contributor) public view returns (uint) {
        return contributions[contributor];
    }
}
