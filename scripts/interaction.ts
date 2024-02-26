import { ethers } from "hardhat";

async function main() {
  const marketplaceFactoryAddress = "0x29DFce7F7135c0b871d70c7483518de52Ec766E2";
  const marketplaceFactory = await ethers.getContractAt("MarketplaceFactory", marketplaceFactoryAddress);

  // Deploy a new marketplace
  await marketplaceFactory.deployMarketplace();
  console.log("Marketplace deployed!");

  // Get the deployed marketplace address
  const [marketplaceAddress] = await marketplaceFactory.queryFilter(marketplaceFactory.filters.MarketplaceDeployed(null, null));
  const deployedMarketplaceAddress = marketplaceAddress.args[1];
  console.log("Deployed Marketplace Address:", deployedMarketplaceAddress);

  // Interact with the deployed marketplace
  const marketplace = await ethers.getContractAt("Marketplace", deployedMarketplaceAddress);

  // Example: Adding a product to the marketplace
  await marketplace.addProduct("Product 1", ethers.parseEther("0.1"));
  console.log("Product added to the marketplace!");

}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
