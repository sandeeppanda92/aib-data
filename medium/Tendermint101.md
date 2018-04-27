Suggested Titles:
- Tendermint for Dummies: Bringing BFT to the Public Blockchain Domain

# Intro

It can be information overload for the newly initiated to get a crash course about Tendermint, the Cosmos Network, and where the two intersect. Semantically, Tendermint Core, the piece of software, is used synonymously with Tendermint, the organization that's implementing Tendermint Core and the Cosmos Network software stack. Technically, Tendermint Core is a low-level protocol which is actually composed of two protocols in one: a consensus algorithm and a peer-to-peer networking protocol. Before Tendermint was introduced in 2014, this construct of merging consensus with networking was a completely novel idea. Jae Kwon and Ethan Buchman, inspired by the design goal behind Raft, introduced Tendermint to the world as an easy to understand algorithm that addressed a number of hard distributed systems problems which hadn't been addressed before. The new generation of BFT-based Proof-of-Stake (PoS) consensus algorithms such as Casper CBC (Correct by Construction), Ouroboros, Tezos, HoneyBadger, etc., draw from Tendermint's adaptation of BFT (Byzantine Fault Tolerant) research to the blockchain paradigm. This adaption is what we call Tendermint BFT.

# Consensus Algorithm

Tendermint shares commonality with Bitcoin inasmuch as the two protocols use a blockchain, and they each provide their unique approaches to solving the Byzantine General's Problem. Their similarities end there, however. To be precise, the lineage of the Tendermint protocol can be traced back to a rich body of research stemming from Byzantine Fault Tolerance literature out of the world of distributed computing. Whereas the Bitcoin protocol optimizes for decentralization, trustlessness, permissionlessness and censorship-resistance, Tendermint optimizes for BFT in a wide area network, i.e. thousands of nodes, setting. This distinction is nuanced and merits deeper investigation. The innovation behind Tendermint was in adapting BFT research to the blockchain paradigm with Proof-of-Stake, rather than Proof-of-Work, as the security mechanism.

__flp impossibility__

__model__

## Liveness, Agreement, Voting Power
__determinism__
__termination__

## Partial Synchrony

## Leader Election
[Proposer selection procedure in Tendermint](https://github.com/tendermint/tendermint/blob/master/docs/specification/new-spec/reactors/consensus/proposer-selection.md)

# P2P Networking Protocol

## Decentralization
__sentry node architecture__
