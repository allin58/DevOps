1.1 С помощью packer создал box: 
    vagrant init hashocorp/bionic64,
    packer build ubuntu.json

1.2 Запусти виртуальную машину:
    vagrant up,
    vagrant global-status >  статус - запущена


1.3 Устанавил требуемое ПО  через ansible(пока не получилось установить java и tomcat):
    Проверил соединение
    ansible -i hosts.txt all -m ping -u vagrant --ask-pass

  ![Image alt](https://github.com/allin58/DevOps/blob/master/lab-1.1/ping.PNG) 

    Устанавил ПО
    ansible-playbook playbook.yml -u vagrant --ask-pass

   ![Image alt](https://github.com/allin58/DevOps/blob/master/lab-1.1/15.PNG) 






![Image alt](https://github.com/allin58/DevOps/blob/master/lab-1.1/11.PNG)  

1.4 Пробросил порты, добавив в файл Vagrant  
    config.vm.network "forwarded_port", guest: 22, host: 22022
    На хосте получил ответ серверов(apch,nginx), запущенных на гостевой ОС

![Image alt](https://github.com/allin58/DevOps/blob/master/lab-1.1/1.PNG)  
    
