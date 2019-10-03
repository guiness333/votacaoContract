var votacao = artifacts.require("votacao");

module.exports = function(deployer) {
  deployer.deploy(votacao);
};