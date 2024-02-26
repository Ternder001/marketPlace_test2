// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Marketplace {
    struct Product {
        address owner;
        string name;
        uint256 price;
        bool isSold;
    }

    mapping(uint256 => Product) public products;
    uint256 public productCount;

    event ProductAdded(uint256 indexed productId, address indexed owner, string name, uint256 price);
    event ProductSold(uint256 indexed productId, address indexed buyer);

    function addProduct(string memory _name, uint256 _price) external {
        require(_price > 0, "Price must be greater than zero");

        productCount++;
        products[productCount] = Product({
            owner: msg.sender,
            name: _name,
            price: _price,
            isSold: false
        });

        emit ProductAdded(productCount, msg.sender, _name, _price);
    }

    function buyProduct(uint256 _productId) external payable {
        require(_productId > 0 && _productId <= productCount, "Invalid product ID");
        Product storage product = products[_productId];
        require(!product.isSold, "Product is already sold");
        require(msg.value >= product.price, "Insufficient funds");

        // Transfer funds to the seller
        payable(product.owner).transfer(msg.value);

        // Mark product as sold
        product.isSold = true;

        emit ProductSold(_productId, msg.sender);
    }
}
