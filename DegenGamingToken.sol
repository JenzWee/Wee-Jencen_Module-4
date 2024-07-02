// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract GameToken is ERC20 {
    address public owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    event Redeem(address indexed user, uint256 amount, string item);

    modifier onlyOwner() {
        require(owner == msg.sender, "Caller is not the owner");
        _;
    }

    mapping(address => string[]) private redeemedItems;

    mapping(address => uint256) private redemptionCounts;

    constructor() ERC20("Degen", "DGN") {
        owner = msg.sender;
        emit OwnershipTransferred(address(0), owner);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function redeem(uint256 amount, string memory item) public {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        require(redemptionCounts[msg.sender] + 1 <= 10, "You have reach the maximum redeemable items per player");

        _burn(msg.sender, amount);
        redeemedItems[msg.sender].push(item);
        redemptionCounts[msg.sender]++;

        emit Redeem(msg.sender, amount, item);
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "New owner is the zero address");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }

    function getRedeemedItemCount(address user) public view returns (uint256) {
        return redeemedItems[user].length;
    }

    function getRedeemedItem(address user, uint256 index) public view returns (string memory) {
        require(index < redeemedItems[user].length, "Index out of bounds");
        return redeemedItems[user][index];
    }
}
