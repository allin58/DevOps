﻿#### 4.0 

##### 1.1.1 Точное количество выполняемых процессов в системе (доступных под текущим пользователем)
- expr $(ps -u $(whoami) | wc -l) - 1 

##### 1.1.2. Загрузка CPU в %
- ps aux | awk '{s += $3} END {print s "%"}'

{s += $3} - сумма третих полей


##### 1.1.3. Объем доступной оперативной памяти (в байтах или МБ)

- free -m | awk '{if($1) == "Память:" print $3 " Мб"}'


##### 1.1.4. Количество установленных соединений по произвольному порту (например, 80, 22, 443) на вашем компьютере (т.е. «кто подключился к вам»). Порт задается параметром запуска.

- netstat -npt | grep :22 | wc -l


##### 1.2.1. Написать скрипт, который рандомно сгенерирует на диске структуру файлов и папок.
             Скрипт находится в папке с заданием - create_dir.sh
      - ./crate_dr.sh /tmp/folder 4 10 25       
             








