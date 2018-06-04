# Security

## Vulnerabilties

Security researchers and white hat hackers are a vital part of building strong, resilient cryptocurrency protocols.  At Tendermint & Cosmos, we actively support the work that hackers and researchers do to find, report and patch security vulnerabilities. 

### Coordinated Vulnerability Disclosure Policy

We ask security researchers to keep vulnerabilities and communications around vulnerability submissions private and confidential until a patch is developed to protect the people using Tendermint’s protocols. In addition to this, we ask that you:

-   Allow us a reasonable amount of time to correct or address security vulnerabilities.
-   Avoid exploiting any vulnerabilities that you discover. 
-   Demonstrate good faith by not disrupting or degrading Tendermint’s data or services.

### Vulnerability Disclosure Process

Once we receive a vulnerability report, Tendermint will take these steps to address it: 

1.  Tendermint will confirm receipt of the vulnerability report within 2 business days. The timing of our response may depend on when a report is submitted. As our daily operations are distributed in time zones across the globe, response times may vary. If you have not received a response to a vulnerability report from us within 2 business days, we encourage you to follow up with us again for a response.
2.  Tendermint will investigate and validate the security issue submitted to us as quickly as we can, usually within 5 business days of receipt. Submitting a thorough report with clear steps to recreate the vulnerability and/or a proof-of-concept will move the process along in a timely manner. 
3.  Tendermint will acknowledge the bug, and make the necessary code changes to patch it. Some issues may require more time than others to patch, but we will strive to patch each vulnerability as quickly as our resources and development process allow.
4.  Tendermint will publicly release the security patch for the vulnerability, and acknowledge the security fix in the release notes once the issue has been resolved. Public release notes can reference to the person or people who reported the vulnerability, unless they wish to stay anonymous. 

## Bug Bounty Program

At Tendermint, we strongly believe in compensating researchers for the time they invest in making cryptocurrencies stronger and more resilient. Depending on the severity and criticality of an issue, researchers who report bugs and respect our vulnerability disclosure policy may be eligible for rewards through our [bug bounty program](https://blog.cosmos.network/bug-bounty-program-for-tendermint-cosmos-833c67693586) with HackerOne.

-   Bounty reward amounts are based on many factors, including impact, risk, likelihood of exploitation, and report quality. 
-   There is no maximum reward in the program, but critical bugs are eligible for rewards equivalent to $2,500 in ETH or more. For severe bugs or exceptional bug reports, we may decide to pay lower-tier bugs a higher-tier reward.
-   Program rewards will be paid in ETH, and will be calculated using prices at the time of payment.
-   If we receive duplicate bug reports, we will award a bounty to the first person who reported the issue.
-   Any bugs that are found in services that we use (i.e. Mailchimp, Meetup, RiotChat) are ineligible for rewards, and should be disclosed directly to those services.

To learn more about the scope of our bug bounty program or to report a bug, please visit HackerOne.

## Contact Us

If you find a security issue, you can contact our team directly at <mailto:security@tendermint.com>, or report it to our bug bounty program on HackerOne. 

To report the issue through a PGP-encrypted email, here is our pubkey fingerprint: [DBB0 B3EC 64A4 BDAA](https://keybase.io/ebuchman)

    # curl + gpg pro tip: import security@tendermint's keys
    curl https://keybase.io/ebuchman/pgp_keys.asc | gpg --import
