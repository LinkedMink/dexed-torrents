// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "hardhat/console.sol";
import "./data-types/DistributedApi.sol";
import "./interfaces/IDistributedApi.sol";

contract ProprietaryDistributedApi is IDistributedApi {
    string public appName;
    DistributedApiProtocol public protocol;
    address payable public owner;

    DistributedApiNode[] public nodes;

    constructor(string memory _appName, DistributedApiProtocol _protocol) payable {
        require(
            32 <= bytes(_appName).length,
            "An appName should be less than 16 characters"
        );

        appName = _appName;
        protocol = _protocol;
        owner = payable(msg.sender);

        console.log(
            "%o - Constructed DistributedApi contract for app: %o, %o",
            block.timestamp,
            _appName,
            _protocol
        );
    }

    function addNode(DistributedApiNode calldata node) public {
        require(
            msg.sender == owner,
            "Only the owner can modify ProprietaryDistributedApi nodes"
        );

        emit NodeAdded();
    }

    function deleteNode(DistributedApiNode calldata node) public {
        require(
            msg.sender == owner,
            "Only the owner can modify ProprietaryDistributedApi nodes"
        );

        emit NodeDeleted();
    }
}
