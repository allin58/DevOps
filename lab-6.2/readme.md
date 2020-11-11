##### 6.10 Установите и настройте EB CLI 

Установка [https://github.com/aws/aws-elastic-beanstalk-cli-setup](https://github.com/aws/aws-elastic-beanstalk-cli-setup)

Настройка [https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-configuration.html](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-configuration.html)


Для создания Dockerrun.aws.json - следовал руководству [https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/create_deploy_docker_ecstutorial.html](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/create_deploy_docker_ecstutorial.html)

- eb init
- eb local run 

При локальном запуске контйенеров - получаю корректный ответ с nginx

 ![Image alt](https://github.com/allin58/DevOps/blob/master/lab-6.2/php.PNG) 


При запуске контейнеров на aws
- eb create

  ![Image alt](https://github.com/allin58/DevOps/blob/master/lab-6.2/aws.PNG) 