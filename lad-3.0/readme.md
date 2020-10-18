#### 3.0 

В этом задании буду использовать ssh-key.

Генерация RSA пары :
- ssh-keygen

Отправка public-key на сервер:
- ssh-copy-id vagrant@10.0.2.2 -p 22022

##### ad-proxy

- ansible-galaxy init ntp

   Для конфигурации ntp создал файл ntp.conf, добавил в него строчку 
"server europe.pool.ntp.org minpoll 12 maxppol 17"(примерно раз в сутки будет происходить синхронизация времени).
Этот фаил скопировал на сервер в папку /etc.
Добавил hendler для перезапуска ntp.


- За основу haproxy - была взята роль https://galaxy.ansible.com/geerlingguy/haproxy


- ansible-galaxy init monit
 
  Для конфигурации monit создал файл haproxy, в нем определил сценарий работы monit (if failed host 127.0.0.1 port 80 protocol http for 1 cycles then restart) т.е. если сервер не отвечает то haproxy перезапускается).
Этот файл скопирован в /etc/monit/conf.d.
Добавил hendler для перезапуска monit.



- Ini файл генерируется следующим образом
```yaml
   tasks: 
   - name: Creating ini file
     ini_file:
       path: /etc/ini_file.txt
       section: general
       option: uniqueID  
       value: "{{ 1000 | random | to_uuid | upper }}" 
``` 










