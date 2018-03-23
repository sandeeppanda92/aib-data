# Staking - Validators

## What is a validator?

The [Cosmos Hub](/developers) is based on [Tendermint](https://tendermint.com), which relies on a set of validators that are responsible for committing new blocks in the blockchain. These validators participate in the consensus protocol by broadcasting votes which contain cryptographic signatures signed by each validator's private key.

Validator candidates can bond their own Atoms and have Atoms ["delegated"](/staking/delegators), or staked, to them by token holders. The Cosmos Hub will have 100 validators, but over time this will increase to 300 validators according to a predefined schedule. The validators are determined by who has the most stake delegated to them — the top 100 validator candidates with the most stake will become Cosmos validators.

Validators and their delegators will earn Atoms as block provisions and tokens as transaction fees through execution of the Tendermint consensus protocol. Initially, transaction fees will be paid in Atoms but in the future, any token in the Cosmos ecosystem will be valid as fee tender if it is whitelisted by governance. Note that validators can set commission on the fees their delegators receive as additional incentive.

If validators double sign, are frequently offline or do not participate in governance, their staked Atoms (including Atoms of users that delegated to them) can be slashed. The penalty depends on the severity of the violation.

All details concerning validators and the validation process can be found in our FAQ. [Read the validator FAQ](/staking/validators-faq)

## Becoming a validator

Each validator candidate is encouraged to run its operations independently, as diverse setups increase the resilience of the network. Validator candidates should commence their setup phase now in order to be on time for launch.

Next, you will find baseline recommendations for entities intending to run a validator in the early days of the Cosmos network. Note that these are recommendations. They are not is mandatory for becoming a validator. Ultimately, validator candidates are sorted based on their total stake.

### Baseline recommendations:

#### 1. Read the FAQ

Be familiar with all the responsibilities of a validator by reading our [FAQ](/staking/validators-faq). This FAQ will be frequently updated so be sure to stay up-to-date.

#### 2. Participate in the testnet

Actively participate in the testnet. By the end of 2017 you should be able to maintain a validator node with constant uptime on the testnet. Below you will find instructions on how to become a validator in our testnet.

* [Text Tutorial](https://github.com/cosmos/gaia/blob/master/README.md)
* [Video Tutorial](https://www.youtube.com/watch?v=B-shjoqvnnY)

Tutorial and faucet maintained by community member [Michael Yuan](http://cosmosvalidators.com)

Be sure to frequently check the [changelog](https://github.com/cosmos/gaia/blob/master/CHANGELOG.md) and the [validator chat](https://riot.im/app/#/room/#cosmos_validators:matrix.org) to keep track of any updates.

#### 3. Set up a validator website

Set up a dedicated validator's website and signal your intention to become a validator on our [forum](https://forum.cosmos.network/t/validator-candidates-websites/127/3). This is important since delegators will want to have information about the entity they are delegating their Atoms to.

#### 4. Hardware

There currently exists no appropriate cloud solution for validator key management. This may change in 2018 when cloud SGX becomes more widely available. For this reason, validators must set up a physical operation secured with restricted access. A good starting place, for example, would be co-locating in secure datacenters.

Validators should expect to equip their datacenter location with redundant power, connectivity, and  storage backups. Expect to have several redundant networking boxes for fiber, firewall and switching and then small servers with redundant hard drive and failover. Hardware can be on the low end of datacenter gear to start out with.

We anticipate that network requirements will be low initially. The current testnet requires minimal resources. Then bandwidth, CPU and memory requirements will rise as the network grows. Large hard drives are recommended for storing years of blockchain history.

#### 5. Key management - HSM

It is mission critical that an attacker cannot steal a validator's key. If this is possible, it puts the entire stake delegated to the compromised validator at risk. Hardware security modules are an important strategy for mitigating this risk.

HSM modules must support ed25519 signatures for the hub. The YubiHSM2 supports ed25519 and we expect to have an adapter library available in december. The YubiHSM can protect a private key but cannot ensure in a secure setting that it won't sign the same block twice.

The Tendermint team is also working on extending our Ledger Nano S application to support validator signing. This app can store recent blocks and mitigate double signing attacks.

We will update this page when more key storage solutions become available.

#### 6. DDOS protection (sentry node)

Validators are responsible for ensuring that the network can sustain denial of service attacks.

We recommend that validators run full nodes in the cloud and configure their validator nodes only to connect to those full nodes. Those full nodes can be moved or apply cloud based DDOS protection to mitigate DDOS attacks

Finally, establishing connections directly with other validators can ensure that your node can't be taken offline via internet based attacks.

Validators should track the progress of these two github issues:

* https://github.com/tendermint/tendermint/issues/866
* https://github.com/tendermint/tendermint/issues/865

Validators should begin testing sentry nodes on the testnet when progress has been made on these issues.

#### 7. Organize with your local jurisdiction

We strongly recommend that validators setup a separate company and not be run directly by an individual. Seek legal advice if you believe you may need additional licenses. Validators may want to establish terms of service and limits on liability for delegators or have delegators to operate at their own risk.

## Community

Discuss the finer details of being a validator on our community chat and forum:

* [Validator Chat](https://riot.im/app/#/room/#cosmos_validators:matrix.org)
* [Validator Forum](https://forum.cosmos.network/c/validating)

Promote your validator's website by posting on [this thread in our forum](https://forum.cosmos.network/t/validator-candidates-websites/127).

## Mailing List

Subscribe to our Validator's mailing list to get the latest news about testnets, documentation, timelines and more!
* [Validator Mailing List](https://tendermint.us8.list-manage.com/subscribe?u=89d5a312be95ee3f0c9cf7ecd&id=a8e72383ff)
