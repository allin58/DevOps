#### 1.1 
С помощью packer создал box: 

   - vagrant init hashocorp/bionic64,
    
  -  packer build ubuntu.json

#### 1.2 
Запусти виртуальную машину:

   - vagrant up
    
   - vagrant global-status >  статус - запущена


#### 1.3 
Устанавил требуемое ПО

 Проверил соединение
 - ansible -i hosts.txt all -m ping -u vagrant --ask-pass

  ![Image alt](https://github.com/allin58/DevOps/blob/master/lab-1.1/ping.PNG) 

    
    Для установки JDK использовал роль - https://galaxy.ansible.com/srsp/oracle-java
    
   - ansible-galaxy install srsp.oracle-java -p ./roles
    
   в папку roles/srsp.orale-java/files скачал jdk-8u201-linux-x64.tar.gz


    Для установки TomCat использовал роль - https://galaxy.ansible.com/flxpeters/tomcat8
 - ansible-galaxy install flxpeters.tomcat8 -p ./roles
     
 - ansible-playbook playbook.yml -u vagrant --ask-pass



   ![Image alt](https://github.com/allin58/DevOps/blob/master/lab-1.1/15.PNG) 






   ![Image alt](https://github.com/allin58/DevOps/blob/master/lab-1.1/11.PNG)  

#### 1.4 
Пробросил порты, добавив в файл Vagrant  

   - config.vm.network "forwarded_port", guest: 22, host: 22022
    
    На хосте получил ответ серверов(apch,nginx), запущенных на гостевой ОС

   ![Image alt](https://github.com/allin58/DevOps/blob/master/lab-1.1/1.PNG) 
  
