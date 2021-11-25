pragma solidity >=0.4.11 <0.7.0;

import "./RoyaltyComputation.sol";
import "./Verification.sol";
import "./DecentralizedOracle.sol";
import "./RoyaltyComputation.sol";

contract Aggregator {
    address public royaltyComputationContract;
    Verification verif;
    DecentralizedOracle decOracle;
    RoyaltyComputation royComp;
    string testData;
    uint exchangeRate;
    uint usageTime;

    function setVerif(address _verif) public {
        verif = Verification(_verif);
        usageTime = verif.getDataInt();
    }

    function setDecOracle(address _dec) public {
        decOracle = DecentralizedOracle(_dec);
        exchangeRate = decOracle.getEuroExchange();
    }

    function setRoyaltyComputation(address _roy) public {
        royComp = RoyaltyComputation(_roy);
    }
    
    // function Aggregator(address _verif, address _decOracle) {
    //     verif = Verification(_verif);
    //     testData = verif.getTestData();
    // }
    struct ParameterDescriptor{
        uint paramId;
        address sourceContract;
        bool isPublic;
        bool isPrivate;
    }

    struct RoyaltyParameter{
        ParameterDescriptor param;
        bool isAvailable;
        string rawData;
    }

    function getExchangeRate() public returns (uint) {
        return exchangeRate;
    }

    function getTestData() public returns (string) {
        return testData;
    }

    function getUsageTime() public returns(uint) {
        return usageTime;
    } 

    function triggerRoyaltyComputation() public {
        emit AllRoyaltyParamAvailable("Triggering royalty computation", block.timestamp);
        // royComp.setUsageTime(usageTime);
        usageTime = verif.getDataInt();
        exchangeRate = decOracle.getEuroExchange();

        // trigger royalty computation after params are updated
        royComp.triggerComputation(exchangeRate, usageTime);
    }

    event AllRoyaltyParamAvailable(string msg, uint256 timestamp);

    uint[] public royaltyParameterIds;
    mapping(uint => ParameterDescriptor) royaltyParametersDescriptors;
    mapping(uint => RoyaltyParameter) royaltyParams;

    function areAllParamAvailable() private returns(bool) {
        emit AllRoyaltyParamAvailable("Aggregator finished collecting royalty parameters.", block.timestamp);
        // address adr = 0xD9BF44c40F097815caA9c9BEc87B762d87Fc2074;
        // RoyaltyComputation r = RoyaltyComputation(adr);
        // r.computeRoyalty();
        return true;
    }

    function isParamAvailable(uint paramId) private returns(bool available){
        return true;
    }

    function requestParameter(uint paramId) private returns(string param){
        return "";
    }

}