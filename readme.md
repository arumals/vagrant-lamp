# Vagrant LAMP (ubuntu/xenial64)

The intention behind this project is to provision a lamp environment using vagrant in the shortest amount of time with the smallest possible number of configuration and without having to install any of the lamp components directly in your system.

How to run the instance.

1. Install [virtualbox](https://www.virtualbox.org/wiki/Downloads) if you don't have it.
2. Install [vagrant] (https://www.vagrantup.com/downloads.html) if you don't have it yet.
3. Clone the project into a folder `git clone git@github.com:arumals/vagrant-lamp.git project && cd project`.
4. Run vagrant `vagrant up`, and wait for the the process to complete.
5. Your project must be visible in the url [http://localhost:3000](http://localhost:3000).

The public folders contains the files that are going to be display in this url, by default there is an index and a php.info file.

It is possible to access the ubuntu shell by doing `vagrant ssh`.
