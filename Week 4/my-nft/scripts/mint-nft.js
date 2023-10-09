require('dotenv').config();
const ethers = require('ethers');

// Get Alchemy App URL
const API_KEY = process.env.API_KEY;
const API_URL = process.env.API_URL;

// Define an Alchemy Provider
const provider = new ethers.JsonRpcProvider(API_URL)

// Get contract ABI file
const contract = require("../artifacts/contracts/MyNFT.sol/MyNFT.json");

// Create a signer
const privateKey = process.env.PRIVATE_KEY
const signer = new ethers.Wallet(privateKey, provider)

// Get contract ABI and address
const abi = contract.abi
const contractAddress = '0x4140F269b4dc3f217A3768432D341b7f2606667b'

// Create a contract instance
const myNftContract = new ethers.Contract(contractAddress, abi, signer)

// Get the NFT Metadata IPFS URL
const tokenUri = "https://gateway.pinata.cloud/ipfs/Qmf1TZRCCEPN5B648Ppv9eogbsRfH4AgkZ4ukMwGjN3dbX"

// Call mintNFT function
const mintNFT = async () => {
    // const gasLimit = 2000000;
    let nftTxn = await myNftContract.mintNFT(signer.address, tokenUri)
    await nftTxn.wait()
    console.log(`NFT Minted! Check it out at: https://sepolia.etherscan.io/tx/${nftTxn.hash}`)
}

mintNFT()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });



//     require('dotenv').config();
// const ethers = require('ethers');

// // Get Alchemy API Key
// const API_KEY = process.env.API_KEY;

// // Define an Alchemy Provider (Make sure you have ethers version 5.0.0 or later)
// const provider = new ethers.providers.JsonRpcProvider('https://eth-sepolia.g.alchemy.com/v2/kzrngaG83lSBbTPtpIr9n3sZROy2EGbl' + API_KEY); // Replace with the correct Alchemy URL

// const contract = require("../artifacts/contracts/MyNFT.sol/MyNFT.json");

// // Create a signer
// const privateKey = process.env.PRIVATE_KEY;
// const signer = new ethers.Wallet(privateKey, provider);

// // Get contract ABI and address
// const abi = contract.abi;
// const contractAddress = '0x8349898F43f3743578C1C322A103CB3888fF1c8e'; // Replace with the correct contract address

// // Create a contract instance
// const myNftContract = new ethers.Contract(contractAddress, abi, signer);

// // Get the NFT Metadata IPFS URL
// const tokenUri = "https://gateway.pinata.cloud/ipfs/Qmf1TZRCCEPN5B648Ppv9eogbsRfH4AgkZ4ukMwGjN3dbX";

// // Call mintNFT function
// const mintNFT = async () => {
//     let nftTxn = await myNftContract.mintNFT(signer.address, tokenUri);
//     await nftTxn.wait();
//     console.log(`NFT Minted! Check it out at: https://sepolia.etherscan.io/tx/${nftTxn.hash}`);
// }

// mintNFT()
//     .then(() => process.exit(0))
//     .catch((error) => {
//         console.error(error);
//         process.exit(1);
//     });
