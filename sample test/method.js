import ICO from "./contracts/ICO.json";


import ERC20 from "./contracts/ERC20.json";





import NFT from "./contracts/NFT.json";



import "./App.css";
import USDT from "./contracts/USDT.json";



///method for  purchasing tokens

const deployedNetwork = ICO.networks[networkId];

console.log(deployedNetwork.address);

const Ico_object= new web3.eth.Contract(
  ICO.abi,
  deployedNetwork && deployedNetwork.address,
);

const {ICO,accounts,erc,value}=this.state;
// console.log(ICO);


if(value<=0){
  alert("minimum amount  must be greater than zero");
}
else{


  let ICO_Bal=ICO._address;
  var get_bal=await erc.methods.balanceOf(ICO_Bal).call();

  console.log("ii")
  // console.log(get_bal);
  if(value<get_bal){


 const l= await ICO.methods.buyTokens(accounts).send({from:accounts,value:value,gas:300000});
 console.log(l);

 this.setState({value:0});
  }

  else{
    alert("token amount is more than available");
  }


}



// finished



// methods for checking the  balnce


const ercc = ERC20.networks[networkId];

console.log(ercc.address);

const erc_object= new web3.eth.Contract(
  ERC20.abi,
  ercc && ercc.address,
);

const balance=await erc_object.methods.balanceOf(accounts).call();
   
    
alert("Your  Balance is :" +balance);

//finished


///method for buying forever nft


const erc_1155_network=NFT.networks[networkId];

const erc1155=new web3.eth.Contract(
  NFT.abi,erc_1155_network && erc_1155_network.address
)

const buy=await erc1155.methods.buyNft().send({from:accounts,value:100,gas:200000});


const bal=await erc1155.methods.balanceOf(accounts,1).call();
// console.log(bal);
if(buy.events){
  alert("1 Nft  is  Purchased by ",accounts);
}
else{
  console.log("No Transaction Happens");
}
// finished

