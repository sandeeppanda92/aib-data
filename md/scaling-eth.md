# Scaling Ethereum

In the following we will briefly describe different approaches to scaling Ethereum.


## Ethermint
The first approach is to use Ethermint to deploy your Dapps. Ethermint is a PoS
implementation of the Ethereum virtual machine. It implements the Web3 standard
and hence all of the tooling, such as wallets and UIs, build for Ethereum works
on Ethermint.

## Peg Zone
The peg zone allows Ethereum users to move their Ether or ERC20 tokens to the
Cosmos Hub. On the Cosmos Hub they can be exchanged at a much higher rate. Furthermore
the hub allows the movement of those tokens to specialised payment or EVM zones,
where users can use their tokens. The peg zone allows any user to withdraw their
tokens back to Ethereum in a permissionless way.

## Tendermint Plasma
Tendermint Plasma allows projects to build their dedicated blockchains applications
using the Cosmos-Sdk, while their tokens are staked on Ethereum. This means that
projects don't have to adapt to a completely new security model, but can rather
rely on the security properties of Ethereum, while benefiting from much higher
transaction throughput on the Tendermint child chain.

## Cosmos SDK
The Cosmos-Sdk gives project an easy way to build their own blockchain. This means
that features which used to be hard, such as Atomic Swaps, are now extremely 
simple and cheap to implement. Developers can define their own application logic
while taking advantage of all the fundamental building blocks that the Cosmos-Sdk
offers.
