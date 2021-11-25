//const ConvertLib = artifacts.require("ConvertLib");
// var JsmnSolLib = artifacts.require("./tls-n/JsmnSolLib.sol");
// var ECMath = artifacts.require("./tls-n/ECMath.sol");
// var bytesutils = artifacts.require("./tls-n/bytesutils.sol");
// var tlsnutils = artifacts.require("./tls-n/tlsnutils.sol");
var Verification = artifacts.require("Verification.sol");
var LicenseManager = artifacts.require("LicenseManager.sol");
var RoyaltyComputation = artifacts.require("RoyaltyComputation.sol");
var Aggregator = artifacts.require("Aggregator.sol");
var DecentralizedOracle = artifacts.require("DecentralizedOracle.sol");

module.exports = async function(deployer) {
  // deployer.deploy(JsmnSolLib);
  // deployer.deploy(ECMath);
  // deployer.deploy(bytesutils);
  // deployer.link(ECMath, tlsnutils);
  // deployer.deploy(tlsnutils);
  // deployer.link(JsmnSolLib, Verification);
  // deployer.link(bytesutils, Verification);
  // deployer.link(tlsnutils, Verification);
  await deployer.deploy(Verification);
  const verif = await Verification.deployed();
  // console.log("ADDRESS: ", inst.address);
  // console.log(Verification.address);
  await deployer.deploy(DecentralizedOracle);
  const decOracle = await DecentralizedOracle.deployed();
  await deployer.deploy(Aggregator);
  const agg = await Aggregator.deployed();

  await agg.setVerif(verif.address);
  await agg.setDecOracle(decOracle.address);
  await verif.setAggregator(agg.address);

  await deployer.deploy(LicenseManager);
  const licManager = await LicenseManager.deployed();
  await deployer.deploy(RoyaltyComputation);
  const royComp = await RoyaltyComputation.deployed();
  await agg.setRoyaltyComputation(royComp.address);


};
