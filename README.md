# Fabricker

## Requirements

Assumes Ubuntu 13 or 12.04 x64 right now. Ideally have a domain ready to point to your host. It's designed for and is probably
best to use a fresh VM. The bootstrapper will install everything it needs.

**Note: There are known issues with docker and Ubuntu 13.10 ([1](https://github.com/dotcloud/docker/issues/1300), [2](https://github.com/dotcloud/docker/issues/1906)) - use of 12.04 is recommended until these issues are resolved.**

## Installing

### Stable

    $ wget -q https://raw.github.com/barrachri/fabricker/master/fabfile.py
    $ sudo apt-get update && sudo apt-get -y install fabric

### Fabricker command

    $ nginx_create
    $ nginx_stop
    $ nginx_remove


This may take around 5 minutes. Certainly better than the several hours it takes to bootstrap Cloud Foundry.

You may also wish to take a look at the [advanced installation](http://progrium.viewdocs.io/dokku/advanced-installation) document for additional installation options.

## Configuring

Set up a domain and a wildcard domain pointing to that host. Make sure `/home/dokku/VHOST` is set to this domain. By default it's set to whatever hostname the host has. This file is only created if the hostname can be resolved by dig (`dig +short $(hostname -f)`). Otherwise you have to create the file manually and set it to your prefered domain. If this file still is not present when you push your app, dokku will publish the app with a port number (i.e. `http://example.com:49154` - note the missing subdomain).

You'll have to add a public key associated with a username by doing something like this from your local machine:

    $ cat ~/.ssh/id_rsa.pub | ssh progriumapp.com "sudo sshcommand acl-add dokku progrium"

That's it!