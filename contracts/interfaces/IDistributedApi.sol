// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "../data-types/DistributedApi.sol";

interface IDistributedApi {
    event NodeAdded(DistributedApiNode node);
    event NodeDeleted(DistributedApiNode node);

    function addNode(DistributedApiNode calldata node) external;
    function deleteNode(DistributedApiNode calldata node) external;
}
