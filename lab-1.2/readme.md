 
1.7 Установил docker - curl -fsSL get.docker.com -o get-docker.sh , sh get-docker.sh
    Скачал образ с nginx - docker pull nginx:latest
    Что бы docker использовать без sudo: 
    sudo usermod -aG docker $USER,
    su - ${USER}
    Запустил nginx - docker run -d -p 8080:80 -v $PWD/nginx/etc:/etc/nginx/ --name my-nginx nginx .
    Остановил контенер - docker stop my-nginx

![Image alt](https://github.com/allin58/DevOps/blob/master/lab-1.2/65.PNG)  

1.8 Создал Dockerfile
    docker build -t apachimage . 
    docker run -it -p 8081:80 --name apache2 -h allin5885 apachimage bash  
    Создал папки 
    mkdir web
    cd web
    mkdir etc
    mkdir www
    
![Image alt](https://github.com/allin58/DevOps/blob/master/lab-1.2/1.PNG)  


    Остановил контенер
    docker stop apache2
    
    Закомитил контенер в образ
    docker commit apach2 allin5885/apache2
    docker push allin5885/apache2

    Ссылка на dockerhub
    https://hub.docker.com/repository/docker/allin5885/apache2 

    
   
1.9 Создал docker-compose файл. В нем объявлены три сервиса: nginx, apach, db
    Nginx и db создаются с dockerhub образов. Apache контенер создаётся на основе Dockerfile.
    Установленна следующая связь между контенерами nginx(balancer)>>apache>>db
    Запуск контенеров:
    docker-compose up
    Для nginx проброшен порт 80:8080. Запросы направленные на порт 8080 будут 
    перенаправлены на apache сервис. 
       
   ![Image alt](https://github.com/allin58/DevOps/blob/master/lab-1.2/apache.PNG)   

   Для проверки соединения apache>>db, подсоединился к рабочему контенеру:
   docker-compose exec web /bin/bash 
   И соеденился с базой данных через link, указанный в docker-compose файле 
   telnet database 3306
   
   ![Image alt](https://github.com/allin58/DevOps/blob/master/lab-1.2/db.PNG)   
    
    
    
     
     
     
      
      
