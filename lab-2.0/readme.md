#### 2.0 

#####  1. Установить Jenkins


#####  2. Создать новый проект Staging

Исходный код будет скачиватся с github, для того что бы jenkins мог брать этот код - нужно создать credentional.

Сгенерировал ssh пару.
- ssh-keygen
 
- public key установил на github
- private key установил на jenkins


Собиратся будет java web приложение, и деплоится на tomcat(vagrant) 
[https://github.com/allin58/finalspring](https://github.com/allin58/finalspring)

Задача по сборке запускается с параметром branch

Проект успешно скачивается с репозитория и билдится.

![Image alt](https://github.com/allin58/DevOps/blob/master/lab-2.0/1.PNG)  



#####  3. Создать задачу в Jenkins для деплоя
#####  4. Настроить зависимость задачи деплоя от задачи сборки.
#####  5. Настроить деплой артифакта

Деплой будет производится на виртуальной машине(ubuntu), на сервере tomcat.
Этот этап реализован с помощю ansible(требуется ansible plugin, crdential):
- На виртуальную машину устанавливается java, tomcat
- В папку tomcat'а копируется полученный артифакт на этапе сборки 
- Перезапуск tomcat'а


![Image alt](https://github.com/allin58/DevOps/blob/master/lab-2.0/2.PNG)  


#####  6. Добавить задачу создания бэкапа артефактов на сервере.

Для создания бекапа, решил использовать переменные окружения в playbook для ansible. Логика следующая: При выполнении jenkins скрипта, в блоке try создаётся переменная окружения file_name которая содержит путь к war файлу. 
Далее выполняется build job: "Deploy". Ansible считывает путь к файлу через переменную окружения "{{ lookup('env', 'file_name')}}". В том случае если 
произошла ошибка - выполняется блок catch, в котором переназначаем переменную окружения на бекап war файла, и выполняется build job: "Deploy".
В итоге не удалось создать переменную окружения из-под groovy скрипта.

Решил создать дополнительную job, котора будет стартовать в случае провала основной job. Для этого потребуется backup_playbook. Backup файл будет создоватся при успешном деплое в отдельной деректории.

```
try{
      
   stage('Build'){
         build job: "Staging"        //сборка
         print "Build is completed"
   }    
    
   stage('Deploy'){
         build job: "Deploy"        //при успешном деплое будет скопирован war файл в отдельную дерикторию
         print "Deploy is completed"
   }
 
}catch(err){
   stage('Backup deploy'){
         build job: "Backup_Deploy"  // деплой бекапа
         print "Backup_Deploy is completed"
   }
}
```


#####  7. Настроить пайплайн
```
pipeline {
agent any
parameters {
        string(name: 'branch', defaultValue: 'staging', description: '')
}
stages {

      stage('PullAndBuild') {
         steps {
           build job: "Staging", parameters: [string(name: "branch", value: "${branch}")]
         }
     }
        
       stage('PushAndDeploy') {
           steps {
             build job: "Deploy"
          }
      }        
    }
    }
```

![Image alt](https://github.com/allin58/DevOps/blob/master/lab-2.0/3.PNG)  


#####  8. Настроить автоматический запуск деплоя

Добавил cron для опроса репозитория каждую минуту */1 * * * *


#####  9.Создать новый проект “Production”
##### 10. Создать задачу для деплоя Production артефактов на серве
##### 11. Настроить зависимость задачи деплоя от задачи сборки
##### 12. Настроить автоматический запуск деплоя

Реализовал по аналогии с проектом Staging.
Тomcat назначает url приложению исходя из имени артифакта, для того что бы на сервере были запущены эти приложения параллельно - достаточно дать артифактам разные имена
 
Добавил выполнение shell команды после maven цели clean package:

- cd target;
- mv springvcfinal-1.0-SNAPSHOT.war springvcfinal-production.war 

Этой командой переименуется артфакт

- При деплое приложение(ветка master) доступена по url http://localhost:28080/springmvcfinal-production/
- Ветка staging доступна по url http://localhost:28080/springmvcfinal-1.0-SNAPSHOT/ 