// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

interface IMarketPlace {
    function buyProduct(uint256 _productId) external payable;

    function addProduct(string memory _name, uint256 _price) external;
}