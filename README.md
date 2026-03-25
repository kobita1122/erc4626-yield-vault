# ERC-4626 Yield Vault

This repository provides a standard-compliant vault that manages user deposits and interacts with external protocols to generate yield. By following the **ERC-4626** standard, this vault is "plug-and-play" with existing DeFi dashboards, Zapper, and other yield optimizers.

## Key Features
* **Standardized API**: Implements `deposit`, `withdraw`, `mint`, and `redeem`.
* **Share Calculation**: Automatically handles the math for converting underlying assets to vault shares.
* **Fee Logic**: Includes a foundation for implementing management or performance fees.

## Implementation Details
* **Asset**: The underlying token (e.g., USDC or DAI).
* **Shares**: The yield-bearing token representing the user's position.
* **Virtual Offsets**: Uses OpenZeppelin's math to prevent "inflation attacks" common in early-stage vaults.
