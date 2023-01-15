// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/**
 * @see https://www.bittorrent.org/beps/bep_0003.html
 * A SHA1 hash of the info is used as a key for torrent clients. This theoretically could lead to a conflict, so we'll need
 * to map to a bucket in the contract. We want to optimize for storage efficiency, so we can use any encoding and reconstruct
 * the .torrent file on the client.
 */

struct MultipleFileInfoEntry {
    /**
     * Can technically be arbitrary length, needs throught about space trade off and complexity (dynamic array must use address references and length indicators)
     * uint32 4GB
     * uint64 16EB
     */
    bytes length;
    // uint64 length;
    string path;
}

/**
 * Could just use MultipleFileInfo format and map back to SingleFileInfo on the client if there is one `files`. No support for
 * discriminating unions, so we'd need a `contract` to determine type. For simplicity and gas cost, it may be better to have one type
 */
struct MultipleFileInfo {
    MultipleFileInfoEntry[] files;
    string fromBlock;
    bytes pieceLength;
    // uint32 pieceLength;
    /**
     * SHA1 of piece = 160 bit
     */
    uint160[] pieces;
}

struct SingleFileInfo {
    bytes length;
    // uint64 length;
    string name;
}
