# DExed Torrents

[![Build Status](https://github.com/LinkedMink/dexed-torrents/actions/workflows/build-main.yml/badge.svg)](https://github.com/LinkedMink/dexed-torrents/actions?query=workflow%3A%22build-main%22)

A DApp that uses the Ethereum blockchain as a distributed database for universally auditable and accessible torrents

## Goals / Ideas

- Have one place to look for torrent files vs. multiple indexing web applications
  - Torrent files will never disappear
  - Trackers can be expanded beyond the original set and consolidate for a unique set of file segment hashes
- Be quickly searchable with support for categorization, keywords, and relevance (quality, popularity, etc.)
  - Have index mirrors that can be trusted by only indexing references and ultimately storing file hashes (and source of truth meta data) on the blockchain. Mirrors can also be compared with each other.
  - Allow reviewing torrent files and aggregating file rating with minimal tampering (gas serving as a disincentive)
- Have relatively low cost of operation on the blockchain (gas, don't care about mirror cost)
  - Balance off-chain and on-chain storage?
  - Batch entries in a block?
  - Hash entries of off-chain storage on-chain instead of storing the whole record?
- Operations
  - Index Mirror Data: Create/Delete mirror addresses by consensus
  - Torrent File Data:
    - Create Torrent File Meta
    - Update Trackers
  - Torrent Rating Data:
    - Create/Update Reviews
    - Create/Update Ratings (Numeric)
    - Attempt to restrict to one per user. We could enforce a unique public key, but obviously this can be bypassed. Gas is a disincentive.
  - Index Mirror Management:
    - DAO?
      - Could try to enforce mirror integrity by requiring staking to be added to the mirror list. We could periodically compare the mirror's state and have a consensus model for forcing removal and revoking stake.
      - Need a way a to incentivize being a mirror
        - Ad Revenue Sharing? Would also need contracts to negotiate with advertisers and manage that data
    - For now we could start with a centralized reference API and have a static token for the mirror addresses, so that we can have distributed mirrors in the future while significantly reducing the complexity of trying to build and manage a DAO.
    - Ops: Index torrent files, ratings, aggregate ratings stats, get/aggregate seed/downloader stats

## WIP

I primarily intended this project to help me learn about developing secure and performant DApps with a relatively simple indexing problem. It may be subject to change at anytime.
