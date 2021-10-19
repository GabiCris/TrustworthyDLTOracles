pragma solidity >=0.4.11 <0.7.0;

import "./LicenseManager.sol";

contract RoyaltyComputation {
    address public licenseManagerContract;
    address public aggregatorContract;

    struct RoyaltyParameter {
        uint256 id;
        uint256 timestamp;
        string data;
    }

    event RoyaltyIsComputed(string msg, uint256 timestamp, uint256 royaltyValue);
    mapping (uint => RoyaltyParameter) public royaltyParameters;

    function areParametersCollected() public returns(bool collected) {
        return true;
    }

    function computeRoyalty() public returns(uint royalty) {
        if (areParametersCollected()) {
            emit RoyaltyIsComputed("Royalty was computed", block.timestamp, 256);
            address adr = 0x6CAA36a367fCBE88Fc379343a46497F679F1Dfd1;
            LicenseManager l = LicenseManager(adr);
            l.receivedComputedRoyalty();
            sendComputedRoyalty();
            return 256;
        }
        return 0;
    }

    function sendComputedRoyalty() public {
    }

}