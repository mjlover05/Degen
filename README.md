# Degen
## Description
The DegenToken contract itself plays a crucial role in the entire gaming ecosystem. It facilitates seamless and secure in-game transactions between players. Through functions like transfer and transferFrom, players can exchange tokens with each other. Moreover, players can authorize third parties to perform token transfers on their behalf, adding a layer of flexibility and convenience.The mint function in the DegenToken contract empowers game administrators to create new tokens and distribute them to players. 
## The contracts is having 4 functions and all function have been passed successfully.

## The functionality of the contracts is as follows:
The DegenToken contract is responsible for managing a custom token used within the game for in-game transactions. It provides several essential functions to facilitate the token's usage among players.mint: The mint function serves the game administrator's role, allowing them to create new tokens and distribute them to players. It facilitates the controlled expansion of the token supply.burn: Players have the ability to burn, or destroy, their own tokens if they wish to do so. This feature provides flexibility to manage their token holdings.redeem: The redeem function empowers players to redeem in-game items from the gaming store by specifying the item's ID. It deducts the item's price from the player's token balance, updates the purchase history, and grants the item to the player in the game. The grantItem function from the Game contract is used for this purpose.
## Verification on Snowtrace Testnet
The contracts have been verified and deployed on the Snowtrace Testnet with the following contract addresses:
Please search on https://testnet.snowtrace.io/address/0x29AC171464b0265806C4fC756F2d7e95d79287D3

# DegenToken Contract: 0x29AC171464b0265806C4fC756F2d7e95d79287D3
   
You can interact with the contracts on the Snowtrace Testnet using the provided contract addresses.

## Testing
DegenToken
    ✔ Should have correct token properties (61ms)
    ✔ Should transfer tokens correctly (39ms)
    ✔ Should mint and burn tokens correctly (55ms)
    ✔ Should add an item and redeem it correctly (122ms)

## Getting Started
Download all files from github and run on VSCode or any online platform for its execution.

## Executing program
To compile and deploy the contracts, you can use a Solidity development environment like Remix or VS Code and Follow the steps below:

Install a Solidity compiler: You can use popular compilers like solc (Solidity Compiler) to compile your .sol file into bytecode that can be deployed on the Ethereum network.

Choose an Ethereum client: To interact with the Ethereum blockchain and deploy your smart contract, you'll need to use an Ethereum client. The most common clients are Geth and Parity.

Compile the .sol file: Use the Solidity compiler to compile your .sol file into bytecode and an Application Binary Interface (ABI). The ABI is a JSON representation of the contract's interface, which describes the functions and parameters that can be accessed externally.

Deploy the smart contract: Use your chosen Ethereum client to deploy the compiled bytecode and ABI to the Ethereum network. This will create a new smart contract on the blockchain, and you'll receive a contract address in return.

Interact with the smart contract: Once the contract is deployed, you can interact with it using various Ethereum wallets, web applications, or other smart contracts.

## Testing
To run the tests for the contracts, follow the steps below:
Run npm i to get its all Dependencies.
Make sure you have a local network set up. Then  RUN by using npm hardhat test for tesing.
We will get the tick mark if it passes cases and at end report will be  generated.
# Code

## Authors
Manish kumar
