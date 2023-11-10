 /*
    Project: Degen Token (ERC-20): Unlocking the Future of Gaming
    
    Project Requirements:
    1. Minting new tokens: The platform should be able to create new tokens and distribute them to players as rewards. Only the owner can mint tokens.
    2. Transferring tokens: Players should be able to transfer their tokens to others.
    3. Redeeming tokens: Players should be able to redeem their tokens for items in the in-game store.
    4. Checking token balance: Players should be able to check their token balance at any time.
    5. Burning tokens: Anyone should be able to burn tokens, that they own, that are no longer needed.
    
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts@4.9.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9.0/access/Ownable.sol";
import "@openzeppelin/contracts@4.9.0/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable {
    // Structure defining in-game Pokémon items, including name, stats, price, and total supply
    struct PokemonItem {
        string name;
        string stats;
        uint256 price;
        uint256 totalSupply;
    }

    // Array storing PokemonItem structures
    PokemonItem[] public pokemonItems;

    // Constructor executed once compiled and deployed
    constructor() ERC20("PokeToken", "PKT") {
        createPokemonItem("Potion", "Healing", 50, 100);
        createPokemonItem("Great Ball", "Capture Rate", 100, 50);
        createPokemonItem("Rare Candy", "Level Up", 200, 30);
        createPokemonItem("Running Shoes", "Speed Boost", 500, 20);
    }

    /*
        Functions below handle minting, transferring,
        redeeming, checking balance, and burning of tokens
    */

    // Mints tokens accessible only by the owner
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Transfers PKT tokens from sender to receiver
    function transferTokens(address _receiver, uint256 _value) external {
        require(_receiver != address(0), "Invalid address, not found");
        require(balanceOf(msg.sender) >= _value, "Insufficient balance for transferring tokens");
        _transfer(msg.sender, _receiver, _value);
    }

    // Event triggered when redeeming tokens through the redeemTokens function
    event RedeemAttempt(address indexed sender, uint256 itemIndex, uint256 balance);

    // Redeems tokens for in-game items
    function redeemTokens(uint256 _itemIndex) external payable {
        emit RedeemAttempt(msg.sender, _itemIndex, balanceOf(msg.sender));
        require(_itemIndex < pokemonItems.length, "Invalid item index, not found");
        PokemonItem storage item = pokemonItems[_itemIndex];
        require(item.totalSupply > 0, "The item is out of stock");
        uint256 itemPrice = item.price;

        _burn(msg.sender, itemPrice);
        item.totalSupply--; // Reduces the total supply of the redeemed item
    }

    // Checks the balance of an account specified by the address _account
    function checkBalance(address _account) external view returns (uint256) {
        return balanceOf(_account);
    }

    // Burns tokens accessible by any address or user
    function burnTokens(uint256 _value) external {
        require(balanceOf(msg.sender) >= _value, "Invalid value for burning tokens");
        _burn(msg.sender, _value);
    }

    // Creates a Pokemon item by adding it to the struct array
    function createPokemonItem(string memory _name, string memory _stats, uint256 _price, uint256 _initialSupply) internal onlyOwner {
        pokemonItems.push(PokemonItem(_name, _stats, _price, _initialSupply));
    }

    // Retrieves the in-game item count
    function getPokemonItemCount() external view returns (uint256) {
        return pokemonItems.length;
    }

    // Retrieves details of a Pokemon item based on the index
    function getPokemonItems(uint256 _itemIndex) external view returns (string memory name, string memory stats, uint256 price, uint256 totalSupply) {
        require(_itemIndex < pokemonItems.length, "Invalid item index, not found");
        PokemonItem storage item = pokemonItems[_itemIndex];
        return (item.name, item.stats, item.price, item.totalSupply);
    }

    // Retrieves the list of all Pokemon items
    function listPokemonItems() external view returns (PokemonItem[] memory) {
        require(pokemonItems.length > 0, "There are currently no Pokemon items");
        return pokemonItems;
    }
}
