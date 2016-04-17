openbazaar Cookbook
===================
Installs OpenBazaar https://openbazaar.org/

Requirements
------------
#### packages
- `git`
- `openssl`
- `chef-sugar`
- `build-essential`
- `poise-python`
- `zeromq`
- `libsodium`

Attributes
----------
Node level defaults provided by the cookbook.  (for a sane default environment).`
- `node['ob']['deployment_type'] = 'source'`
- `node['ob']['version'] = '1.1.2'`
- `node['ob']['checksum'] = '535e67eadd4e044e7c34c0ce056c244c74d0eb18dd7383c38666c14e6987186d'`
- `node['ob']['source'] = 'https://github.com/OpenBazaar/OpenBazaar-Installer/releases/download/'`
- `node['ob']['server']['source'] = 'https://github.com/OpenBazaar/OpenBazaar-Server.git'`
- `node['ob']['server']['config']['CONSTANTS']['DATA_FOLDER'] = '/home/openbazaar/.openbazaar'`
- `node['ob']['server']['config']['CONSTANTS']['KSIZE'] = 20`
- `node['ob']['server']['config']['CONSTANTS']['ALPHA'] = 3`
- `node['ob']['server']['config']['CONSTANTS']['TRANSACTION_FEE'] = 15000`
- `node['ob']['server']['config']['CONSTANTS']['RESOLVER'] = 'https://resolver.onename.com/'`
- `node['ob']['server']['config']['LIBBITCOIN_SERVERS']['mainnet_server1'] = 'tcp://libbitcoin1.openbazaar.org:9091'`
- `node['ob']['server']['config']['LIBBITCOIN_SERVERS']['mainnet_server3'] = 'tcp://libbitcoin3.openbazaar.org:9091'`
- `node['ob']['server']['config']['LIBBITCOIN_SERVERS_TESTNET']['testnet_server2'] = 'tcp://libbitcoin2.openbazaar.org:9091,baihZB[vT(dcVCwkhYLAzah<t2gJ>{3@k?+>T&^3'`
- `node['ob']['server']['config']['LIBBITCOIN_SERVERS_TESTNET']['testnet_server4'] = 'tcp://libbitcoin4.openbazaar.org:9091,<Z&{.=LJSPySefIKgCu99w.L%b^6VvuVp0+pbnOM'`
- `node['ob']['server']['config']['AUTHENTICATION']['SSL'] = 'False'`
- `node['ob']['server']['config']['AUTHENTICATION']['SSL_CERT'] = 'ob_server_cert.pem'`
- `node['ob']['server']['config']['AUTHENTICATION']['SSL_KEY'] = 'ob_server_cert.key'`
- `node['ob']['server']['config']['AUTHENTICATION']['USERNAME'] = SecureRandom.hex`
- `node['ob']['server']['config']['AUTHENTICATION']['PASSWORD'] = SecureRandom.hex`
- `node['ob']['certificate']['common_name'] = 'www.f00bar.com'`
- `node['ob']['certificate']['org'] = 'Foo Bar'`
- `node['ob']['certificate']['org_unit'] = 'Lab'`
- `node['ob']['certificate']['country'] = 'US'`
- `node['ob']['server']['config']['MAINNET_SEEDS']['mainnet_seed2'] = 'seed2.openbazaar.org:8080,8b17082a57d648894a5181cb6e1b8a6f5b3b7e1c347c0671abfcd7deb6f105fe'`
- `node['ob']['server']['config']['MAINNET_SEEDS']['mainnet_seed3'] = 'seed.obcentral.org:8080,f0ff751b27ddaa86a075aa09785c438cd2cebadb8f0f5a7e16f383911322d4ee'`
- `node['ob']['server']['config']['TESTNET_SEEDS']['testnet_seed1'] = 'seed.openbazaar.org:8080,5b44be5c18ced1bc9400fe5e79c8ab90204f06bebacc04dd9c70a95eaca6e117'`
- `node['ob']['server']['ob_service_user'] = 'openbazaar'`
- `node['ob']['server']['ob_service_group'] = 'openbazaar'`
- `node['ob']['server']['config']['allowed_admin_ip'] = '127.0.0.1'`
- `node['ob']['server']['config']['additional_flags'] = ''`
- `node['ob']['server']['config']['ports']['dht'] = '18467'`
- `node['ob']['server']['config']['ports']['testnet_dht'] = '28467'`
- `node['ob']['server']['config']['ports']['rest'] = '18469'`
- `node['ob']['server']['config']['ports']['websocket'] = '18466'`
- `node['ob']['server']['config']['ports']['heartbeat'] = '18470'`
- `node['ob']['server']['config']['ports']['seed'] = '8080'`

Attributes may be over-ridden in the normal, node/role/environment level attribute `override_attributes`.

Additionally if one exists a databag definition will take presentence for any attribute declared.
The databag is configured to be `{CHEF ENVIRONMENT}\ob`

Example
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

In addition the the non-secure attributes noted so far there are several encrypted attributes that are required.

`{CHEF_ENVIRONMENT}\ob_secrets`
Example:
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
Failure to create this will cause the convergence to generate a random username/password combination everytime its run.


e.g.
#### openbazaar::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['openbazaar']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### openbazaar::default
Installs and compiles OpenBazaar

Just include `openbazaar` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[openbazaar]"
  ]
}
```

#### openbazaar::server
Configures an OpenBazaar Server to run under a service account as a daemon.
This includes autostarting with the system.

Includes the default recipe.
Example role:
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
Configures an OpenBazaar Seed Server to run under a service account as a daemon.
This includes autostarting with the system.

Includes the default recipe.
Example role:
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
