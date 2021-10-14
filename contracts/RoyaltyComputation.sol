pragma solidity >=0.4.11 <0.7.0;

contract RoyaltyComputation {
    address public licenseManagerContract;
    address public aggregatorContract;

    struct RoyaltyParameter {
        uint256 id;
        uint256 timestamp;
        string data;
    }

    mapping (uint => RoyaltyParameter) public royaltyParameters;

    function areParametersCollected() public returns(bool collected) {
        return true;
    }

    function computeRoyalty() private returns(uint royalty) {
        if (areParametersCollected()) {
            sendComputedRoyalty();
            return 1;
        }
        return 0;
    }

    function sendComputedRoyalty() public {
    }

}