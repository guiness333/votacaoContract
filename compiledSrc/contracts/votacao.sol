pragma solidity ^0.5.1;
pragma experimental ABIEncoderV2;

contract votacao {
    candidato[] candidatos;
    address owner;
    
    struct candidato{
        string nome;
        string partido;
        uint16 digito;
    }
    
    
    constructor() public {
        owner = msg.sender;
    }
    
    event eAddCandidato(string nome, uint16 digito);

    function addCandidato(string memory nome, string memory partido, uint16 digito) public {
        require(owner == msg.sender, "somente o dono do contrato pode adicionar candidatos!");
        candidato memory c;
        c.nome = nome;
        c.partido = partido;
        c.digito = digito;
        candidatos.push(c);
        emit eAddCandidato(c.nome, c.digito);
    }
    function get(uint16 digito) public view returns (candidato memory){
        for(uint i=0;i<candidatos.length; i++){
            if(candidatos[i].digito == digito){
                return candidatos[i];
            }
        }
    }
}