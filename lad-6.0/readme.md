#### 6.0 



##### 6.1 Создать выделенную сеть Amazon Virtual Private Cloud 

- Создал vpc test-vpc 10.0.0.0/16
- Создал 3 subnet 
``` 
private-subnet-1 10.0.6.0/24
public-subnet-2 10.0.15.0/24
public-subnet-1 10.0.5.0/24
```
- В public-subnet-1 и public-subnet-2 установил auto-assign public IPv4 address
- Создал Internet Gateways (для того что бы инстансы были видны из интернета) 
- Создал 3 NAT Gateways (для того что бы инстансы имели доступ в интернет)
- Создал 2 Route Tables
```
Перывй route table ссоциировал с public subnet
10.0.0.0/16 local
0.0.0.0/0  igw-0781d59ec003b646c(Internet Gateway)
```

```
Второй route table ассоциировал с private subnet
10.0.0.0/16 local
0.0.0.0/0  nat-0f620e80b67735ce7(NAT Gateway)
```

-для private subnet добавил Network ACLs


 ![Image alt](https://github.com/allin58/DevOps/blob/master/lab-6.0/1.PNG)  
            
 ![Image alt](https://github.com/allin58/DevOps/blob/master/lab-6.0/ACL.PNG) 


##### 6.1.1 Создать Security Group 

 ![Image alt](https://github.com/allin58/DevOps/blob/master/lab-6.0/sg.PNG) 


##### 6.2 Сгенерировать собственный RSA ключ 

Сгенерировал файл KeyPairRSA.pem
- ssh -i "KeyPairRSA.pem" ubuntu@ec2-34-203-190-14.compute-1.amazonaws.com


##### 6.3 EC2


 ![Image alt](https://github.com/allin58/DevOps/blob/master/lab-6.0/nginx.PNG) 

##### 6.4 ELB

При принудительной остоновке одного из серверов LoadBalancer перевёл все запросы на работающий сервер.





