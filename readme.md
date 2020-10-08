1.1 С помощью packer создал box: 
    vagrant init hashocorp/bionic64,
    packer build ubuntu.json

1.2 Запусти виртуальную машину:
    vagrant up,
    vagrant global-status >  статус - запущена


1.3 Устанавил требуемое ПО  через SSH командой apt install(не удалось это сделать через chef )
![Image alt](https://github.com/allin58/DevOps/blob/master/task1/11.PNG)  

1.4 Пробросил порты, добавив в файл Vagrant  
    config.vm.network "forwarded_port", guest: 22, host: 22022
    На хосте получил ответ серверов(apch,nginx), запущенных на гостевой ОС

![Image alt](https://github.com/allin58/DevOps/blob/master/task1/1.PNG)  
    

  
