#### 5

##### 5.1.1 Установить apache

В дериктории var/www/sitename.com/html создал index.html.
Добавил конфигурацию /etc/apache2/sites-available/sitename.com.conf
Активировал новый профиль
- sudo a2ensite sitename.com.conf

Диактивировал дефолтный профиль 
- sudo a2dissite 000-default.conf


Далее проверил настройки на наличие ошибок 
- sudo apache2ctl configtest

Перезапустил Apache
- sudo systemctl restart apache2
 
Модифицировал host-файл, добавил строчку в etc/hosts 127.0.0.1  sitename.com
Новая конфигурация host-файла не вступала в силу пока не перезагрузил.



##### 5.1.2. Установить php версии 5.2

Использовал мануал [http://tokarchuk.ru/2016/03/php-5-2-on-ubuntu-14-04/](http://tokarchuk.ru/2016/03/php-5-2-on-ubuntu-14-04/)

- sudo apt-get install libxml2-dev libmysqlclient-dev libcurl4-gnutls-dev 
libjpeg62-dev make libxslt1-dev libbz2-dev libmcrypt-dev libmhash-dev libfcgi-dev libmhash-dev checkinstall

libpng12-dev устонавливал отдельно
- sudo apt-get install -y libpng12-dev

Сделел симлинки на so-шники 
- ln -s /usr/lib/x86_64-linux-gnu/libjpeg.so.62.0.0 /usr/lib/libjpeg.so
- ln -s /snap/core/7270/lib/x86_64-linux-gnu/libpng12.so.0.54.0 /usr/lib/libpng.so
- ln -s /usr/lib/x86_64-linux-gnu/libmysqlclient.so.20.3.18 /usr/lib/libmysqlclient.so

Пути к libpng12.so нашел через 
-locate libpng12

- ./configure --prefix=/opt/php5.2 
--with-config-file-path=/opt/php5.2 
--with-mysqli 
--with-mysql 
--with-curl 
--with-gd 
--with-jpeg-dir 
--enable-cli 
--enable-fastcgi 
--enable-discard-path 
--enable-force-cgi-redirect 
--enable-mbstring 
--with-mcrypt

Появилась ошибка: error: Please reinstall the libcurl distribution 
Решение:
- cd /usr/local/include sudo ln -s /usr/include/x86_64-linux-gnu/curl curl
sudo apt-get install libcurl4-gnutls-dev

Наложил патч:
- wget https://mail.gnome.org/archives/xml/2012-August/txtbgxGXAvz4N.txt
- patch -p0 -b < txtbgxGXAvz4N.txt
- make

Появилась ошибка: mysqli: undeffined reference to 'client_errors'
Решение:
[https://stackoverflow.com/questions/20266246/unable-to-compile-php-5-2-with-mysqli-extension](https://stackoverflow.com/questions/20266246/unable-to-compile-php-5-2-with-mysqli-extension)
- sudo wget http://launchpadlibrarian.net/212189147/libmysqlclient-dev_5.6.25-0ubuntu1_amd64.deb
- sudo dpkg -i libmysqlclient-dev_5.6.25-0ubuntu1_amd64.deb
- wget http://launchpadlibrarian.net/212189159/libmysqlclient18_5.6.25-0ubuntu1_amd64.deb
- sudo dpkg -i libmysqlclient18_5.6.25-0ubuntu1_amd64.deb

- make
- checkinstall

Выставил права на директорию:
- chmod ugo+rX -R /opt/php5.2/

Добавил модуль fcgi
- wget https://mirrors.edge.kernel.org/ubuntu/pool/multiverse/liba/libapache-mod-fastcgi/libapache2-mod-fastcgi_2.4.7~0910052141-1.2_amd64.deb
- sudo dpkg -i libapache2-mod-fastcgi_2.4.7~0910052141-1.2_amd64.deb


Создал /var/www/cgi-bin/php52.fcg

В файл /etc/apache2/sites-avaliable/sitename.com.conf добавил
```
ScriptAlias /cgi-bin/ "/var/www/cgi-bin/"
AddType application/x-httpd-php .php
Action application/x-httpd-php /cgi-bin/php52.fcgi
```

- a2enmod action
- sudo service apache2 restart

![Image alt](https://github.com/allin58/DevOps/blob/master/lab-5.0/php.PNG) 


##### 5.1.3 Установить nginx

Nginx сконфигурировал через файл nginx.conf. В него добавлена следующая логика:
- если запрашивается файл с расширением php, то запрос перенаправляется на apache
- если запрашивается файл с расширением (css|js|txt|jpg), то файл отдаёт сам nginx



![Image alt](https://github.com/allin58/DevOps/blob/master/lab-5.0/testtxt.PNG) 

![Image alt](https://github.com/allin58/DevOps/blob/master/lab-5.0/testphp.PNG) 


##### 5.1.4 Сгенерировать SSL-сертификат

Создал ключ и сертификат
- openssl req -new -x509 -days 30 -keyout server.key -out server.pem

Снял пароль с ключа 
- cp server.key{,.orig}
- openssl rsa -in server.key.orig -out server.key
- rm server.key.orig

Скопировал в /etc/ssl
- sudo cp server.pem /etc/ssl/certs/
- sudo cp server.key /etc/ssl/private/
- sudo chmod 0600 /etc/ssl/private/server.key



Активировать mod_ssl:
- sudo a2enmod ssl

В файле  /etc/apache2/sites-enabled/sitename.com.conf добавил строчки
```
-SSLEngine on
-SSLProtocol all -SSLv2
-SSLCertificateFile    /etc/ssl/certs/server.pem
-SSLCertificateKeyFile /etc/ssl/private/server.key
```

Перезапустил Apache

- sudo service apache2 restart

В nginx.conf proxy_pass установил https
![Image alt](https://github.com/allin58/DevOps/blob/master/lab-5.0/ssl.PNG) 


- sudo service nginx restart