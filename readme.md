1.1 � ������� packer ������ box: 
    vagrant init hashocorp/bionic64,
    packer build ubuntu.json

1.2 ������� ����������� ������:
    vagrant up,
    vagrant global-status >  ������ - ��������


1.3 ��������� ��������� ��  ����� SSH �������� apt install(�� ������� ��� ������� ����� chef )
![Image alt](https://github.com/allin58/DevOps/blob/master/task1/11.PNG)  

1.4 ��������� �����, ������� � ���� Vagrant  
    config.vm.network "forwarded_port", guest: 22, host: 22022
    �� ����� ������� ����� ��������(apch,nginx), ���������� �� �������� ��

![Image alt](https://github.com/allin58/DevOps/blob/master/task1/1.PNG)  
    

  
