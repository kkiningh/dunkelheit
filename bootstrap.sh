#!/usr/bin/env bash

# enable console colors
sed -i '1iforce_color_prompt=yes' ~/.bashrc

# set apt and dpkg to expect noninteractive input
# fixes "dpkg-preconfigure: unable to re-open stdin: No such file or directory"
export DEBIAN_FRONTEND=noninteractive

# update the list of package repositories
sudo apt-get -y update

# install ruby dependencies
sudo apt-get -y install git-core curl zlib1g-dev build-essential libssl-dev \
    libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev \
    libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

# setup rbenv and ruby-build
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

# Install ruby 2.2.2 and bundler
export RBENV_ROOT="${HOME}/.rbenv"
export PATH="${RBENV_ROOT}/bin:${PATH}"
export PATH="${RBENV_ROOT}/shims:${PATH}"
rbenv install 2.2.2
rbenv global 2.2.2

# disable docs during gem install
echo 'gem: --no-rdoc --no-ri' >> ~/.gemrc
gem install bundler

# install nodejs
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get -y update
sudo apt-get -y install nodejs

# install rails 4.2.1
gem install rails -v 4.2.1

# rehash
rbenv rehash

# set the root password for mysql to empty
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password '
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password '

# install mysql
sudo apt-get -y install mysql-server mysql-client libmysqlclient-dev
