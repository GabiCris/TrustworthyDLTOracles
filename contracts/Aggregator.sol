pragma solidity >=0.4.11 <0.7.0;

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

    uint[] public royaltyParameterIds;
    mapping(uint => ParameterDescriptor) royaltyParametersDescriptors;
    mapping(uint => RoyaltyParameter) royaltyParams;

    function areAllParamAvailable() public returns(bool) {
        return true;
    }

    function isParamAvailable(uint paramId) private returns(bool available){
        return true;
    }

    function requestParameter(uint paramId) private returns(string param){
        return "";
    }

}