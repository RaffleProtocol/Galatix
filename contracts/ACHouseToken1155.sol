pragma solidity ^0.8.3;
//"SPDX-License-Identifier: UNLICENSED"

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/utils/ERC1155Receiver.sol";


contract ACHouseToken1155 is ERC1155, IERC1155Receiver {
    address parentAddress;

    uint256[] tokensIdscreated;
    
    constructor() ERC1155("") {}
    
    
    function setParentAddress(address _address) public {
        parentAddress = _address;
    }

    /**
    public functions available through implementation of ERC1155
    -supportsInterface
    -uri - get the current set uri
    -balanceOf
    -balanceBatch
    -setApprovalForAll
    -isApprovedForAll
    -safeTransferFrom
    -safeBatchTransferFrom

     */ 
    function mintNFT(address _ownerAddress, uint256 _id, uint256 amount ) public {
       // using erc 1155 to creat NFT
       // mint will create NFT and send it to the address. IF address is parent contract then it will throw error unless IERC1155Receiver.onERC1155BatchReceived is implemented. 

       _mint(_ownerAddress, _id, amount, ""); 
       tokensIdscreated.push(_id);

    }

    function setURI(string memory newuri) public {
        _setURI(newuri);
    }
    
    //get tokens totalnumber. 
    function getTokenCount() public view returns (uint256) {
        return tokensIdscreated.length;
    }
    //returns the array of all tokenids. 
    function getTokenIds() public  view returns ( uint256[] memory) {
        return tokensIdscreated;
    }
    
    function onERC1155Received( address operator, address from,uint256 id, uint256 value, bytes calldata data) override pure external returns (bytes4){
        return bytes4(keccak256("onERC1155Received(address,address,uint256,uint256,bytes)"));
    }
    
    function onERC1155BatchReceived( address operator, address from, uint256[] calldata ids, uint256[] calldata values, bytes calldata data ) override pure external returns (bytes4){
        return bytes4(keccak256("onERC1155BatchReceived(address,address,uint256[],uint256[],bytes)"));
    }


}