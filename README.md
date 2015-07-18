# Dunkelheit

Dunkelheit is a prototype implementation of an "almost" anonymous marketplace.
In addition, it retains its anonymity guarentee even when the market database is made public.

## Background

### Current anonymous marketplaces
    - Silkroad/Agora/etc (http://www.gwern.net/Silk%20Road)
        - Centralized site, Amazon style
        - All connection made over tor to hid IP of all participants (market, buyers, sellers, arbiters, etc)
        - Setup
            - Arbiters
                - Pesudonyms may or may not be public
                - Work for marketplace owner
            - Sellers
                - Public Key
                - Product list (prices, description)
                - Reviews + Rating
                - To create an account, sellers must post a bond (~$100-$500) to an arbiter
                    - If the seller may lose bond if caught scamming
                    - Bond typically refunded after some number of successful sales
                    - Bond is sometimes waived if seller is already well known
            - Buyers
                - Public Key
                - Reviews (only public to sellers)
        - Transaction Flow
            1. Buyer selects a product from Seller and sends Arbiter:
                - Shipping address, including name (encrypted with sellers public key)
                - Enough coins to cover the cost of the product + shipping
                - Any special instructions for the Seller
            2. Arbiter sends Seller the purchase order (excluding the coins)
            3. Seller sends product and tells Buyer and Arbiter the product has shipped
            4. Buyer recives and inspects product
                a. If the product is as-ordered, coins are released to seller (also called order finalization)
                b. Otherwise, arbiter investigates and proposes resolution (all seller, all buyer, 50/50 split, etc)
            5. Arbiter releases coins, taking a small fee (usually 1-3%)
            6. Buyer reviews seller (publicly) and seller reviews buyer (privately)
        - Benefits
            - Convient (Buyers/Sellers can easily communicate and find each other)
            - Arbiter can ban scammers (either Buyers or Sellers)
            - Only Buyer and Seller ever learn Buyer's address
        - Drawbacks
            - Seller can require early finalization before product is shipped/inspected, defeating arbitration
            - Arbiter can steal coins before transaction completes
            - Arbiter can alter product description and/or take over vendor accounts
                - Solution: Sign product descriptions and post account public key out of band
            - Seller can leak buyers information (real address, purchase amount)
                - Possible as retailation for bad review, 
            - Buyer can leak seller information (return address, packaging details)
            - Buyer can request arbitration even when they recieve product
                - Best case: prevent tie up Sellers coins in arbitration until investigation completes
                - Worst case: arbitration decided in Buyer's favor and the Seller recieves nothing
            - If site is taken down (DoS/hacker/government) then all pending transactions cannot complete

    - OpenBazzaar (https://github.com/OpenBazaar/OpenBazaar)
        - Stores are distributed amoung all participants
        - Uses "distributed trust" model for reviews/scammer banning
        - Advantages
            - Harder to take down since there is no central site
        - Disadvantages
            - Sellers must be constantly online to respond to buyers
            - Security model is complex and unproven
            - Developer has actively made clear they do not want darknet activity (but cannot prevent it)

    - Blockchain/Coin based (examples ?)
        - Products and sellers info is stored directly in blockchain
        - ? Ordering occurs without any middlemen
        - Advantages
            - Impossible to take down without also taking down the blockchain
        - Disadvantages
            - All other communication (reviews, arbitration, recipts, shipping info) takes place out of band
                - Possible to incorperate, but transaction size limits might make this costly
            - Impossible to ban scammers
            - Can be difficult to make anonymous
                - Bitcoin has had security issues when using it over tor, although clearly possible

### Proposed
    - Centralized server, but all information on it is public
        - If the server is taken down, another one can be setup with the same information very quickly (ala Pirate Bay)
        - Hacker/Government/person running the site has essentially same info as the public
    - Transaction Flow
        - 

    Reviews
        https://gist.github.com/dionyziz/e3b296861175e0ebea4b
    
## Grab

    for i in {1..2500};
    do (http_proxy="localhost:8123" wget --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=15 --tries=10
    --load-cookies=cookies.txt --user-agent="$(cat ~/blackmarket-mirrors/user-agent.txt)" --append-output=log.txt
    --server-response --max-redirect=0 "http://trdealmgn4uvm42g.onion/purchases/details/$i");
    done

## How It Works

On Dunkelheit there are three user roles
    - Buyers
    - Sellers
    - Arbiters

All users have their public key published publicly.

A simple transaction works as follows:
    1. A buyer *B* selects a product *P* offered by a particular seller *S*
    2. The buyer then creates a 
    3.
    4.

## Setup

### Vagrant

To setup the development environment use the `vagrant up` command.

If you run into an error like
```
There are errors in the configuration of this machine. Please fix
the following errors and try again:

vm:
* The box 'ubuntu/trusty64' could not be found.
```

Use the following command to download the `ubuntu/percise64` box from hashicorp.
```
vagrant box add ubuntu/trusty64 https://atlas.hashicorp.com/ubuntu/boxes/trusty64/versions/20150530.0.2/providers/virtualbox.box
```

### Ruby on Rails

Ruby on Rails utilities and gems installed during provisioning
    - Ruby 2.2
    - Rails 4.2
    - Bundler
    - nodejs (as JS runtime for rake)

### MySQL

MySQL is installed during provisioning with user `root` and password `root`
