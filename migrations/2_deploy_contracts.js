//const ConvertLib = artifacts.require("ConvertLib");
const Verification = artifacts.require("Verification");
const LicenseManager = artifacts.require("LicenseManager");
var ECMath = artifacts.require("./tls-n/ECMath.sol");
var JsmnSolLib = artifacts.require("./tls-n/JsmnSolLib.sol");
var tlsnutils = artifacts.require("./imported/tlsnutils.sol");
var bytesutils = artifacts.require("./imported/bytesutils.sol");

module.exports = function(deployer) {
  deployer.deploy(JsmnSolLib);
  deployer.deploy(ECMath);
  deployer.deploy(bytesutils);
  deployer.link(ECMath, tlsnutils);
  deployer.deploy(tlsnutils);
  deployer.link(JsmnSolLib, Verification);
  deployer.link(bytesutils, Verification);
  deployer.link(tlsnutils, Verification);
  deployer.deploy(Verification);
  deployer.deploy(LicenseManager);

};
