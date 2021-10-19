pragma solidity ^0.4.8;
import "./tls-n/tlsnutils.sol";
import "./tls-n/JsmnSolLib.sol";
import "./tls-n/bytesutils.sol";
import "./Aggregator.sol";

contract Verification {
    using bytesutils for *;

    bytes32 pubKey;
    address public oracleAddress;
    string receivedData;
    uint receivedDataInt;

    event SuccesfulDataCollection(string msg, uint value);
  
    // constructor (address _oracleAddress) public {
    //     oracleAddress = _oracleAddress;
    // }

    // event SuccesfulMessage(string msg);

    // function receiveMessage (string msg) public {
    //     require(msg.sender == oracleAddress);
    //     emit SuccesfulMessage(msg);
    // }
     
    function setData(string _data) public {
        receivedData = _data;
    } 

    function setDataInt(uint _data) public {
        receivedDataInt = _data;
        emit SuccesfulDataCollection("Succesfully retrieved data from Node.js server", receivedDataInt);
        address adr = 0x4BFF9AFcF839325C9e5bb3c505c7664C49406673;
        Aggregator a1 = Aggregator(adr);
        a1.areAllParamAvailable();
    }

    function detDataInt() public returns(uint) {
        return receivedDataInt;
    }

    function  PubKey(bytes32 initKey) public {
        pubKey = initKey;
    }

    function  getPubKey() public returns (bytes32) {
        return pubKey;
    }
    
    function getTestData() public returns (string) {
        return "Test data from VC";
    }

    function submitProofOfPrice(bytes memory proof) public {
        // Check if proof is valid
        // Elliptic curve parameters for the TLS certificate
        uint256 qx = 0x0de2583dc1b70c4d17936f6ca4d2a07aa2aba06b76a97e60e62af286adc1cc09;
        uint256 qy = 0x68ba8822c94e79903406a002f4bc6a982d1b473f109debb2aa020c66f642144a;
        require(tlsnutils.verifyProof(proof, qx, qy));

        // Check HTTP Request
        bytes memory request = tlsnutils.getHTTPRequestURL(proof);
        // Check that the first part is correct 
        // require(request.toSlice().startsWith("/proxy.py?url=https%3A//index.bitcoin.com/api/v0/lookup%3Ftime%3D".toSlice()));
        // Check that the second part is not too long
        require(request.toSlice().find("%3D".toSlice()).len() == 13);

        // Check the host (kind of redundant due to signature check) 
        bytes memory host = tlsnutils.getHost(proof);
        // require(host.toSlice().equals("tls-n.org".toSlice()));

        // Get the body
        bytes memory body = tlsnutils.getHTTPBody(proof);

        uint32 timestamp0;
        uint32 price0;
        uint32 timestamp1;
        uint32 price1;
		// Parse the timestamps
        // (timestamp0, price0, timestamp1, price1) = this.parseBitcoinComFeed(string(body));
		// // Insert the timestamps
        // timestamp_to_price[timestamp0] = price0; 
        // timestamp_to_price[timestamp1] = price1; 
    }
}