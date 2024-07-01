# Wee-Jencen_Module-4

## Overview
JencenGaming is an ERC20 token contract built on the Ethereum blockchain using Solidity. The token is named "Degen" with the symbol "DGN". 
This contract includes additional functionalities for minting, burning tokens, transferring ownership, and redeeming in-game items.

## Challenges 

Your task is to create a ERC20 token and deploy it on the Avalanche network for Degen Gaming. The smart contract should have the following functionality:

1. Minting new tokens: The platform should be able to create new tokens and distribute them to players as rewards. Only the owner can mint tokens.
2. Transferring tokens: Players should be able to transfer their tokens to others.
3. Redeeming tokens: Players should be able to redeem their tokens for items in the in-game store.
4. Checking token balance: Players should be able to check their token balance at any time.
5. Burning tokens: Anyone should be able to burn tokens, that they own, that are no longer needed.

##Functionality 

Here's the breakdown of the functionalities after the contract has been deployed.

1. approve
   - Purpose: Allows a spender to spend up to a certain number of tokens on behalf of the owner.
   - Parameters: `spender` - The address allowed to spend tokens, `amount` - Maximum tokens spender can use.
   - Usage: Setting allowances for other contracts or users.
     
2. burn
   - Purpose: Allows a user to destroy (burn) a specified amount of their own tokens, reducing total supply.
   - Parameters: `amount` - Tokens to burn.
   - Usage: Removing tokens from circulation, often for deflationary purposes.
     
3. mint
   - Purpose: Allows the owner to create new tokens and assign them to a specified address.
   - Parameters: `to` - Address receiving new tokens, `amount` - Tokens to mint.
   - Usage: Distributing tokens as rewards or increasing total supply.
     
4. redeem
   - Purpose: Allows a user to redeem tokens for in-game items.
   - Parameters: `amount` (tokens), `item` (string).
   - Usage: Enables token exchange for rewards or services within a platform, with restrictions on certain players.
     
5. redeemedItems
   - Purpose: To check if a specific item has been successfully redeemed.
6. redeemItemCount
   - Purpose: To count the number of redeemed items.
     
7. transfer
   - Purpose: Transfers tokens from the sender's account to a specified recipient.
   - Parameters: `recipient` (address), `amount` (tokens).
   - Usage: Basic function for sending tokens between users.
     
8. transferFrom
   - Purpose: Allows a spender to transfer tokens from one account to another if approved.
   - Parameters: `sender` (address), `recipient` (address), `amount` (tokens).
   - Usage: Used in conjunction with approve to allow delegated transfers.

# Author
Wee, Jencen M. 
8212778@ntc.edu.ph
