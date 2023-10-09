// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyNFT is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    uint256 public max = 3000;
    uint256 public count = 0;

    constructor() ERC721("MyNFT", "NFT") {}

    function mintNFT(address recipient, string memory tokenURI) public onlyOwner returns (uint256)
    {
        require(count<=max,"Maximum limit reached");
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);
        count++;
        return newItemId;
    }

    function changeImage(uint256 tokenId, string memory newImageURI) public onlyOwner 
    {
        require(_exists(tokenId), "Token does not exist");
        _setTokenURI(tokenId, newImageURI);
    }
}