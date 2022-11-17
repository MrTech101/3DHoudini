// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Burnable.sol";
import "./NFT/ERC1155Holder.sol";

contract NFT is ERC1155, Ownable, ERC1155Burnable , ERC1155Holder{ 

address Contract;
uint256 private buyPrice;
uint256 private VoucherDiscount;
mapping (address => uint256) Investor;
mapping (uint256 => uint256) Discount;
mapping (uint256 => uint256) checkLevels;

struct Books{
  address Investor;
  uint256 Discount;
  uint256 checkLevels;
}

struct nftSale{
    address investor;
    uint256 sAmount;
} 
nftSale[] public Sales;

Books[] Discounted;

constructor(string memory uri_) ERC1155(uri_) payable {}


function supportsInterface(bytes4 interfaceId) public view virtual override(ERC1155Receiver, ERC1155) returns (bool) {
        return super.supportsInterface(interfaceId);
}

function setContractAddr(address _contract) external onlyOwner returns(address){
    Contract = _contract;
    return Contract;
}
function mint(address account, uint256 id, uint256 amount) external onlyOwner{
        _mint(account, id, amount,"");
}

function setBuyPrice(uint256 _price) external onlyOwner returns(uint256){
    buyPrice = _price;
    return buyPrice;
}

function buyNft() public payable returns(address){
    require(msg.value == buyPrice, "Not enough ETH sent; check price!"); 
    safeTransferFrom(Contract,msg.sender, 1,1 ,"");
    return msg.sender;
}

function updateSales(address _investor, uint256 _amount) public{
  (uint256 checkerId ) = balanceOf(_investor , 1);
  if (checkerId > 0 ) {
    Sales.push(nftSale(_investor,_amount));
  } 
}

function _alotDiscount(uint256 _discount) external onlyOwner() returns(uint256) {
    VoucherDiscount = _discount;
    return(VoucherDiscount);
}

function _checkDiscount() public view returns(uint256){
    return VoucherDiscount;
}

enum NftLevel{ Neon ,Fire, Plasma, Atomic , SuperNova}
   NftLevel level;
   NftLevel constant defaultChoice = NftLevel.Neon;

    function setNeon() public returns(NftLevel){
        //if(sAmount >= 4000){ level.neon}
        level = NftLevel.Neon;
        return level;
    }

    function setFire() public returns(NftLevel){
        level = NftLevel.Fire;
        return level;
    }

   function setPlasma() public returns (NftLevel) {
      level = NftLevel.Plasma;
      return level;
   }

   function setAtomic() public returns(NftLevel) {
      level = NftLevel.Atomic;
      return level;
   }

    function setSuperNova() public returns(NftLevel){   
       level = NftLevel.SuperNova;
       return level;
    }
    
    function nextStage() external onlyOwner  {
        level = NftLevel(uint(level) + 1);
    }

     function getDefaultChoice() public pure returns (uint) {
      return uint(defaultChoice);
   }

   function currentLevel() public view returns(uint){
       return uint(level);
   }

}  

