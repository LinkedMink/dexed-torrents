// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

struct FileRating {
    address ratedBy;
    uint8 value;
}

struct FileReview {
    address reviewedBy;
    string text;
    /**
     * Would appear in same block for a single transaction?
     */
    bytes32 ratingTransactionId;
}
