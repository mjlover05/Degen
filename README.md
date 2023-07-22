# Degen
## Description
The DegenToken contract itself plays a crucial role in the entire gaming ecosystem. It facilitates seamless and secure in-game transactions between players. Through functions like transfer and transferFrom, players can exchange tokens with each other. Moreover, players can authorize third parties to perform token transfers on their behalf, adding a layer of flexibility and convenience.The mint function in the DegenToken contract empowers game administrators to create new tokens and distribute them to players. 
## The contracts have been thoroughly tested and have passed all the functionality requirements.

## The functionality of the contracts is as follows:
The DegenToken contract is responsible for managing a custom token used within the game for in-game transactions. It provides several essential functions to facilitate the token's usage among players.mint: The mint function serves the game administrator's role, allowing them to create new tokens and distribute them to players. It facilitates the controlled expansion of the token supply.burn: Players have the ability to burn, or destroy, their own tokens if they wish to do so. This feature provides flexibility to manage their token holdings.redeem: The redeem function empowers players to redeem in-game items from the gaming store by specifying the item's ID. It deducts the item's price from the player's token balance, updates the purchase history, and grants the item to the player in the game. The grantItem function from the Game contract is used for this purpose.
## Verification on Snowtrace Testnet
The contracts have been verified and deployed on the Snowtrace Testnet with the following contract addresses:
Please search on https://testnet.snowtrace.io/

1. Game Contract: 0xA575BaCBf9AB3cb22AA773A4b4e53Bf2601D17F6
2. GamingStore Contract: 0xc22052AFA28bf1671cC9e827243e9D3355f4277F
3. DegenToken Contract: 0xB8a646a691ea2ABF67450AAf5c53FA908a790517
   
You can interact with the contracts on the Snowtrace Testnet using the provided contract addresses.

## Testing
The contracts have undergone comprehensive testing to ensure their functionality and robustness. The testing process involved the following steps:

Unit Testing: Each contract was individually tested using Solidity unit testing frameworks like Hardhat. The unit tests cover various scenarios to verify the correct implementation of contract functions and validate their expected behavior.

Integration Testing: The contracts were tested together to ensure their compatibility and proper interaction. Integration tests were performed to verify the seamless functioning of the game, gaming store, and DegenToken contracts as a unified system.

Deployment Testing: The contracts were deployed on the Snowtrace Testnet and extensively tested in a simulated live environment. The testing process included verifying the correct deployment of contracts, executing various transactions, and validating the expected outcomes.

Security Audits: The contracts were reviewed and audited for potential security vulnerabilities by experienced Solidity developers and auditors. The identified issues, if any, were addressed to enhance the security of the contracts.

By undergoing rigorous testing, including unit testing, integration testing, deployment testing, and security audits, the contracts have proven to be reliable and robust for use in the intended scenarios.

## Getting Started
Installing
To use these contracts, you can download the Solidity source code files directly from this repository.

## Executing program
To compile and deploy the contracts, you can use a Solidity development environment like Remix . Follow the steps below:

Open the Solidity development environment of your choice.
Create a new Solidity file for each contract: Game.sol, GamingStore.sol, and DegenToken.sol.
Copy the contract code into their respective files.
Compile the contracts in the development environment, ensuring you set the appropriate compiler version (pragma).
Deploy the contracts to the Snowtrace Testnet using the provided contract addresses.
Once the contracts are deployed, you can interact with them using a web3-enabled application or by calling the contract functions directly.

## Testing
To run the tests for the contracts, follow the steps below:

Install the required dependencies by running npm install in the project directory.
Make sure you have a local Ethereum network or testnet set up. You can use tools like Hardhat  for local development and testing.
Run the tests using npx hardhat test command.
The tests cover various scenarios and ensure the correct functionality of the contracts. They verify the grant and retrieval of items in the Game contract, addition and redemption of items in the GamingStore contract, and token transfers and approvals in the DegenToken contract.

The test results will be displayed in the console, indicating whether the tests have passed or failed. Any failures or errors will be highlighted for further investigation.
# Code

## Authors
Manish kumar
