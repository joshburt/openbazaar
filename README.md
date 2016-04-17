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
TODO: List your cookbook attributes here.

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
