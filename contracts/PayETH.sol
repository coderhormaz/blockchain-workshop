// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// DEPLOY THIS — just click Deploy, no args needed
contract PayETH {

    struct Payment { address from; address to; uint256 amount; uint256 ts; }
    Payment[] private _payments;
    mapping(address => uint256[]) private _ids;

    event Paid(address indexed from, address indexed to, uint256 amount);

    // Send ETH directly (payable function)
    function pay(address payable to) external payable {
        require(to != address(0) && msg.value > 0, "Invalid input");
        (bool ok, ) = to.call{value: msg.value}("");
        require(ok, "ETH transfer failed");
        uint256 id = _payments.length;
        _payments.push(Payment(msg.sender, to, msg.value, block.timestamp));
        _ids[msg.sender].push(id);
        _ids[to].push(id);
        emit Paid(msg.sender, to, msg.value);
    }

    function getBalance(address user) external view returns (uint256) {
        return user.balance;
    }

    function getPaymentIds(address user) external view returns (uint256[] memory) {
        return _ids[user];
    }

    function getPayment(uint256 id) external view returns (address, address, uint256, uint256) {
        Payment storage p = _payments[id];
        return (p.from, p.to, p.amount, p.ts);
    }
}
