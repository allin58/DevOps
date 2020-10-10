 
1.7 Установил docker - curl -fsSL get.docker.com -o get-docker.sh , sh get-docker.sh
    Скачал образ с nginx - docker pull nginx:latest
    Что бы docker использовать без sudo: 
    sudo usermod -aG docker $USER,
    su - ${USER}
    Запустил nginx - docker run -d -p 8080:80 -v $PWD/nginx/etc:/etc/nginx/ --name my-nginx nginx .
    Остановил контенер - docker stop my-nginx .


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

    
   

    
    
    
    
    
     
     
     
      
      
