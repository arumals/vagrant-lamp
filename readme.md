# Vagrant LAMP (ubuntu/xenial64)

The intention behind this project is to provision a lamp environment using vagrant in the shortest amount of time with the smallest possible number of configuration and without having to install any of the lamp components directly in your system.

List of components.
- Apache 2.4
- Python 2.7
- Pip 8.0
- Ruby 2.3
- MySQL 5.7
- PHP 7.0
- PHPMyAdmin
- Composer
- Codeception
- Mailcatcher

How to run the instance.

1. Install [virtualbox](https://www.virtualbox.org/wiki/Downloads) if you don't have it.
2. Install [vagrant](https://www.vagrantup.com/downloads.html) if you don't have it.
3. Clone the project into a new folder and remove the .git folder references.
    ```
    git clone git@github.com:arumals/vagrant-lamp.git project-name
    cd project-name
    rm -rf .git
    ```
4. Run vagrant `vagrant up`, and wait for the the process to complete.
5. Open the url [http://localhost:8080](http://localhost:8080) and you'll see the "Hello World" message.
6. A new mysql `root` user with a `root` password is ready to be use (phpadmin is installed over [http://localhost:8080/phpmyadmin](http://localhost:8080/phpmyadmin)).
7. A new mailcatcher instance is accesible in [http://localhost:2525](http://localhost:2525) you can redirect your smtp traffic there using these settings inside the code of your project.
    ```
    smtp: 127.0.0.1
    port: 1025
    ```
7. Add/remove/replace files inside the `public` folder (this contains your project's files).
8. Keep this instance closed when is not in use by doing...
    ```
    vagrant halt
    ```

*By doing `vagrant ssh` you can access the ubuntu shell and do any change needed.*
