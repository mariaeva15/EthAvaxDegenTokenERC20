# Degen Token (ERC-20): Unlocking the Future of Gaming

## Project Overview

The Degen Token project introduces an ERC-20 standard token designed for gaming applications. The token, named `PokeToken` (PKT), is built on the Ethereum blockchain and aims to enhance in-game experiences by providing features such as minting, transferring, redeeming, checking balances, and burning.

## Project Requirements

1. **Minting New Tokens:** Exclusive to the owner, this feature allows for the creation and distribution of new tokens as rewards.

2. **Transferring Tokens:** Players can seamlessly transfer their tokens to other participants in the gaming ecosystem.

3. **Redeeming Tokens:** Players have the ability to exchange tokens for in-game items available in the store.

4. **Checking Token Balance:** Players can conveniently check their token balances at any time.

5. **Burning Tokens:** Token holders have the flexibility to burn unnecessary tokens.

## Smart Contract Details

### Token Structure
The `DegenToken` smart contract inherits from the ERC20 standard and includes additional functionality through the `Ownable` and `ERC20Burnable` contracts.

### In-Game Pokémon Items
The contract includes a structure, `PokemonItem`, defining in-game items such as name, stats, price, and total supply. These items are stored in an array for easy retrieval.

### Contract Functions
- **Minting:** The owner can mint new tokens using the `mint` function.
- **Transferring Tokens:** Users can transfer tokens to others using the `transferTokens` function.
- **Redeeming Tokens:** Tokens can be redeemed for in-game items through the `redeemTokens` function.
- **Checking Balance:** Users can check their token balance using the `checkBalance` function.
- **Burning Tokens:** Any token holder can burn tokens with the `burnTokens` function.

## Running the Program

Follow these steps to run the Degen Token smart contract using Remix Ethereum IDE:

**Step 1: Create a File 
Create a new file with your preferred name, for example, `DegenToken.sol`.

**Step 2: Paste Source Code
Copy the source code from the provided file (`DegenToken.sol`) and paste it into the newly created file.

**Step 3: Compile and Save
Press `Ctrl + S` to compile and save the file. Ensure that the compiler is set to version 0.8.18.

**Step 4: Change Environment to Injected Provider - Metamask
Change the environment in Remix to "Injected Provider - Metamask." This allows you to interact with the AVAX network.

**Step 5: Launch the Smart Contract
Click the "Deploy" button in Remix to launch the smart contract. This action will trigger a Metamask notification to consume AVAX tokens.

**Step 6: Check Transaction
After initiating the deployment, check the transaction status in [SnowTrace](https://testnet.snowtrace.io/) by pasting your wallet address in the search bar for transactions.

**Step 7: Execute the Smart Contract
Once the transaction is confirmed, you can execute the smart contract on the AVAX network.

Now, the Degen Token is ready for use in your gaming ecosystem, providing minting, transferring, redeeming, balance checking, and burning functionalities.


### Code Description
The code implements a flexible ERC-20 token with additional gaming-specific features, facilitating a seamless integration into gaming ecosystems. It incorporates OpenZeppelin library components for enhanced security and functionality.

### Reference
This project was inspired by a token creation project, and the structure is adapted from the OpenZeppelin library.

## Authors
- Maria Evangelicalyn Ong

## License
This project is licensed under the MIT License. See the LICENSE.md file for details.
