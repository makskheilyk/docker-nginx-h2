Nginx

Step 1

Создадим сертификат для localhost

bash conf/tls/create-cert.sh

Необходимо в файле conf/tls/create-cert.sh заменить localhost.csr и localhost.key на имя вашего сайта. Пример kheilyk.csr kheilyk.key.

Step 2

Необходимо в файле conf/conf.d/default.conf заменить domain.tld на имя вашего сайта

Step 2

Построить образ
docker-compose build

Развернуть образ
docker-compose up -d



https://localhost/