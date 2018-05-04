Suggested Titles:

- Tendermint for Dummies: Bringing BFT to the Public
Blockchain Domain

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
had ever proposed BFT solutions beyond the single administrator domain, i.e.
centralized entities. There was little to no work done on BFT research for a
wide area network setup secured by a Proof-of-Stake security model before
Tendermint. figured out how to scale BFT-based protocols to the tune of hundreds
of nodes among a cluster of disparate multi-administrator domains (i.e.
decentralized, untrusted entities) when [he introduced Tendermint in
2014](https://tendermint.com/static/docs/tendermint.pdf). Consequently, this
system model for a large number of validating nodes in a WAN is significantly
more complex to engineer than it is for a small number of nodes.

The goal was to address a problem that was significantly harder to solve and do
it with an algorithmic complexity that was even simpler to understand. That was
Tendermint.

The breakthrough moment was when Jae Kwon realized that one could adapt
classical BFT algorithms and apply them to the permissionless public blockchain
setting, relying on Proof-of-Stake, rather than Proof-of-Work, as the underlying
security mechanism.

## The Model

Tendermint is modeled as a deterministic protocol, live under partial synchrony,
which achieves throughput within the bounds of the latency of the network and
individual processes themselves. That's quite the mouthful. Lets break it down
into digestible chunks.

__flp impossibility__ [FLP
Impossibility](https://groups.csail.mit.edu/tds/papers/Lynch/jacm85.pdf)

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

__Voting Power__

__Rotating Leader Election__

[Proposer selection procedure in
Tendermint](https://github.com/tendermint/tendermint/blob/master/docs/specification/new-spec/reactors/consensus/proposer-selection.md)

Because the protocol selects the block proposer using a mathematical function,
you know exactly who the next proposers are; there is no obfuscation there.
Indeed, Tendermint does not try to hide who the leaders will be. Some critics
stop here when arguing naively, that Tendermint isn't decentralized enough.

## P2P Networking Protocol

__sentry node architecture__

Read the Interview with Zarko:
[here](https://github.com/tendermint/aib-data/blob/develop/medium/TendermintBFT.md).

We have an upcoming meetup in Berkeley, CA, with Zarko about Tendermint. We will
livestream this meetup and publish the broadcast on the [Cosmos Network's
YouTube channel](http://bit.ly/2GTuJgx ).
