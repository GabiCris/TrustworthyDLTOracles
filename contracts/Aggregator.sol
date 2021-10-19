pragma solidity >=0.4.11 <0.7.0;

import "./RoyaltyComputation.sol";

contract Aggregator {
    address public royaltyComputationContract;
    
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

    event AllRoyaltyParamAvailable(string msg, uint256 timestamp);

    uint[] public royaltyParameterIds;
    mapping(uint => ParameterDescriptor) royaltyParametersDescriptors;
    mapping(uint => RoyaltyParameter) royaltyParams;

    function areAllParamAvailable() public returns(bool) {
        emit AllRoyaltyParamAvailable("Aggregator finished collecting royalty parameters.", block.timestamp);
        address adr = 0xD9BF44c40F097815caA9c9BEc87B762d87Fc2074;
        RoyaltyComputation r = RoyaltyComputation(adr);
        r.computeRoyalty();
        return true;
    }

    function isParamAvailable(uint paramId) private returns(bool available){
        return true;
    }

    function requestParameter(uint paramId) private returns(string param){
        return "";
    }

}