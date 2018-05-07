Suggested Titles:

- Tendermint for Dummies: Bringing BFT to the Public Blockchain Domain

# Intro

For definitions, see
[Primer](https://blog.cosmos.network/understanding-the-basics-of-a-proof-of-stake-security-model-de3b3e160710).

For the technical specification of Tendermint, see
[Readthedocs](http://tendermint.readthedocs.io/projects/tools/en/master/)

Read the original [Tendermint
whitepaper](https://tendermint.com/static/docs/tendermint.pdf).

It can feel like information overload for the newly initiated getting a crash
course about Tendermint, the Cosmos Network, and where the two intersect. We've
written about the [Cosmos/Tendermint
stack](https://blog.cosmos.network/understanding-the-value-proposition-of-cosmos-ecaef63350d)
at a high level but in this post, we'll dive a bit deeper into Tendermint's
consensus and networking layers, still at a relatively high level.

But first things first: semantics. Tendermint Core, the piece of software, is
used synonymously with Tendermint, the organization that's implementing
Tendermint Core and the Cosmos Network software stack. Technically, Tendermint
Core is a low-level protocol which is actually composed of two protocols in one:
a consensus algorithm and a peer-to-peer networking protocol. Before Tendermint
was introduced in 2014, this construct of merging consensus with networking was
a completely novel idea. Jae Kwon and Ethan Buchman, inspired by the design goal
behind Raft and PBFT, introduced Tendermint to the world as an easy to
understand algorithm that addressed a number of hard distributed systems
problems which hadn't been addressed before.

The new generation of Proof-of-Stake (PoS) consensus algorithms such as Casper
CBC (Correct by Construction), Ouroboros, Tezos, HoneyBadger, etc., draw from
Tendermint's BFT adaptation to the public blockchain domain and each incorporate
elements of this construct in their respective protocols. This adaption of BFT
research into the public blockchain domain is what we refer to as Tendermint
BFT, and is more generally categorized as BFT-based Proof-of-Stake (as opposed
to chain-based Proof-of-Stake). For a crash course of chain-based versus
BFT-based PoS, see: [Casper vs.
Tendermint](https://blog.cosmos.network/consensus-compare-casper-vs-tendermint-6df154ad56ae).

Now that that's out of the way, let's bite into the meat of the introduction:
What is Tendermint and how does it work at a high level?

# Tendermint BFT

Bitcoin is the intellectual ancestor of all blockchain-based cryptographic
systems that we know and love today. The Tendermint protocol shares commonality
with Bitcoin inasmuch as the two protocols record everything on a blockchain,
yet they each provide their unique solutions to the Byzantine General's Problem,
also referred to as the consensus, or "agreement", problem. More precisely,
Tendermint's lineage is closely traced back to the world of distributed
computing and Byzantine Fault Tolerance literature in academia. Whereas the
Bitcoin protocol is the rise above the ashes of the many failed attempts of
electronic cash systems--with the exception of PayPal--that preceded it.

Bitcoin optimizes for censorship-resistance, critically, due to its primary
function as a decentralized payment system. Tendermint optimizes for general
Byzantine fault-tolerant  distributed applications and data processing amidst a
wide area network (WAN), e.g. hundreds of nodes (high node count). This
distinction is nuanced and merits deeper investigation.

In the academic world of BFT, before there was Tendermint, people assumed a
local area network (LAN) setup of just a handful of nodes--4 to 7 of them at
maximum. Before Bitcoin introduced the blockchain paradigm to the world, no one
had ever proposed BFT solutions beyond the single administrative domain, i.e.
centralized entities. There was little to no work done on BFT research for a
wide area network setup before the introduction of Bitcoin using Proof-of-Work.
Then Jae Kwon figured out how to scale BFT-based protocols to the tune of
hundreds of nodes among disparate administrative domains (i.e. decentralized,
untrusted entities) using Proof-of-Stake when [he introduced Tendermint in
2014](https://tendermint.com/static/docs/tendermint.pdf). Consequently, this
system model for a large number of validating nodes in a WAN is significantly
more complex to engineer than it is for a small number of nodes.

The goal was to address a problem that was significantly harder to solve and do
it with an algorithmic complexity that was even simpler to understand. That was
Tendermint. The breakthrough was that one could adapt classical BFT algorithms
and apply them to the permissionless public blockchain setting, relying on
Proof-of-Stake, rather than Proof-of-Work, as the underlying security mechanism.

## The Model

Tendermint is modeled as a deterministic protocol, live under partial synchrony,
which achieves throughput within the bounds of the latency of the network and
individual processes themselves. That's quite the mouthful. Lets break it down
into digestible chunks.

[__FLP
Impossibility__](https://groups.csail.mit.edu/tds/papers/Lynch/jacm85.pdf)

Theorem: "...we show the surprising result that no completely asynchronous
consensus protocol can tolerate even a single unannounced process death." As in,
consensus cannot be solved in purely asynchronous networks with a deterministic
protocol if at least a single process can fail.

Defined by Dwork, Lynch, and Stockmeyer in their paper, [_Consensus in the
Presence of Partial
Synchrony_](https://groups.csail.mit.edu/tds/papers/Lynch/jacm88.pdf): "Partial
synchrony lies between the cases of a synchronous system and an asynchronous
system. In a synchronous system, there is a known fixed upper bound...on the
time required for a message to be sent from one processor to another and a known
fixed upper bound...on the relative speeds of different processors. In an
asynchronous system no fixed upper bounds...exist....The problem is to design
protocols that work correctly in the partially synchronous system regardless of
the actual values of the bounds...." It was in attempting to solve this problem
that Tendermint was born. [Tendermint is thus a modified
version](https://tendermint.com/static/docs/tendermint.pdf) of this
aforementioned [DLS
protocol](https://groups.csail.mit.edu/tds/papers/Lynch/jacm88.pdf).

## Consensus Algorithm

__Partially Synchronous, Synchronous, and Asynchronous Communication__

Let's explore the synchronous case, using a well-known protocol for reference:
the Bitcoin protocol. In Bitcoin, there is a "known fixed upper bound". This is
referring to the 10 minute block time. In order for the Bitcoin network to move
forward with creating blocks, the protocol artificially imposes a timing
assumption, giving the entire network of nodes 10 whole minutes to listen for,
collect, validate, and gossip transactions propagating across its peer network.

Ethereum is another example of a protocol that makes synchrony assumptions with
block times averaging 15 seconds. While 15 seconds is much faster than 10
minutes--giving the Ethereum network the benefit of higher throughput--this
comes at the expense of its miners, as this results in more orphaned blocks;
there is less time for transactions to propagate through its network.

Tendermint belongs to a class of protocols which solve consensus under partially
synchronous communication, wherein, a partially synchronous system model
alternates between periods of synchrony and asynchrony; we call this assumption
"weakly synchronous". What this means is, Tendermint doesn't rely on timing
assumptions in order to make progress. In other words, there is no artificially
imposed "fixed upper bound" of time in order for blocks to be created. The
instances when the protocol relies on timeouts are when processes get stuck and
need to be terminated in order to preserve liveness properties. Hence why
Tendermint is a solution to the agreement problem in the partially synchronous
setting.

__Liveness & Termination__

Defined: "The termination property is just that each correct processor should
eventually make a decision."

Those algorithms that of Nakamoto consensus, Peercoin, NXT, Snow White,
Ouroboros, etc., in the synchronous system model, rely on synchrony assumptions
not just for process termination but for safety. Those algorithms designed for
synchronous systems always have fixed bounds which are known and always hold.
And in the event that the synchrony bounds do not hold, consensus is broken, and
the chain will fork. Therefore, Bitcoin's 10 minute block time, for example, is
duly conservative, as to preserve safety. As a result, you get probabilistic
guarantees of finality, or "high-latency finality", from these
liveness-preserving synchronous protocols.

By way of contrast, Tendermint never forks in the presence of asynchrony if less
than 1/3 of processes are faulty. This property is what makes Tendermint a
purely BFT-based protocol, in which it strictly prefers safety over liveness. As
a result, a Tendermint blockchain will halt momentarily until a supermajority,
i.e. more than 2/3, of the validator set comes to consensus.

Now, there _are_ consensus protocols that work in purely asynchronous networks,
but, adhering to the FLP Impossibility Theorem, they cannot simultaneously be
deterministic.

__Deterministic vs. Nondeterministic Protocols__

Nondeterministic protocols which solve consensus under the purely asynchronous
case potentially rely on random oracles and generally incur high message
complexity overhead, as they depend on reliable broadcasting for all
communication. In the asynchronous environment, the overhead cost of a single
reliable broadcast is about equivalent to [one `round` of
Tendermint](http://tendermint.readthedocs.io/projects/tools/en/master/introduction.html#consensus-overview).
Protocols like HoneyBadger BFT fall into this class of nondeterministic
protocols under asynchrony. Normally, they require three instances of reliable
broadcast for a single round of communication.

Tendermint instead is a totally deterministic protocol--as in, there is no
randomness present in the protocol whatsoever. Leaders are elected
deterministically, through a defined mathematical function in the
implementation. As such, we are able to mathematically prove that the system is
live and that the protocol will make decisions.

[__Rotating Leader Election__][proposer-selection]

Tendermint rotates through the validator set, i.e. block proposers, in a
weighted round-robin fashion. The more stake, i.e. voting power, that a
validator has delegated to them, the more weight that they have, and the
proportionally more times they will be elected as leaders. To illustrate, if one
validator has the same amount of voting power as another validator, they will
both be elected by the protocol an equal amount of times.

The simplified explanation of how the algorithm works looks like this:

`Validator weight is established -> Validator is elected, their turn to propose
a block -> Weight is recalculated, decreases some amount after round is complete ->
As  each round progresses, weight increases incrementally in proportion to
voting power -> Validator is elected again after k rounds`

Because [the protocol selects block proposers
deterministically][proposer-selection], given that you know the validator set
and each validator's voting power, you could compute exactly who the next block
proposers will be in rounds `x`, `x + 1`,...,`x + n`. Because of this, critics
argue that Tendermint isn't decentralized enough. When you can know predictably
who the leaders will be, an attacker could target those leaders and launch a
DDoS attack against them and potentially halt the chain from progressing. We
mitigate this attack vector by implementing something called [Sentry
Architecture][Sentry Node] in Tendermint.

## P2P Networking Protocol

[__Sentry Node Architecture__][sentry-node]

![Tendermint stack]()

A properly set up validator will never expose the IP address of or accept
incoming connections to their validator node. A correctly set up, well-defended
validator will actively spawn sentry nodes, which act as proxies to the network,
to obfuscate the real location of their validator node. IP addresses on the p2p
layer are never exposed.

That said, taking advantage of Sentry Node Architecture is opt-in; the onus is
on the validator to maintain a fault-tolerant full node. This is where we make
extra-protocol assumptions based on cryptoeconomic incentives. The assumption
is, a validator will want to take all precautionary measures so as to maintain
fault-tolerance, remain available, and ultimately play their part in keeping the
network live. Because if they don't, they get slashed by the protocol for being
offline for over a certain amount of time.

[__Peer Exchange (PEX) Reactor__][pex]

Tendermint borrows from Bitcoin's peer discovery protocol. More specifically,
Tendermint adopts the p2p AddressBook from [btcd][btcd], the Bitcoin alternative
implementation in Go.

// Need help providing more context about how the PEX works The PEX enables
// dynamic peer discovery on the networking layer by default. Peers can be
// gossiped on the p2p layer.

# Ongoing research--Tendermint Labs

Currently, we are delving into BLS signature research which could potentially
lead to a reduction in the size of Tendermint block headers from 3.2 KB (with
~100 validators) to 64 bytes.

# Tendermint in Practice

After all is said and done, beyond the fancy algorithmic design and academic
jargon, what is Tendermint actually useful for?

Bad news is, everyday people won't find Tendermint useful. Good news is,
application developers can bridge the gap between protocol and end-user.
Tendermint is designed to be customizable and flexible enough to fit any
setting, be it public or enterprise, where a consensus protocol is desired.

Tendermint is ideal for a developer who wants to implement an application on top
of its own blockchain. It comes pre-assembled, so if the developer chooses to go
for a pure Proof-of-Stake, BFT-based consensus engine to power their
[dAppzone][dappzone], they can easily do so.

# Additional Resources

Read the Interview with Zarko:
[here](https://github.com/tendermint/aib-data/blob/develop/medium/TendermintBFT.md).

We have an upcoming meetup in Berkeley, CA, with Zarko about Tendermint. We will
livestream this meetup and publish the broadcast on the [Cosmos Network's
YouTube channel](http://bit.ly/2GTuJgx).

[proposer-selection]: https://github.com/tendermint/tendermint/blob/master/docs/specification/new-spec/reactors/consensus/proposer-selection.md
[sentry-node]: https://github.com/tendermint/tendermint/blob/master/docs/specification/new-spec/p2p/node.md
[pex]: https://github.com/tendermint/tendermint/blob/master/docs/specification/new-spec/reactors/pex/pex.md
[btcd]: https://github.com/btcsuite/btcd  
[dappzone]: https://blog.cosmos.network/why-application-specific-blockchains-make-sense-32f2073bfb37
