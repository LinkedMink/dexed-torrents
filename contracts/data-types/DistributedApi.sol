// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

enum DistributedApiProtocol {
    Https
}

struct DistributedApiNode {
    string host;
    uint16 port;
    address owner;

    /**
     * Need an indicator for selecting fastest nodes (geolocation, known router distance, static regions, etc.)
     */
    uint16 ipRegionId;
}
