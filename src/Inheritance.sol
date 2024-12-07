// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Inheritance {

    address public owner;
    uint public creationTime;

    uint public WAITING_PERIOD = 157788000; // 5 years in seconds

    // Mapping of Inheritors
    mapping(address => bool) public inheritorMapping;

    event amountDeposited(uint amount, string message);

    constructor (address inheritor) {
        owner = msg.sender;

        // Initialize the timeCreation of the contract
        creationTime = block.timestamp;

        // Also initialize the Inheritor
        inheritorMapping[inheritor] = true;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can invoke this function");
        _;
    }

    // Contract owner can deposit eth in this contract
    function deposit() public onlyOwner payable {
        require(msg.value > 0, "The ETH Sent should be greater than 0");

        emit amountDeposited(msg.value, "Amount Deposited");
    }

    function getInheritorStatus(address inheritor) public view returns(bool) {
        return inheritorMapping[inheritor];
    }

    // To add more inheritors
    function addInheritor(address inheritor) public onlyOwner{
        inheritorMapping[inheritor] = true;
    }

    // To remove inheritors
    function removeInheritor(address inheritor) public onlyOwner{
        inheritorMapping[inheritor] = false;
    }

    // Ping Function
    function resetContractTime() public onlyOwner {
        creationTime = block.timestamp;
    }

    // Remove the ETH (For the Depositors)
    function getTheEthForInheritors(uint amount) public {
        require(inheritorMapping[msg.sender] == true, "Only the inheritor can call this function");
        require(block.timestamp - creationTime > WAITING_PERIOD, "can't get the ETH, time still remaining");
        require(amount > 0, 'amount must be greater than zero');

        require(address(this).balance > 0, "The contract balance should be greater than 0");

        payable(msg.sender).transfer(amount);
    }

}