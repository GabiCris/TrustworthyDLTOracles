pragma solidity >=0.4.11 <0.7.0;

import "./LicenseManager.sol";

contract RoyaltyComputation {
    address public licenseManagerContract;
    address public aggregatorContract;
    uint tempRoyalty;

    struct RoyaltyParameter {
        uint256 id;
        uint256 timestamp;
        string data;
    }

    uint exchangeRate;
    uint usageTime;

    event RoyaltyIsComputed(string msg, uint256 timestamp, uint royaltyValue);
    mapping (uint => RoyaltyParameter) public royaltyParameters;

    function areParametersCollected() public returns(bool collected) {
        return true;
    }

    function getRoyalty() public returns (uint) {
        return tempRoyalty;
    }

    function computeRoyalty() public returns(uint royalty) {
        if (areParametersCollected()) {
            royalty = usageTime * exchangeRate/100;
            tempRoyalty = royalty;
            // address adr = 0x6CAA36a367fCBE88Fc379343a46497F679F1Dfd1;
            // LicenseManager l = LicenseManager(adr);
            // l.receivedComputedRoyalty();
            // sendComputedRoyalty();
            // return 256;
            emit RoyaltyIsComputed("Royalty was computed", block.timestamp, royalty);
            return royalty;
        }
        return 0;
    }

    function sendComputedRoyalty() public {
    }

    function setDecOracleData(uint _exch) public {
        exchangeRate = _exch;
    }

    function setUsageTime(uint _usage) public {
        usageTime = _usage;
    }

    function triggerComputation(uint exch, uint usage) public {
        exchangeRate = exch;
        usageTime = usage;
        tempRoyalty = usageTime * exchangeRate;
        emit RoyaltyIsComputed("Royalty was computed", block.timestamp, tempRoyalty);
        //computeRoyalty();
    }

}