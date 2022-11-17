import getWeb3 from "./getWeb3";

import GLDToken from "./contracts/GLDToken.json";

async function CallTestContract() {
    try {
      // Get network provider and web3 instance.
      const web3 = await getWeb3();
      // Use web3 to get the user's accounts.
      const accounts = await web3.eth.getAccounts();
      // Get the contract instance.
      const networkId = await web3.eth.net.getId();
      const instance2=new web3.eth.Contract(
        GLDToken.abi,

        3&&"0x0971451D332A9ab5914FEc3EBA5123b5729BB593",
      );

      this.setState({ web3,accounts:accounts,GLDToken:instance2}, this.runExample);
     
    } catch (error) {
      
      alert(
        `Failed to load web3, accounts, or contract. Check console for details.`,
      );
      console.error(error);
    }
  };
  get_bal=async()=>{

    const {accounts,GLDToken}=this.state;
    const get_d=await GLDToken.methods.check_decimal().call();
    console.log(get_d);
  

  }


  mint=async()=>{
    const {accounts,GLDToken}=this.state;
    const mint_token=await GLDToken.methods.mint().send({from:accounts[0],gas:200000});
    console.log(mint_token);

  }
