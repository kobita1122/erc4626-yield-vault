const hre = require("hardhat");

async function main() {
  const [deployer] = await hre.ethers.getSigners();

  // Deploy a mock asset (e.g., Mock USDC)
  const MockToken = await hre.ethers.getContractFactory("ERC20"); // Using base ERC20 for mock
  // Note: For a real mock, you'd use a specific MockERC20 contract
  
  const UNDERLYING_ASSET = "0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48"; // USDC Example

  const Vault = await hre.ethers.getContractFactory("YieldVault");
  const vault = await Vault.deploy(UNDERLYING_ASSET, "Yield Bearing USDC", "yUSDC");

  await vault.waitForDeployment();
  console.log(`ERC-4626 Vault deployed to: ${await vault.getAddress()}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
