    import web3, { eth } from 'web3';
    web3 = new Web3('ws://localhost:8545');
    console.log(web3);
    eth.defaultAccount = eth.accounts[0];