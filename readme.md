# Vagrant LAMP (ubuntu/xenial64)

The intention behind this project is to provision a lamp environment using vagrant in the shortest amount of time with the smallest possible number of configuration and without having to install any of the lamp components directly in your system.

How to run the instance.

1. Install [virtualbox](https://www.virtualbox.org/wiki/Downloads) if you don't have it.
2. Install [vagrant](https://www.vagrantup.com/downloads.html) if you don't have it yet.
3. Clone the project into a new folder...
    ```
    git clone git@github.com:arumals/vagrant-lamp.git project-name && cd project-name && rm -rf .git
    ```
4. Run vagrant `vagrant up`, and wait for the the process to complete.
5. Your project must be visible in the url [http://localhost:3000](http://localhost:3000).
6. A new mysql `root` user with a `root` password is ready to be use (phpadmin is installed over [http://localhost:3000/phpmyadmin](http://localhost:3000/phpmyadmin)).
7. Add/remove/replace files inside the `public` folder (this contains your project's files).
8. Keep this instance closed when is not in use by doing...
    ```
    vagrant halt
    ```

*By doing `vagrant ssh` you can access the ubuntu shell and do any change needed.*
