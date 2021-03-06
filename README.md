OpenBazaar Cookbook
===================
[![Cookbook Version](https://img.shields.io/cookbook/v/openbazaar.svg)](https://supermarket.getchef.com/cookbooks/openbazaar) [![Build Status](https://travis-ci.org/joshburt/openbazaar.svg?branch=master)](https://travis-ci.org/joshburt/openbazaar)

This cookbook installs, configures, and maintains the OpenBazaar server components.

Features
--------

* Installs from either the binary or source distributions of OpenBazaar
* Supports installation of a standard OpenBazaar server
* Supports the installation of an OpenBazaar seed server
* Installs the services as daemons
* Enables auto-starting of daemons
* Creates a self-signed SSL certificate for secure client to server communications
* Updates source distributions from git repositories on each chef run (keeps it up to date)

Overview
--------
OpenBazaar is an open source project to create a decentralized network for peer to peer commerce online using Bitcoin.

* OpenBazaar Official Site | https://openbazaar.org/
* OpenBazaar Documentation | https://docs.openbazaar.org/

Platform
------------
* Tested on
    * Debian 7 (no service manipulation support)
    * Debian 8 (no service manipulation support)
    * Ubuntu 14.04
    * Ubuntu 15.04 (no service manipulation support)
    * Ubuntu 16.04 (no service manipulation support)
  
Requirements
------------
The below cookbooks are dependencies, either direct or indirect.
#### packages
* `build-essential`
* `chef_handler`
* `chef-sugar`
* `dmg`
* `git`
* `libsodium`
* `openssl`
* `poise`
* `poise-archive`
* `poise-languages`
* `poise-python`
* `seven_zip`
* `windows`
* `yum`
* `yum-epel`
* `zmq`

Attributes
----------
Node level defaults provided by the cookbook.  (for a sane default environment).

**OpenBazaar Installation Flavor Configuration**

* node`['ob']['deployment_type']`
  * the type of deployment to use. possible values `'source'`, `'binary'`
  * default is `'binary'`

**Binary Deployment Type Configuration**

* node`['ob']['version']`
  * version of the binary to download
  * default is `'1.1.2'`
* node`['ob']['checksum']`
  * checksum of the remote binary artifact
  * default is `'535e67eadd4e044e7c34c0ce056c244c74d0eb18dd7383c38666c14e6987186d'`
* node`['ob']['source']`
  * download URL for the binary download
  * default is `'https://github.com/OpenBazaar/OpenBazaar-Installer/releases/download/'`

**Source Deployment Type Configuration**

* node`['ob']['server']['source']`
  * git repository for OpenBazaar-Server
  * default is `'https://github.com/OpenBazaar/OpenBazaar-Server.git'`
* node`['ob']['server']['config']['CONSTANTS']['DATA_FOLDER']`
  * OpenBazaar data folder
  * default is `'/home/openbazaar/.openbazaar'`
* node`['ob']['server']['config']['CONSTANTS']['KSIZE']`
  * Kademlia Protocol ksize
  * default is `20`
* node`['ob']['server']['config']['CONSTANTS']['ALPHA']`
  * Kademlia Protocol alpha
  * default is `3`
* node`['ob']['server']['config']['CONSTANTS']['TRANSACTION_FEE']`
  * bitcoin transaction fee (in satoshis)
  * default is `15000`
* node`['ob']['server']['config']['CONSTANTS']['RESOLVER']`
  * BlockStack Resolver API end-point
  * default is `'https://resolver.onename.com/'`
* node`['ob']['server']['config']['LIBBITCOIN_SERVERS']['mainnet_server1']`
  * bitcoind RPC server (1)
  * default is `'tcp://libbitcoin1.openbazaar.org:9091'`
* node`['ob']['server']['config']['LIBBITCOIN_SERVERS']['mainnet_server3']`
  * bitcoind RPC server (3)
  * default is `'tcp://libbitcoin3.openbazaar.org:9091'`
* node`['ob']['server']['config']['LIBBITCOIN_SERVERS_TESTNET']['testnet_server2']`
  * TESTNET bitcoind RPC Server (2)
  * default is `'tcp://libbitcoin2.openbazaar.org:9091,baihZB[vT(dcVCwkhYLAzah<t2gJ>{3@k?+>T&^3'`
* node`['ob']['server']['config']['LIBBITCOIN_SERVERS_TESTNET']['testnet_server4']`
  * TESTNET bitcoind RPC Server (4)
  * default is `'tcp://libbitcoin4.openbazaar.org:9091,<Z&{.=LJSPySefIKgCu99w.L%b^6VvuVp0+pbnOM'`
* node`['ob']['server']['config']['AUTHENTICATION']['SSL']`
  * require SSL between the server and client components
  * default is `'False'`
* node`['ob']['server']['config']['AUTHENTICATION']['SSL_CERT']`
  * public certificate component to generate (self signed)
  * default is `'ob_server_cert.pem'`
* node`['ob']['server']['config']['AUTHENTICATION']['SSL_KEY']`
  * private key for the (self signed) certificate to generate
  * default is `'ob_server_cert.key'`
* node`['ob']['server']['config']['AUTHENTICATION']['USERNAME']`
  * name of the user account (client to server)
  * default is a random changing value (each convergence)
* node`['ob']['server']['config']['AUTHENTICATION']['PASSWORD']`
  * password for the user account (client to server)
  * default is randomly changing value (each convergence)


**SSL Certification Configuration**

* node`['ob']['certificate']['common_name']` - 
  * Common Name
  * default is `'www.f00bar.com'`
* node`['ob']['certificate']['org']` - 
  * Organization
  * default is `'Foo Bar'`
* node`['ob']['certificate']['org_unit']` - 
  * Organizational Unit
  * default is `'Lab'`
* node`['ob']['certificate']['country']` - 
  * Country
  * default is `'US'`

**OpenBazaar Remote Seed Server Configuration**

* node`['ob']['server']['config']['MAINNET_SEEDS']['mainnet_seed2']`
  * Seed Server (2)
  * default is `'seed2.openbazaar.org:8080,8b17082a57d648894a5181cb6e1b8a6f5b3b7e1c347c0671abfcd7deb6f105fe'`
* node`['ob']['server']['config']['MAINNET_SEEDS']['mainnet_seed3']`
  * Seed Server (3)
  * default is `'seed.obcentral.org:8080,f0ff751b27ddaa86a075aa09785c438cd2cebadb8f0f5a7e16f383911322d4ee'`
* node`['ob']['server']['config']['TESTNET_SEEDS']['testnet_seed1']`
  * TESTNET Seed Sever (1)
  * default is `'seed.openbazaar.org:8080,5b44be5c18ced1bc9400fe5e79c8ab90204f06bebacc04dd9c70a95eaca6e117'`

**OpenBazaar Service Account Configuration**

* node`['ob']['server']['ob_service_user']`
  * name of the service account to run the daemons under 
  * default is `'openbazaar'`
* node`['ob']['server']['ob_service_group']`
  * name of the group account to run the daemons under 
  * default is `'openbazaar'`

**OpenBazaar Remote Administration Configuration**

* node`['ob']['server']['config']['allowed_admin_ip']`
  * allowed IP address for remote administration
  * default is `'127.0.0.1'`

**OpenBazaar Additional Command Line Options**

* node`['ob']['server']['config']['additional_flags']`
  * catch-all for any additional options that need to be passed to the daemons commandline arguments
  * default is `''`

**OpenBazaar Server Port Configuration** 

* node`['ob']['server']['config']['ports']['dht']`
  * port used for DHT
  * default is `'18467'`
* node`['ob']['server']['config']['ports']['testnet_dht']`
  * port used for TESTNET DHT
  * default is `'28467'`
* node`['ob']['server']['config']['ports']['rest']`
  * port used for RESET API
  * default is `'18469'`
* node`['ob']['server']['config']['ports']['websocket']`
  * port used for websocket
  * default is `'18466'`
* node`['ob']['server']['config']['ports']['heartbeat']`
  * port used for heartbeat
  * default is `'18470'`
* node`['ob']['server']['config']['ports']['seed']`
  * port use for seed server connections
  * default is `'8080'`


Configuration
-------------

### By Native Node Attributes

Attributes may be over-ridden in the normal node/role/environment level attribute `override_attributes`.

**Attribute Example**

Installs from source with custom SSL certificate fields.

```json
{
  "override_attributes": {
    "ob": {
      "deployment_type" : "source",
      "certificate" : {
        "common_name" : "my.coolcompany.com",
        "org" : "My Cool Company",
        "org_unit" : "ENG",
        "country" : "US"
      }
    }
  }
}
```

### By Data Bag Items

If one exists, a data bag item  definition will take precedence over any above attribute declarations.  The data bag item can over-ride all -or- portions of the node level attributes.

The data bag item is configured to be `{CHEF ENVIRONMENT}\ob`

**Data Bag Example**

```json
{
  "name" : "data_bag_item_dev_ob_ob",
  "json_class" : "Chef::DataBagItem",
  "chef_type" : "data_bag_item",
  "data_bag" : "dev_ob",
  "raw_data" : {
	"id" : "ob",
	"version" : "1.1.2",
	"checksum" : "535e67eadd4e044e7c34c0ce056c244c74d0eb18dd7383c38666c14e6987186d",
	"source": "https://github.com/OpenBazaar/OpenBazaar-Installer/releases/download/",
	"deployment_type": "source",
	"certificate": {
	  "common_name": "www.f00bar.com",
	  "org": "Foo Bar",
	  "org_unit": "Lab",
	  "country": "US"
	},
	"server": {
	  "source": "https://github.com/OpenBazaar/OpenBazaar-Server.git",
	  "ob_service_user" : "openbazaar",
	  "ob_service_group": "openbazaar",
	  "config": {
		"allowed_admin_ip": "127.0.0.1",
		"additional_flags": "",
		"ports": {
		  "dht": "18467",
		  "testnet_dht": "28467",
		  "rest": "18469",
		  "websocket": "18466",
		  "heartbeat": "18470",
		  "seed": "8080"
		},
		"CONSTANTS": {
		  "DATA_FOLDER": "/home/openbazaar/.openbazaar",
		  "KSIZE": "20",
		  "ALPHA": "3",
		  "TRANSACTION_FEE": "15000",
		  "RESOLVER": "https://resolver.onename.com/"
		},
		"LIBBITCOIN_SERVERS": {
		  "mainnet_server1": "tcp://libbitcoin1.openbazaar.org:9091",
		  "mainnet_server3": "tcp://libbitcoin3.openbazaar.org:9091"
		},
		"LIBBITCOIN_SERVERS_TESTNET": {
		  "testnet_server2": "tcp://libbitcoin2.openbazaar.org:9091,baihZB[vT(dcVCwkhYLAzah<t2gJ>{3@k?+>T&^3",
		  "testnet_server4": "tcp://libbitcoin4.openbazaar.org:9091,<Z&{.=LJSPySefIKgCu99w.L%b^6VvuVp0+pbnOM"
		},
		"AUTHENTICATION": {
		  "SSL": "True"
		},
		"MAINNET_SEEDS": {
		  "mainnet_seed2": "seed2.openbazaar.org:8080,8b17082a57d648894a5181cb6e1b8a6f5b3b7e1c347c0671abfcd7deb6f105fe",
		  "mainnet_seed3": "seed.obcentral.org:8080,f0ff751b27ddaa86a075aa09785c438cd2cebadb8f0f5a7e16f383911322d4ee"
		},
		"TESTNET_SEEDS": {
		  "testnet_seed1": "seed.openbazaar.org:8080,5b44be5c18ced1bc9400fe5e79c8ab90204f06bebacc04dd9c70a95eaca6e117"
		}
	  }
	},
	"client": {
	  "source": "https://github.com/OpenBazaar/OpenBazaar-Client.git"
	}
  }
}
```


Credentials
-----------
In addition to the non-secure attributes noted so far there are several encrypted attributes that are **required**.  

`Failure to create these credentials will result in randomly generate values being supplied to the ob.cfg for the username and password on every chef run.`

The encrypted data bag item is configured to be `{CHEF ENVIRONMENT}\ob_secrets`

**Example**

```json
{
  "id": "ob_secrets",
  "server": {
    "config": {
      "AUTHENTICATION": {
        "USERNAME": "SUPER_SECRET_ADMIN",
        "PASSWORD": "SUPER_SECRET_PASSWORD"
      }
    }
  }
}
```


### Helpful hints for working with encrypted data bag items

* If you need to make an encrypted data bag secret you can easily create one with a command similar to this

```
openssl rand -base64 4096 | tr -d '\r\n' > .chef/encrypted_data_bag_secret
```

* If you need to create the data bag

```
knife data bag create ob_dev -z
```

* If you need to create the encrypted data bag item

```
knife data bag create ob_dev ob_secrets -z --secret-file ./.chef/encrypted_data_bag_secret
```


Usage
-----
#### openbazaar::default
Downloads, compiles [for source deployments], and installs OpenBazaar and dependencies.

Just include `openbazaar` in your node's `run_list`:

**Example Runlist**

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[openbazaar]"
  ]
}
```

#### openbazaar::server
Configures an OpenBazaar Server to run under a service account as a daemon. This includes autostarting with the system.

**Example Role**

```json
{
  "name": "ob_server",
  "description": "OpenBazaar Server",
  "json_class": "Chef::Role",
  "default_attributes": { },
  "override_attributes": { },
  "chef_type": "role",
  "run_list": [
    "recipe[openbazaar::server]"
  ]
}
```

#### openbazaar::seed
Configures an OpenBazaar Seed Server to run under a service account as a daemon. This includes autostarting with the system.

**Example Role**

```json
{
  "name": "ob_seed",
  "description": "OpenBazaar Seed Server",
  "json_class": "Chef::Role",
  "default_attributes": { },
  "override_attributes": { },
  "chef_type": "role",
  "run_list": [
    "recipe[openbazaar::seed]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
MIT License

Copyright (c) 2016 Joshua C. Burt

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
