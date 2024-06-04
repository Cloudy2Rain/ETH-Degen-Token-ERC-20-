// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./Ownable.sol"; 

contract DegenGameToken is ERC20, Ownable {

    // Item costs mapping
    mapping(uint256 => uint256) public itemCosts;

    // Inventory mapping
    mapping(address => mapping(uint256 => uint256)) public playerInventory;

    constructor() ERC20("Degen", "DGN") Ownable() {
        itemCosts[1] = 300; // Sword
        itemCosts[2] = 250; // Shield
        itemCosts[3] = 200; // Potion
        itemCosts[4] = 350; // Armor
    }

    // Mint new tokens, only the owner can call this function
    function mint(address _to, uint256 _amount) public onlyOwner {
        _mint(_to, _amount);
    }

    // Transfer tokens
    function transferDGN(address _to, uint256 _amount) public {
        require(balanceOf(msg.sender) >= _amount, "Transfer Failed: Not enough balance.");
        transfer(_to, _amount);
    }

    // List available items
    function availableItems() external pure returns (string memory) {
        return "Items on sale: {1} Sword (300 DGN) {2} Shield (250 DGN) {3} Potion (200 DGN) {4} Armor (350 DGN)";
    }

    // Redeem tokens for items in the in-game store
    function redeemItem(uint256 _itemId) public {
        uint256 cost = itemCosts[_itemId];
        require(cost > 0, "Item is not available.");
        require(balanceOf(msg.sender) >= cost, "Redeem Failed: Not enough balance.");
        _transfer(msg.sender, owner, cost);

        // Deliver the item to the player
        playerInventory[msg.sender][_itemId] += 1;
    }

    // Burn tokens, anyone can burn their own tokens
    function burn(uint256 _amount) public {
        require(balanceOf(msg.sender) >= _amount, "Burn Failed: Not enough balance.");
        _burn(msg.sender, _amount);
    }

    // Check token balance
    function getBalance() external view returns (uint256) {
        return balanceOf(msg.sender);
    }

    // Check player inventory
    function getInventory(uint256 _itemId) external view returns (uint256) {
        return playerInventory[msg.sender][_itemId];
    }

    // Override decimals to set the token precision
    function decimals() override public pure returns (uint8) {
        return 18;
    }
}
