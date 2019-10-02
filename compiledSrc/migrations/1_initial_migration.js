const Migrations = artifacts.require("Migrations");
const votacao = artifacts.require("votacao");
module.exports = function(deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(votacao);
};
