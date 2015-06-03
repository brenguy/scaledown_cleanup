scaledown_cleanup Cookbook
==========================
----- Will be converting SysV scripts to upstart/systemd scripts very soon. Hold on to your kvm and be patient please! -----

This cookbook grants your nodes remote workstation capabilities to delete their node ID + client key from a chef server during scaledown (knife). Intended for auto-scaling groups running Ubuntu (or other Debian). Script executes on run level 0. Probably not the best practice for managing your chef server but YOLO! #You Only Linux Once!

Will expand support to other OS families and convert scripts to upstart/systemd in the coming days. Stay tuned my chef army brothers and sisters!

Requirements
------------
No requirements at the moment besides chef. Only tested on Ubuntu 12.04.


Platform
--------
* Ubuntu



Attributes
----------
* ['chef']['url']
* ['chef']['client_key']
* ['chef']['validation_client_name']
* ['chef']['validation_key']


Usage
-----
Two steps:

* Include recipe in your front-end's run list (via role or env or recipe)

* Personalize the attributes for your infrastructure. Most likely only need to change chef url.

* Also can call the script re-register your chef node.


Features\ToDos:
---------------
1. Attribute out some more variables.
2. Test to see if it works on other Linux distros. (Right now only tested on ubuntu 12.04 and redhat 7.1 manually)
3. Build out next major release using upstart\systemd scripts instead of sysv or give you the option.


Contributing
------------

Will set up GitHub tomorrow.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Brendan Ledoux
