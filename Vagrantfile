# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # Use 64 bit Ubuntu 12.04.5 LTS (Precise Pangolin)
  config.vm.box = "hashicorp/precise64"

  # make virtual box use 2 cpus and 2GB ram
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = 2
  end

  # make a private network so the image is only accessable from localhost
  config.vm.network "private_network", ip: "192.168.111.222"

  # forward the default port for rails
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  # share the current directory to www
  config.vm.synced_folder ".", "/var/www/", :mount_options => ["dmode=755,fmode=755"]

  # Workaround for annoying "stdin: is not a tty" bug
  # see https://github.com/mitchellh/vagrant/issues/1673
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  # provision using a bootstrap script
  config.vm.provision "shell", path: "bootstrap.sh", privileged: false
end
