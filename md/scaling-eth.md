# Scaling Ethereum

## Ethermint

The first approach is to use [Ethermint](https://ethermint.zone) to deploy your Dapp. Ethermint is a Proof-of-Stake implementation of the Ethereum virtual machine. It implements the Web3 standard and hence all of the tooling, such as wallets and UIs, built for Ethereum works on Ethermint.

## Peg Zone 'Peggy'

The [peg zone 'Peggy'](https://ether.peg.zone) allows Ethereum users to move their Ether or ERC20 tokens to the Cosmos Hub. On the Cosmos Hub they can be exchanged at a much faster rate. Furthermore, the Hub allows movement of those tokens to specialized payment or EVM zones, where users can access their tokens. Peggy allows any user to withdraw their tokens back to Ethereum in a permissionless way.

## Tendermint Plasma

[Tendermint Plasma](https://github.com/cosmos/plasma) allows projects to build their dedicated blockchains applications using the Cosmos-SDK, while their tokens are staked on Ethereum. This means that projects won't have to adapt to a new security model, but can rather rely on the security properties of Ethereum, while benefiting from much higher transaction throughput on the Tendermint child chain.

## Cosmos SDK

Perhaps you don't need Ethereum at all? The [Cosmos-SDK](/developers) gives project an easy way to build their own blockchain. This means that features which used to be difficult, such as Atomic Swaps, are now simple and cheap to implement. Developers can define their own application logic while taking advantage of all the fundamental building blocks that the Cosmos-SDK offers.

## Discuss with us

Want some assistance on moving your Dapp over to Cosmos? Chat with us on [developer chat](https://riot.im/app/#/room/#cosmos:matrix.org) and we'll help you out.
