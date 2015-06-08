# Dunkelheit

### Vagrant

To setup the development environment use the `vagrant up` command.

If you run into an error like
```
There are errors in the configuration of this machine. Please fix
the following errors and try again:

vm:
* The box 'ubuntu/trusty64' could not be found.
```

Use the following command to download the ubuntu/percise64
```
vagrant box add ubuntu/trusty64 https://atlas.hashicorp.com/ubuntu/boxes/trusty64/versions/20150530.0.2/providers/virtualbox.box
```

### Rails

Rails 2.2 is installed automatically during provisioning

### MySQL

MySQL
