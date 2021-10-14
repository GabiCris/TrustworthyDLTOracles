//const ConvertLib = artifacts.require("ConvertLib");
var JsmnSolLib = artifacts.require("./tls-n/JsmnSolLib.sol");
var ECMath = artifacts.require("./tls-n/ECMath.sol");
var bytesutils = artifacts.require("./tls-n/bytesutils.sol");
var tlsnutils = artifacts.require("./tls-n/tlsnutils.sol");
var Verification = artifacts.require("Verification.sol");
var LicenseManager = artifacts.require("LicenseManager.sol");
var RoyaltyComputation = artifacts.require("RoyaltyComputation.sol");
var Aggregator = artifacts.require("Aggregator.sol");

module.exports = function(deployer) {
  deployer.deploy(JsmnSolLib);
  deployer.deploy(ECMath);
  deployer.deploy(bytesutils);
  deployer.link(ECMath, tlsnutils);
  deployer.deploy(tlsnutils);
  // deployer.link(JsmnSolLib, Verification);
  // deployer.link(bytesutils, Verification);
  deployer.link(tlsnutils, Verification);
  deployer.deploy(Verification);
  deployer.deploy(LicenseManager);
  deployer.deploy(RoyaltyComputation);
  deployer.deploy(Aggregator);

};
