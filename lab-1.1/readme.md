1.1 � ������� packer ������ box: 
    vagrant init hashocorp/bionic64,
    packer build ubuntu.json

1.2 ������� ����������� ������:
    vagrant up,
    vagrant global-status >  ������ - ��������


1.3 ��������� ��������� ��  ����� ansible(���� �� ���������� ���������� java � tomcat):
    �������� ����������
    ansible -i hosts.txt all -m ping -u vagrant --ask-pass

  ![Image alt](https://github.com/allin58/DevOps/blob/master/lab-1.1/ping.PNG) 

    ��������� ��
    ansible-playbook playbook.yml -u vagrant --ask-pass

   ![Image alt](https://github.com/allin58/DevOps/blob/master/lab-1.1/15.PNG) 






![Image alt](https://github.com/allin58/DevOps/blob/master/lab-1.1/11.PNG)  

1.4 ��������� �����, ������� � ���� Vagrant  
    config.vm.network "forwarded_port", guest: 22, host: 22022
    �� ����� ������� ����� ��������(apch,nginx), ���������� �� �������� ��

![Image alt](https://github.com/allin58/DevOps/blob/master/lab-1.1/1.PNG)  
    

  
  
1.7 ��������� docker - curl -fsSL get.docker.com -o get-docker.sh , sh get-docker.sh
    ������ nginx - docker pull nginx:latest
    �������� nginx - docker run -d -p 8080:80 -v $PWD/nginx/etc:/etc/nginx/ --name my-nginx nginx .
    ��������� �������� - docker stop my-nginx .
    
    
    
    
    
     
     
     
      
      
