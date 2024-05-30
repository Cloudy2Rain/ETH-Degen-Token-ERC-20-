# ETH-Degen-Token-ERC-20

This smart contract, named "DegenGameToken," is an Ethereum-based ERC20 token contract designed for Degen Gaming. 
The smart contract  have the following functionality:
  - Minting new tokens
  - Transferring tokens
  - Redeeming tokens
  - Checking token balance
  - Burning tokens
## Getting Started
### Executing Program
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., DegenGameToken.sol). Copy and paste the code in the DegenGameToken file together with this repository.

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.10" (or another compatible version), and then click on the "Compile DegenGameToken.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. This will open a new window that allows you to deploy the contract. Do not forget to select the “DegenGameToken” contract before deploying.

Once the contract is deployed, you can interact with it using Remix's user-friendly interface. As the contract owner, you have the ability to mint fresh tokens to specific addresses using the mint function. Furthermore, any user can make token transfers to other addresses by using the transfer function. Additionally, users can burn their own tokens using the burn function. The Remix Ethereum IDE allows you to explore with these functions and acquire insights into their behavior within Solidity smart contracts. Test the contract's functionality by using the mint, transfer, and burn functions, redeeming, as well as checking token balance.

```

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenGameToken is ERC20, Ownable

```

## Authors

Rianne Mikaela Gayos 8215086@ntc.edu.ph


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
