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

Ввод лицензии осуществляется через контрольную панель или вызовом класса ru.CryptoPro.JCP.tools.License с параметрами: 
ru.CryptoPro.JCP.tools.License -serial "serial_number" -company "company_name" -store

Также можно проверить заданную лицензию без ее установки: ru.CryptoPro.JCP.tools.License -serial "serial_number" -company "company_name" 

Дату первой установки можно узнать с помощью команды: ru.CryptoPro.JCP.tools.License -first 

Для вывода справки: ru.CryptoPro.JCP.tools.License ?


 Для отключения окон, предупреждающих об окончании срока разрешения на использование ключей ГОСТ Р 34.10-2001 для выработки электронной подписи, необходимо в Java Preferences в разделе ru\/Crypto/Pro\/J/C/P\tools установить параметр /Gost2001/Warning_class_default в true.
