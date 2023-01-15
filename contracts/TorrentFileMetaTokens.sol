// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "hardhat/console.sol";
import "./data-types/TorrentFileInfo.sol";

contract TorrentFileMetaTokens {
    uint public batchSize;

    event FileMetaAdded();
    event FileMetaUpdated();

    constructor(uint _batchSize) {
        require(
            0 < _batchSize,
            "A batch must be greater than 0"
        );

        batchSize = _batchSize;

        console.log("Constructed contract at time: %o, batchSize=%0", block.timestamp, _batchSize);
    }

    function add() public {
        emit FileMetaAdded();
    }

    function update() public {
        emit FileMetaUpdated();
    }
}
