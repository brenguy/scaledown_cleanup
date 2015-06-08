scaledown_cleanup Cookbook
==========================

This cookbook grants your nodes remote workstation capabilities(knife) to delete their node ID + client key from a chef server during scaledown. Intended for auto-scaling groups. Probably not the best practice for managing your chef server but YOLO! #You Only Linux Once!

Gives you the choice of SysV init scripts or Systemd units to clean up your chef server.

Requirements
------------
You must set the below attributes. Most importantly you have to set whether your instance uses HVM or PV virutalization and if you want to use SysV or Systemd. Easiest way to use this cookbook is SysV scripts otherwise you'll follow some brief manual steps to set up systemd correctly. 



Platform
--------
* This cookbook passed manual tests on Ubuntu 12.04 and Redhat 7.1.





Attributes
----------
* ['chef']['url'] #your chef url
* ['chef']['client_key'] (default is prefered)
* ['chef']['validation_client_name'] (default is prefered)
* ['chef']['validation_key'] (default is prefered)
* ['virtualization_type'] #hvm or pv
* ['systemd'] #true or false


Usage
-----
The easiest way to use this cookbook is via legacy SysV init scripts. To do so set the systemd variable to false (You can still use the sysv scripts even if the operating system's default manager is systemd.) 

Otherwise prepare yourselves for the modern age! Systemd usage is a bit more involved. Note whether your OS supports systemd and if its your OS' default system manager. E.g. if you are running Red Hat Enterprise 7.1 then you can set your systemd variable to true without doing any manual work.

*PLEASE NOTE: If you decide to use systemd then you have to ensure systemd is the default service manager for your OS or you will have to personalize this cookbook to install systemd and set as default. 

Systemd adoption of major Linux distributions (wikipedia) per version\release date:

```
|----------------+---------------+--------------|
|       OS       | Added to repo |   Default    | 
|----------------+---------------+--------------|
|Arch Linux      |   01/x/2012   | 10/x/2012    |
|----------------+---------------+--------------|
|Core OS         |   07/x/2013   | 10/x/2013    |
|----------------+---------------+--------------|
|Debian          |   04/x/2012   | (v8.0) 2015  |
|----------------+---------------+--------------|
|Fedora          |   (v14) 2010  | (v15) 2011   |
|----------------+---------------+--------------|
|Gentoo Linux    |   07/x/2011   |      n\a     |
|----------------+---------------+--------------|
|Mageia          |   (v2.0) 2012 | (v2.0) 2012  |
|----------------+---------------+--------------|
|OpenSUSE        |   (v11.4) 2011| (v12.2) 2012 |
|----------------+---------------+--------------|
|Red Hat         |   (v7.0) 2014 | (v7.0) 2014  |
|----------------+---------------+--------------|
|SUSE Enterprise |   (v12) 2014  | (v12) 2014   |
|----------------+---------------+--------------|
|Ubuntu          | (v13.04) 2013 | (v15.04) 2015|
|----------------+---------------+--------------|
```

*The "added to repo" specifies when systemd became available to an OS via its software repos. "Default" is the first version of the OS that comes stock with systemd as its system manager.

AWS virtualization:
-------------------

1. Set the virtualization variable to 'hvm' or 'pv' depending on how your instances are virtualized. (Check AWS ec2 console for this if you don't know.)

2. It's important to note that different virtualization types get powered off  differently by AWS. If your instances are HVM then your instance's OS probably needs the ACPID package installed to receive the power off signal from its hypervisor (aws termination).


Features\ToDos:
---------------
1. Paramterize more variables.
2. Automate OS version\systemd installation to make this cookbook dummy proof.


Contributing:
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Brendan Ledoux
