pragma solidity >=0.4.11 <0.7.0;

contract LicenseManager {
    address[] public royaltyComputationContracts;

    struct TLS_data {
        uint tlsKey;
        bool isInitialized;
    }

    uint private count_increment = 0;
    struct TLS_message {
        uint id;
        uint order;
        string message;
    }

    // originator address. Should be a ds that holds multiple messages for the same address
    mapping (address => TLS_message) public tlsMessageHistory;

    function getRoyaltyComputationAddresses() public view returns(address[]) {
        return royaltyComputationContracts;
    }

    function newMessage(address entityAddress, uint messageId, string message) public returns(bool success) {
        // if(isEntity(entityAddress)) revert(); 
        tlsMessageHistory[entityAddress].id = messageId;
        tlsMessageHistory[entityAddress].order = count_increment;
        tlsMessageHistory[entityAddress].message = message;
        count_increment += 1;
        return true;
    }

    function establishTLSNConnection() public returns(bool success){
        return true;
    }

    function verifyMessage(address sender) public returns(bool coorect) {
        return true;
    }
}