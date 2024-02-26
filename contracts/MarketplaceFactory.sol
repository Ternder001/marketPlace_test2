// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Marketplace.sol";

contract MarketplaceFactory {
    event MarketplaceDeployed(address indexed owner, address indexed marketplaceAddress);

    function deployMarketplace() external {
        Marketplace newMarketplace = new Marketplace();
        emit MarketplaceDeployed(msg.sender, address(newMarketplace));
    }
}
