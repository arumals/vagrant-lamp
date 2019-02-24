# Vagrant LAMP (ubuntu/bionic64)

La intención de este projecto es poder montar un servidor LAMP (Linux+Apache+PHP+MySQL) en el menor tiempo posible con el menor número de configuración requerida, y sin la necesidad de instalar dichos componentes dentro su sistema.

Lista de componentes.

- Apache 2.4
- Python 3.6 and 2.7
- Pip 9.1
- Ruby 2.5
- MySQL 5.7
- SQlite3
- PHP 7.2
- PHPMyAdmin
- Composer
- Codeception
- Mailcatcher

Pasos para montar este stack.

1. Instalar [Virtualbox](https://www.virtualbox.org/wiki/Downloads) si no encuentra esta instalado ya en tu equipo.
2. Instalar [Vagrant](https://www.vagrantup.com/downloads.html) si no se encuentra instalado ya en tu equipo.
3. Descargar el proyecto o clonar el repositorio en un nuevo folder, y eliminar el directorio *.git*.
    ```
    git clone git@github.com:arumals/vagrant-lamp.git project-name
    cd project-name
    rm -rf .git
    ```
4. Inicializar el servidor *vagrant up*, y esperar a que termine todo el proceso.
5. Abrir el la dirección [http://localhost:8080](http://localhost:8080) y verás el mensaje "Hello World".
6. Accede a phpmyadmin mediante la direccion [http://localhost:8080/phpmyadmin](http://localhost:8080/phpmyadmin), con el usuario *root* y el password *root*.
7. Accede a mailcatcher a traves de la dirección [http://localhost:2525](http://localhost:2525) el cual captura todo el correo electrónico saliente configurando tu salida de correo de la siguiente forma...
    ```
    smtp: 127.0.0.1
    port: 1025
    ```
7. Agrega remueve o actualiza los archivos dentro del directorio *public* (este contiene los archivos de tu proyecto).
8. Para detener el servidor lamp, basta ejecutar el comando *halt* y esto liberará todos los recursos utilizados...
    ```
    vagrant halt
    ```

*Si deseas accesar al servidor y realizar modificaciones internas, utiliza `vagrant ssh`*.
