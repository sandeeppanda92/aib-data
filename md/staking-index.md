# Staking - Index

## Cosmos 

Cosmos is not a blockchain, it is a network of blockchains. In this network, blockchains can exchange value (tokens) with each other.

There are two types of blockchains in the Cosmos ecosystem: Hubs and Zones. Zones are sovereign blockchains--public or private--built on top of [Tendermint](https://tendermint.com). They can exchange value between each other by transacting through Hubs, which act as coordinators to limit overhead. In other words, Hubs are blockchains that connect independent Zones together. They help isolate Zone failures so that global token invariance is preserved. If a Zone wants to send tokens to any other Zone in the Cosmos ecosystem, a single connection with a shared Hub is required. 

## Cosmos Hub

Cosmos is a permissionless system, meaning anybody can launch a Hub or Zone in it. The first Hub in the Cosmos network is the Cosmos Hub. Any Zone can connect to the Cosmos Hub to send tokens to any other Zone that is connected to it. For each transfer, a transaction fee has to be paid by the sender to the Hub's [validators](/staking/validators) and [delegators](/staking/delegators). The Hub maintains a whitelist of tokens that are accepted to pay transaction fees (initially, this list will include Atoms and [Photons](https://blog.cosmos.network/cosmos-fee-token-introducing-the-photon-8a62b2f51aa). This list can be modified through governance.

The following sections will give an overview on the staking and governance process of the Cosmos Hub.

## Proof-of-Stake

Blockchain networks are secured by a set of validators, who are responsible for committing new blocks in the blockchain. In Proof-Of-Work systems such as Bitcoin, validators are called miners, and the probability of a given miner to produce the next block is proportional to its computing power. In contrast, the Cosmos Hub is a public Proof-of-Stake blockchain. Proof-of-Stake is a category of consensus algorithm that relies on validators' economic stake in the network. 

## Atoms

In the case of the Cosmos Hub, the frequency at which a validator is selected to produce the next block is proportional to the number of Atoms locked up (i.e. bonded, or staked).

These Atoms can be locked up by validators themselves, or delegated to them by Atom holders that do not want or cannot run validator operations, called delegators. The sum of a validator's self-bonded and delegated Atoms is called its stake. The Atom is the only staking token of the Cosmos Hub. In return for locking up their Atoms, delegators earn block provisions (in Atoms), block rewards (in Photons) and transaction fees (in whitelisted fee tokens). When a bonded Atom holder wants to retrieve its deposit, it must wait for a 3 week unbonding period.

## Photons

Atoms are designed to be bonded on the Hub. This means that they are not ideal to pay fees or to move on other Zones of the Cosmos Ecosystem. This is why [Photons](https://blog.cosmos.network/cosmos-fee-token-introducing-the-photon-8a62b2f51aa) will be introduced. Photon is a fee token with much greater liquidity and velocity than Atom. It is the second whitelisted fee token on the Hub after Atom and can move on all the Zones that are connected to the Hub. 

## Hard spoon

A hard spoon occurs when a new cryptocurrency is minted by replicating the account balances of an existing cryptocurrency. In our case, we are [hard spooning Ethereum](https://blog.cosmos.network/introducing-the-hard-spoon-4a9288d3f0df<Paste>) by taking the account balances of existing Ethereum holders and mirroring those values. This means that ETH holders will have their coins replicated in this EVM zone and will be redeemable as fee tokens--Photons--within [Ethermint](https://ethermint.zone).

After launch, Atom holders will be able to vote on the hard spoon, specifically:

* Whether the hard spoon should happen or not
* When the snapshot will occur
* How Photons are distributed (what goes to Ethereum holders, what goes to Atom holders and Photon inflation)

## Validators

Validators of the Cosmos Hub are responsible for creating new blocks of transactions that are added to the blockchain. Running a validator is non-trivial. It requires technical knowledge and hardware investment. Additionally, due to the way that Tendermint—the underlying consensus engine on which the Cosmos Hub is built—works, the number of validators must be limited. Initially, this limit is fixed to 100. This means that only the top 100 addresses with the most stake that declared their intention to become validator will be validators. As a result, most Atom holders will not be validators. Instead, they will become delegators, thereby participating in deciding who among the validator candidates actually become validators.

If you are interested in becoming a validator or just want to learn more about validators, [visit this page](/staking/validators).


## Delegators

If you are interested in staking your atoms to a Validator to earn revenue, or just want to learn more about delegators, [go to this page](/staking/delegators).
