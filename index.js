import web3 from 'web3'; 

        web3 = new Web3("http://localhost:8545");
        web3.eth.getAccounts().then(function(result){
        web3.eth.defaultAccount = result[0];
        });


        var contract = new web3.eth.Contract([
	{
		"constant": false,
		"inputs": [
			{
				"internalType": "string",
				"name": "nome",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "partido",
				"type": "string"
			},
			{
				"internalType": "uint16",
				"name": "digito",
				"type": "uint16"
			}
		],
		"name": "addCandidato",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "constructor"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"internalType": "string",
				"name": "nome",
				"type": "string"
			},
			{
				"indexed": false,
				"internalType": "uint16",
				"name": "digito",
				"type": "uint16"
			}
		],
		"name": "eAddCandidato",
		"type": "event"
	},
	{
		"constant": true,
		"inputs": [
			{
				"internalType": "uint16",
				"name": "digito",
				"type": "uint16"
			}
		],
		"name": "get",
		"outputs": [
			{
				"components": [
					{
						"internalType": "string",
						"name": "nome",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "partido",
						"type": "string"
					},
					{
						"internalType": "uint16",
						"name": "digito",
						"type": "uint16"
					}
				],
				"internalType": "struct votacao.candidato",
				"name": "",
				"type": "tuple"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	}
],'0xeFBE2A6a07BE34366a4C4f6e3ab3a4F59f6A34dc',{
    
        from: web3.defaultAccount,
        gasPrice: '20000000000'
        });
        
        

        console.log(contract.methods);
        function addCandidatoJS(){
            let nome = document.getElementById("name").value;
            let partido = document.getElementById("partido").value;
            let digito = document.getElementById("digito").value; 

            console.log(nome,partido,digito);
            contract.methods.addCandidato(nome, partido, parseInt(digito)).send({gas:2000000}).then(a=>console.log(a));
        }
        function getCandidatos(){
            let digito = document.getElementById("digito").value;
            contract.methods.get(parseInt(digito)).call().then(a=>document.getElementById("votacao").innerHTML = a);
            
        }
    
