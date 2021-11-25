pragma solidity ^0.4.8;

import "./Aggregator.sol";

contract Verification {

    bytes32 pubKey;
    address public oracleAddress;
    string receivedData;
    uint receivedDataInt = 500;
    Aggregator agg;

    event SuccesfulDataCollection(string msg, uint value);
  
    // constructor (address _oracleAddress) public {
    //     oracleAddress = _oracleAddress;
    // }

    // event SuccesfulMessage(string msg);

    // function receiveMessage (string msg) public {
    //     require(msg.sender == oracleAddress);
    //     emit SuccesfulMessage(msg);
    // }
     
    function setAggregator(address _agg) public {
        agg = Aggregator(_agg);
    }

    function setData(string _data) public {
        receivedData = _data;
    } 

    function setDataInt(uint _data) public {
        receivedDataInt = _data;
        emit SuccesfulDataCollection("Succesfully retrieved data from Node.js server", receivedDataInt);
        agg.triggerRoyaltyComputation();
    }

    function getDataInt() public returns(uint) {
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

    // function submitProofOfPrice(bytes memory proof) public {
    //     // Check if proof is valid
    //     // Elliptic curve parameters for the TLS certificate
    //     uint256 qx = 0x0de2583dc1b70c4d17936f6ca4d2a07aa2aba06b76a97e60e62af286adc1cc09;
    //     uint256 qy = 0x68ba8822c94e79903406a002f4bc6a982d1b473f109debb2aa020c66f642144a;
    //     require(tlsnutils.verifyProof(proof, qx, qy));

    //     // Check HTTP Request
    //     bytes memory request = tlsnutils.getHTTPRequestURL(proof);
    //     // Check that the first part is correct 
    //     // require(request.toSlice().startsWith("/proxy.py?url=https%3A//index.bitcoin.com/api/v0/lookup%3Ftime%3D".toSlice()));
    //     // Check that the second part is not too long
    //     require(request.toSlice().find("%3D".toSlice()).len() == 13);

    //     // Check the host (kind of redundant due to signature check) 
    //     bytes memory host = tlsnutils.getHost(proof);
    //     // require(host.toSlice().equals("tls-n.org".toSlice()));

    //     // Get the body
    //     bytes memory body = tlsnutils.getHTTPBody(proof);

    //     uint32 timestamp0;
    //     uint32 price0;
    //     uint32 timestamp1;
    //     uint32 price1;
	// 	// Parse the timestamps
    //     // (timestamp0, price0, timestamp1, price1) = this.parseBitcoinComFeed(string(body));
	// 	// // Insert the timestamps
    //     // timestamp_to_price[timestamp0] = price0; 
    //     // timestamp_to_price[timestamp1] = price1; 
    // }
}