// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import './TorrentFileInfo.sol';

/**
 * @see https://www.bittorrent.org/beps/bep_0003.html
 * It may not be possible (because of the gas limit 24kb per transaction) or cost effective to store the entire torrent file on the blockchain.
 * We can probably achieve slightly better space efficiency than the **bencoding** used by torrent files, but there can be an arbitrary number
 * of files. A torrent with many files will clearly exceed our limit. Ideas/Options:
 * 1. Could split the tracking nodes references and file meta into separate stores
 *   1. Could store them in separate contracts `mapping(trackingNodes -> fileMetaTransactionId)`
 *   2. Could store file meta only on-chain and store the tracking nodes as a dynamically updated set off-chain
 *     1. This might not be an issue since torrent clients need to validate peers anyway.
 * 2. Could store only a hash of the file meta, so that we can verify a mirror's integrity and trust
 *   1. The blockchain is no longer a souce of truth. We would always rely on at least one mirror to be online for absolute integrity
 * 3. Could split the file meta segments into difference transactions if the size becomes too large
 *   1. This seems like a costly proposition. We want torrent uploads to be driven by users which would be sensitive to cost, especially compared to free sites.
 * 4. Could store only the file segment hashes on-chain and keep the path/length info off chain
 *   1. We can impose a limit in the number of segments to ensure we'll never exceed a certain size. Most torrents should be below any reasonable limit anyway.
 *   2. Same issue as **2.1**, but with some additional protection against tampering and loss.
 * 5. Could combine elements of **1**, **3.1** and **4.1** by imposing limits that reduces the likely size, but still allow arbitrary size if someone really wanted to.
 * 
 * Some of these options run counter to the project's stated goals, so it might be a non-starter for any solution working well. We'll proceed with
 * attempting to reduce size as a POC for now.
 */

struct DhtNode {
    string host;
    uint16 port;
}

/**
 * Could just use DhtManagedFile format and map back to TrackerManagedFile and TrackersManagedFile on the client
 */
struct DhtManagedFile {
    DhtNode[] nodes;
    MultipleFileInfo info;
}

struct TrackerManagedFile {
    string announce;
    MultipleFileInfo info;
}

struct TrackersManagedFile {
    string[] announceList;
    MultipleFileInfo info;
}
