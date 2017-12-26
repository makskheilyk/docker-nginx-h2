#!/bin/bash

mkdir private
mkdir certs

# Create CA private key.
openssl genrsa -out private/ca.key 2048
# Create CA certificate for signing client certificates.
openssl req -x509 -config openssl.cnf -new -nodes -key private/ca.key -sha256 -days 1024 -out certs/ca.cert.pem
# Создадим приватный ключ Client SSL сертификата
openssl genrsa -out private/localhost.key 2048
# Создадим запрос на подпись для нашего Client SSL ключа
openssl req -config openssl.cnf -new -key private/localhost.key -out certs/localhost.csr
# Создадим Client SSL сертификат, подписанный нашим CA SSL сертификатом
openssl x509 -req -in certs/localhost.csr -CA certs/ca.cert.pem -CAkey private/ca.key -CAcreateserial -out certs/localhost.crt -days 1024 -sha256
# Можно также посмотреть информацию о созданных приватных ключах, например ключ CA сертификата
openssl x509 -noout -text -in certs/ca.cert.pem
# Можно также посмотреть что Client SSL сертификат валидно подписан CA SSL сертификатом
openssl verify -CAfile certs/ca.cert.pem certs/localhost.crt