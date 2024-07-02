// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract JencenGaming is ERC20 {
    address public owner;
    
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    
    mapping(address => uint256) private _itemCounts;  
    mapping(address => mapping(uint256 => uint256)) private _redeemedItems; 
    mapping(uint256 => string) private _itemTypes; 
    uint256 private _nextItemId = 1;  

    constructor() ERC20("Degen", "DGN") {
        owner = msg.sender;
        emit  OwnershipTransferred(address(0), owner);
    }

    function mint(address _to, uint256 _amount) public returns (bool) {
        _mint(_to, _amount);
        return true;
    }

    function burn(uint256 _amount) public returns (bool) {
        _burn(msg.sender, _amount);
        return true;
    }
    
    function transferOwnership(address newOwner) public {
        require(newOwner != address(0), "New owner is the zero address");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }
    
    function redeemItem(uint256 itemId, uint256 quantity, string memory itemType) public returns (bool) {
        require(_itemCounts[msg.sender] + quantity <= 10, "Maximum redeemable items per player");

        _itemCounts[msg.sender] += quantity;
        _redeemedItems[msg.sender][itemId] += quantity;
        _itemTypes[itemId] = itemType;
        emit ItemRedeemed(msg.sender, itemId, quantity, itemType);

        return true;
    }

    event ItemRedeemed(address indexed user, uint256 indexed itemId, uint256 quantity, string itemType);

    function getItemCount(address user) public view returns (uint256) {
        return _itemCounts[user];
    }   

    function getRedeemedItems(address user, uint256 itemId) public view returns (uint256, uint256, string memory) {
        return (_redeemedItems[user][itemId], itemId, _itemTypes[itemId]);
    }

}
