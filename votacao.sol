pragma solidity ^0.5.1;

contract votacao {
    candidato[] candidatos;
    address owner;
    uint32 _idGlobal=0;
    struct candidato{
        uint32 _id;
        string nome;
        string partido;
        string digito;
        uint32 votos;
    }
    
    
    constructor() public {
        owner = msg.sender;
    }
    
    event eAddCandidato(string nome, string digito);

    function addCandidato(string memory nome, string memory partido, string memory digito) public {
        require(owner == msg.sender, "somente o dono do contrato pode adicionar candidatos!");
        candidato memory c;
        c.nome = nome;
        c.partido = partido;
        c.digito = digito;
        c._id = _idGlobal++;
        candidatos.push(c);
        
        emit eAddCandidato(c.nome, c.digito);
    }
    function getCandidato(string memory digito) public view returns (string memory){
        for(uint i=0;i<candidatos.length; i++){
            if(equal(candidatos[i].digito, digito)){
                return append(candidatos[i].nome,",",candidatos[i].partido,",", candidatos[i].digito);
            }
        }
    }
    function getNumVotes(string memory digito) public view returns (uint32){
        for(uint i=0;i<candidatos.length; i++){
            if(equal(candidatos[i].digito, digito)){
                return candidatos[i].votos;
            }
        }
    }
    function votar(string memory digito) public returns (string memory){
        for(uint i=0;i<candidatos.length; i++){
            if(equal(candidatos[i].digito, digito)){
               candidatos[i].votos++;
               return candidatos[i].nome;
            }
        }
    }
    function getId(string memory digito) public view returns(uint32){
        for(uint i=0;i<candidatos.length; i++){
            if(equal(candidatos[i].digito, digito)){
               return candidatos[i]._id;
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    //----------------Utils-------------------------
    function append(string memory a, string memory  b, string memory c, string memory d, string memory e) internal pure returns (string memory) {
        return string(abi.encodePacked(a, b, c, d, e));
    }
    
    function compareStrings (string memory a, string memory b) internal pure 
        returns (bool) {
        return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))) );

    }
       function compare(string memory _a, string memory _b) internal pure returns (int) {
        bytes memory a = bytes(_a);
        bytes memory b = bytes(_b);
        uint minLength = a.length;
        if (b.length < minLength) minLength = b.length;
        //@todo unroll the loop into increments of 32 and do full 32 byte comparisons
        for (uint i = 0; i < minLength; i ++)
            if (a[i] < b[i])
                return -1;
            else if (a[i] > b[i])
                return 1;
        if (a.length < b.length)
            return -1;
        else if (a.length > b.length)
            return 1;
        else
            return 0;
    }
    /// @dev Compares two strings and returns true iff they are equal.
    function equal(string memory _a, string memory _b) internal pure returns (bool) {
        return compare(_a, _b) == 0;
    }
   
       
       
}