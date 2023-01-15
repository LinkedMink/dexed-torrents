// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "hardhat/console.sol";
import "./data-types/TorrentFileRating.sol";

contract TorrentFileRatingTokens {
    mapping(bytes32 => FileRating) public ratings;
    mapping(bytes32 => FileReview) public reviews;

    event FileRatingAdded(bytes32 fileId, FileRating rating);
    event FileReviewAdded(bytes32 fileId, FileReview rating);

    constructor() {}

    function addRating(bytes32 fileId, uint8 ratingValue) public {
        console.log(
            "%o - Add rating from user: %o, file=%o, rating=%o",
            block.timestamp,
            msg.sender,
            fileId,
            ratingValue
        );
                
        FileRating memory rating = FileRating({
            ratedBy: msg.sender,
            value: ratingValue
        });
        ratings[fileId] = rating;

        emit FileRatingAdded(fileId, rating);
    }

    function addReview(bytes32 fileId, uint8 ratingValue, string calldata reviewText) public {
        console.log(
            "%o - Add review from user: %o, file=%o, rating=%o",
            block.timestamp,
            msg.sender,
            fileId,
            ratingValue
        );

        addRating(fileId, ratingValue);

        FileReview memory review = FileReview({
            reviewedBy: msg.sender,
            text: reviewText
        });
        reviews[fileId] = review;

        emit FileReviewAdded(fileId, review);
    }
}
