#### 3.0 

В этом задании буду использовать ssh-key.

Генерация RSA пары :
- ssh-keygen

Отправка public-key на сервер:
- ssh-copy-id vagrant@10.0.2.2 -p 22022

Созданно 3 виртуальных машины:
- ab-haproxy
- ab-logstash
- ab-webui

Требуемое ПО, на все сервера, устанавливается посредством ansible.

На каждый из серверов установлен ntp, который раз в сутки обновляет время(конфигурация cron'а установлена через ansible)

Так же на каждом из серверов установлен monit:
- на ab-haproxy следит за haproxy 
- на ab-logstash следит за elasticsearch
- на ab-webui следит за nginx

Monit делает http запрос, если ответа нету то сервис перезапускается.


Последовательность работы ELK
![Image alt](https://github.com/allin58/DevOps/blob/master/lab-3.0/2.PNG)  



Для отладки - использовал команды
- nc -l 514 (шлёт ли лог rsyslog на ab-logstash)
- curl -X GET localhost:9200/_aliases?pretty (принимает ли сообщения elasticsearch от logstash)



Когда удалось подружить kibana и elasticsearch
![Image alt](https://github.com/allin58/DevOps/blob/master/lab-3.0/kibana.PNG) 