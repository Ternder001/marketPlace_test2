

import { ethers } from "hardhat";

async function main() {
  const MarketplaceFactory = await ethers.getContractFactory("MarketplaceFactory");
  const marketplaceFactory = await MarketplaceFactory.deploy();

  await marketplaceFactory.waitForDeployment();

  console.log("----------DEPLOYED TO SEPOLIA TESTNET-----------------")

  console.log(`Marketplace Factory contract deployed to ${marketplaceFactory.target}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
