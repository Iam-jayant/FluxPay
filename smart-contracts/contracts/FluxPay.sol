// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract FluxPay {
    address public owner;

    event PaymentSent(address indexed to, uint amount);

    constructor() {
        owner = msg.sender;
    }

    function sendPayment(address payable _to) external payable {
        require(msg.value > 0, "Send some ether");
        _to.transfer(msg.value);
        emit PaymentSent(_to, msg.value);
    }

    function withdraw(uint _amount) external {
        require(msg.sender == owner, "Only owner");
        payable(owner).transfer(_amount);
    }

    receive() external payable {}
}
