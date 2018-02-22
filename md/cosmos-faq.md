# FAQ
Frequently asked questions and answers about Cosmos.

[[toc]]

## Overview

### Who is the team developing Cosmos?

The Cosmos Network is the first project by the Interchain Foundation.
Its development is being led primarily by the [Tendermint](https://tendermint.com) team. Learn more [about the team](/about/team). For greater insight into current development, see the [Tendermint](https://github.com/tendermint/tendermint) and [Cosmos SDK](https://github.com/cosmos/cosmos-sdk) repositories on GitHub.

### What's the difference between Tendermint, the Cosmos Network, the Cosmos Hub, and Atoms?

* [Tendermint](https://tendermint.com): a general purpose blockchain engine that uses a Byzantine-fault tolerant consensus protocol and allows applications to be written in any programming language.
* The Cosmos Network: a heterogenous network of Proof-of-Stake blockchains that can interoperate with one-another.
* The Cosmos Hub: The first Proof-of-Stake blockchain to be launched by the Cosmos Network; it uses Tendermint consensus, contains a built in governance protocol, and serves as co-ordinater for interoperability between other blockchains.
* Atoms: The native cryptocurrency on the Cosmos Hub. Atoms are necessary for participating in the consensus protocol and transacting on the network.

### When will the Cosmos Network launch?

Please check <router-link to="/roadmap">our roadmap</router-link>. Atoms will not be tradeable until then.

## Atoms

### Why are Atoms necessary?

Public, decentralized networks require high levels of security and spam-prevention that are best achieved by economic means:
participants in the consensus must incur some economic cost, and all transactions processed by the network must pay a fee.
Since we want to use Proof-of-Stake validators insteaed of Proof-of-Work miners,
we require validators of the Cosmos Hub to make a large security deposit in Atoms - 
if they misbehave, their Atoms are revoked by the protocol! 
The more Atoms in security deposits, the more stake on the line; the more skin-in-the-game; the greater the economic security.
In this sense, the Atoms act like virtual miners.

To achieve spam-prevention, all transactions on the Cosmos Hub must pay a fee in Atoms. 
The fee may be proportional to the amount of computation required by the transaction, similar to Ethereum's concept of "gas".
The fees are collected by the validators and distributed proportionately to the Atoms held in security deposits.

### What is the initial distribution of Atoms?

As a public, decentralized network, the distribution of Atoms is decided by those who run the software for the Cosmos Hub.
To faciliate a decision, we are creating a Swiss non-profit, the Interchain Foundation,
which is responsible for co-ordinating fundraising and allocating funds to get the network off the ground.
The foundation will suggest a distribution of Atoms according to the results of the fundraiser.
Users will ultimately decide the distribution for themselves when they run the software.

The Interchain Foundation will suggest that 5% of the Atoms go to its initial donors, 10% go to the Interchain Foundation,
10% go to the company developing most of the software, and the remaining 75% to be distributed according to the results of the private and public fundraisers.

### When is the Fundraiser?

The Interchain Foundation has already raised some funds from private individuals, but is not accepting any more.
It has hosted a public fundraising event on April 6, 2017 from 6AM - 6:27AM PDT.
Both Ether and Bitcoin were accepted in the fundraiser.
The security of the fundraising process has been vetted extremely carefully.

### How do I get Atoms?

If you participated in the fundraiser, you can check your suggested atom balance at [fundraiser.cosmos.network](https://fundraiser.cosmos.network).
If not, you must wait until the <router-link to="/roadmap">Cosmos Network launches</router-link> and Atoms are traded on exchanges.

### Which exchanges will Atoms trade on?

We do not know yet. That is up to the individual exchanges. Exchanges are typically quick to respond to demand.

## Comparisons

### How is Cosmos different than Blockstream's Sidechains?

Cosmos and Blockstream's Sidechains use the same technology to enable cross-chain interoperability,
namely, two chains can securely transfer data between themselves if each maintains a light-client for the other.
In Bitcoin, the light-client is called "Simple Payment Verification";
it requires all the headers to be synced and is limitted in expressive power only to asserting that transactions happened 
(rather than asserting to the current state).

In Cosmos, the design inherits the many benefits of Proof-of-Stake:
superior speed, no need to download all the block headers, 1-block finality, 
security via collateral, ability to make assertions about the current state.  So it's much more efficient. 
But it also generalizes the Sidechains model to allow routing from one chain to another via a more central hub,
ie. a hub-and-spoke design. The Cosmos Hub will be the first such hub; as a multiasset blockchain,
it will enable easy interoperability across many different kinds of cryptocurrency systems.

### How is this different than Atomic Cross-Chain Transactions (Atomic Swaps)?

The building block of the Cosmos Network, the InterBlockchain Communication (IBC) protocol, 
is less like an atomic swap of two currencies and more like an assymetric/one-directional transfer of a token
from one blockchain to another. 
An atomic swap involves a game played between two particular users of two different cryptocurrencies,
where the intention is to trade the tokens directly, as an atomic action.
To do so, they both must be online to craft and broadcast transactions together.
While this eliminates the need for building light-client logic of one blockchain into another blockchain, 
it requires liquid markets to match orders if you want to get your tokens to another blockchain.

In contrast, Cosmos allows tokens to be locked up in a source blockchain, in an account controlled by a destination blockchain,
such that proofs can be generated and relayed by anyone to the destination chain (ie. using IBC)
to enable the tokens to be reclaimed there.
The transfer of tokens is not via any bidirectional or bilateral exchange mechanism, or even
through a peg.  It's as if the token moved from one zone to another.  The trick
is that there is a common crypto "depository" -- the Cosmos Hub.


### How is this different than Ethereum?

Ethereum is a general purpose virtual machine (the EVM) on a single blockchain.
It currently uses Proof-of-Work.
The research and development team plans to transition to a Proof-of-Stake protocol known as Casper,
and to eventually use the properties of that protocol to facilitate splitting up the state across many blockchains, or "shards".
In general, it is assumed that all shards are running the same virtual machine (ie. the EVM).

In contrast, the Cosmos Hub enables interoperability between many different types of blockchains,
even with entirely different virtual machines or none at all (like Bitcoin).
This works because the Cosmos Hub is simply about preserving
the total number of tokens across zones/shards, whereas Ethereum's solution
is about sharding the general Ethereum state machine state.  

In any case, the Cosmos design is much simpler than the Ethereum scalability design,
both because of a simpler consensus algorithm (ie. Tendermint vs. Casper), and because of a simpler interoperability protocol
(rather than a complex scalability protocol). Of course, this comes at a cost:
Tendermint blockchains can halt if 1/3+ validators are down, and the heterogenous interoperability pushes 
complexity from the protocol to the users and applications. 

That said, Cosmos can serve as a first-order scaling solution for Ethereum. It will support the EVM in one or many zones,
and will have a zone that is pegged to the Ethereum network. This will enable real ether and EVM contracts to be used on the Cosmos network,
providing both vertical and horizontal scalability to the Ethereum ecosystem.

### How is this different than Interledger?

Interledger is an extension of the Atomic Swap and related ideas to condition transactions on the approval of a group of notaries.
While notaries are somewhat similar to validators in Cosmos, they only facilitate information transfers,
and are not actually responsible for holding authoritative state. 
Furthermore, Interledger suffers from the same drawbacks as Atomic Swaps, in terms of the need for liquid markets and end users being on-line.
That said, we may be able to use pieces of the Interledger protocol within IBC, though it may also 
serve as an alternative or competing means for two blockchains to communicate with one another,

## Scalability

### What is sharding?

Sharding is about dividing the workload up into pieces for the purpose of
horizontal scaling.  There are many ways to handle sharding in SQL databases,
but sharding for blockchains is an emerging field.  The closest thing we have
are the altcoins ecosystem, but this isn't very good because all the altcoins
are their own silos with no good way to interoperate except via centralized
exchanges, or tricks like hashlocked transactions (like the Lightning Network),
which have their own benefits and drawbacks.

### How does Cosmos do sharding?

Cosmos implements sharding using zones. It's a sharding solution that preserves
the sovereignty of the shard as a self-governing and self-validating system.
The Cosmos Hub doesn't care about the internal state of an Cosmos zone --
rather, all that matters to the Cosmos Hub is what the zone explicitly
communicates to the Cosmos Hub via IBC packets.

### Why are shards called zones?

Shards are called zones in Cosmos because they really are like sovereign
economic zones.  We've seen a taste of blockchain governance with the Ethereum
hard-fork following TheDAO hack.  In Cosmos, all zones are sovereign and can
construct their own governance policies, and yet they can all interoperate on
the Cosmos Hub.  That's the benefit of the IBC abstraction, that it's about
accountable and cryptographicaly verifiable communication.


### What's an IBC packet?

IBC packets are packets of data that one blockchain wishes to send to another
blockchain.  But instead of literally sending a packet of bytes via the TCP/IP
or UDP/IP protocol (which is designed for singular, physical, machines), IBC
packets require cryptographic proof-of-existence.  Since no single node or
validator has the authority to speak on behalf of the entire blockchain, and,
since we don't want to rely on the integrity of the IP internet infrastructure,
instead we rely on a cryptographic proof of a blockchain hash commit (+2/3 of
signatures for that blockchain hash) along with a Merkle-proof from the
aforementioned blockhash to a packet in the blockchain's "application state",
which proves that the blockchain validators agreed to publish this packet of
information.  So, anyone who sees an IBC packet (regardless of the source of
this data) can verify its integrity.

## Interoperability

### How does one exchange currencies in this system?

For tokens outside the Cosmos system, they can only be introduced via pegged
derivatives (akin to what Blockstream's sidechains paper was suggesting). 
In theory, you could also use other means to track the value of some token inside
the Cosmos network by involving prediction markets or betting, but those are much more complex constructions,
and can be supported by other zones anyway.


In the Cosmos Hub, pegs will be tied to a specific zone; that is, a zone and its
validator sets are expected to also be involved in a m-of-n contract on the
target chain, like Bitcoin or Ethereum.

``` 
           _ peg smart contract
          /
  [  Ethereum  ] <--> [ EtherCosmos Peg Zone ] <-IBC-> [  Cosmos Hub  ] <-IBC-> (Bitcoin) [ PoW/Casper ]
                      [      Tendermint      ]         [  Tendermint  ] <-IBC-> (exchange)
```

Once the tokens are in the hub, its much easier to exchange currencies.  You
trade with another account directly in the Cosmos Hub (a Send transaction with
two inputs and two outputs, with 2 different assets, swapped).  But this
requires both parties to the trade to be online.  Instead, you can send your
tokens to an exchange zone, to take advantage of an order-book.

### So can I trade BTC for ETH using Cosmos?

You can, if you trust the respective Ethereum and Bitcoin peg zones.  If
alternatives of Ethereum and Bitcoin (ie. same codebase, different network)
launch on Cosmos, you can trade those directly.

### Does Cosmos involve escrow?

Not really, though the hub may be thought of as an escrow agent mediating
between two zones, but that's of course the point.  However, the pegs in
peg-zones may well utilize escrow to allow, for instance, BTC to move into a
zone.

### How does one switch blockchains in this system?

The zone is responsible for committing an IBC packet with outbound coins for
another zone.  Zones can do whatever they want, so it's really up to the logic
of the zone, as well as the client.  Ideally there will be a standard
specification for constructing a transaction to move funds from one zone to
another.  So an EVM zone should be implemented such that it can process this
universal transaction format that lets any simple user account send funds to
another zone via the Cosmos Hub (or any other hub).  This may be something to be
defined as an IETF or W3C specification, but it's a bit too early for that, so
we should forge ahead and document the spec for everyone to see.

There should be some specification for defining:
 - the destination zone
 - the intermediary zones (typically the Cosmos Hub)
 - the assets and quantity
 - the destination account or smart contract
 - any other information

These are specified [here](
https://github.com/cosmos/cosmos/blob/master/WHITEPAPER.md#ibcpackettx).

There will also be way to navigate these zones, whereby nodes or validators of a
zone can publish their IP endpoints or whatnot, voluntarily.  So zone discovery
is a thing, but mostly it's up to the end-client software to understand this
plumbing.  End-users shouldn't know all of the details except a few rules for
safety, like "don't send money to zones you don't know".

### Will there be multiple hubs?

Yes. The Cosmos Hub is the first hub, but there can and should be more.
They will all have different features and characteristics.
For instance changes in speed by altering the number of validators - 
there could be a much slower, but more distributed "slow hub", and a much faster but less decentralized "high-frequency hubs".
There may also be hubs with different native virtual machine capacities and transaction types.
There could also be hubs validated by members of the banking system.
And so on.

## Consensus

### Is consensus configurable?  

Cosmos can accomodate other PoS consensus mechanisms as long as they have a very
clean and concise light-client verification protocol.  One promising protocol is HoneyBadgerBFT.
Tendermint itself can also be upgraded to support additional features.  
It will be up to the Cosmos Network Foundation and the Cosmos governance to decide whether to support them.  
It isn't necessary if there can be adapter zones.  That's what a Bitcoin peg zone is -- an adapter
zone to sit between PoW and Tendermint.

### Can you give some details about what you took (derived) from the DLS consensus algorithm?

The locking mechanism was something that I hadn't seen in other papers, like
PBFT.  There's an equivalence to PBFT's system, but the locking and unlocking
mechanics in PBFT happen implicitly.

Increasing the length of time of a round to circumvent partial-synchrony is
something that the early versions of Tendermint Consensus used.  In the current
version of Tendermint Consensus, which is more asynchronous, this "time delay"
is limited to the timeout period after a 2/3 quorum of any votes for the same
height &amp; round.

The 2/3 quorum of any votes to synchronize validators, a kind of virtual clock
cycle, was also inspired by DLS's paper in the later sections (after section 5).

### Why is Cosmos's governance better than any other options out there?

One is, the stakeholders are well defined, as is the prior social contract.  
Ethereum had a hard time with the fork because they had to ask the ether holders as well
as the miners, but the ether holders had no prior social contract or obligation
to partake in governance, so no quorum could be reached in time.  Asking the
miners is necessary to ensure that the hard-fork will have support, but after a
while they tend to simply follow the money and incentives.

Cosmos is different because instead of anonymous miners we have social contract
bound validators and delegators who have stake, and, they have the obligation to
partake in governance.

## Validators

### What is the maximum number of validators in Cosmos?  What about nodes?

We will start with 100 validators. Anyone else can be a node. 
To start, the validators will be the same across all shards - they will run the shards concurrently.
Over time, these restrictions will be loosened.
Misbehaviour in the consensus on any shard will result in security deposits being revoked.

### What will be the process for abandoning validators that misbehave?

If a validator misbehaves on its own by double-signing at the same height &amp;
round, then the evidence is very short and simple -- it's just the two
conflicting votes.  This evidence can be included in the the CosmosHub as a
Slash transaction, and the validator will immediately become inactive and
slashed after the Slash transaction gets committed.

If there is a zone fork, either of the Cosmos Hub or any of the zones, the two
conflicting commits also constitute evidence.  This is a much more complicated
data structure.  It is guaranteed to slash at least 1/3 of the validators' atoms
for that zone.

### What's the difference between a Delegator and a Validator?

A validator has an active key involved in signing votes in the consensus protocol.
A validator must also have some Atoms in a security deposit.
Since there will only be a limitted number of validators,
other Atom holders can delegate to the validators,
thereby contributing to the economic security of the system by putting their funds on the line if the validator misbehaves.
In return, they earn a share of the transaction fees and any inflationary rewards.

### Can delegators also be validators?  

Delegators are never validators.  If a validator wishes to delegate, 
they need to do so with their free and unbonded Atoms.

### How are validator voting powers determined and changed?

Validators are initially determiend according to a public vote among Atom holders to be carried out before the launch of the Cosmos Hub.
Atom holders delegate to the various candidates, and the top 100 candidates will be the initial validators.
Once the Hub launches, the vote will be a continuous process where users shuffle around their delegated Atoms, 
thereby changing the validator set.

Part of the purpose of the fundraiser is to distribute Atoms across a wide variety of individuals and organizations
so that the validator set will be sufficiently decentralized for a robust network. In the event of attacks or mishaps,
the blockchain may need to purge bad actors through socially co-ordinated hard-forks.
The ability to account for misbehaviour and co-ordinate hardforks helps make the system antifragile.

## Use Cases

Cosmos allows everyone to benefit from the network effect of various
interoperable tokens and zones.  For example, if anyone creates a peg zone or a
new token type, all the other zones can use them if they support the new token
type.

So, the Cosmos Hub has a particular use-case that isn't filled by anything
today.  The best use-case for Cosmos Zones are for any token-based blockchain
that benefit from the new interoperability, speed, and scalability properties.
It may be a kind of distributed exchange.
