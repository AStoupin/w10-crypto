# WildFly 10 docker with CryptoPro image

Installed components
- Oracle Java 8
- WildFly 10
- jcp20+jtls

Usefull scripts
to bulid
docker build -t wf10-crypto .
to run 
docker run -d  wf10-crypto 

to run bash in interactive mode and root params
docker exec -u:0 -it container_num /bin/bash

debug mode
docker run -it --entrypoint=/bin/bash  wf10-crypto

Usefull CryptoPro commands

���� �������� �������������� ����� ����������� ������ ��� ������� ������ ru.CryptoPro.JCP.tools.License � �����������: 
ru.CryptoPro.JCP.tools.License -serial "serial_number" -company "company_name" -store

����� ����� ��������� �������� �������� ��� �� ���������: ru.CryptoPro.JCP.tools.License -serial "serial_number" -company "company_name" 

���� ������ ��������� ����� ������ � ������� �������: ru.CryptoPro.JCP.tools.License -first 

��� ������ �������: ru.CryptoPro.JCP.tools.License ?


 ��� ���������� ����, ��������������� �� ��������� ����� ���������� �� ������������� ������ ���� � 34.10-2001 ��� ��������� ����������� �������, ���������� � Java Preferences � ������� ru\/Crypto/Pro\/J/C/P\tools ���������� �������� /Gost2001/Warning_class_default � true.
