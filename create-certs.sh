#! /bin/bash

# Cria certificados para o Prometheus 1
#config="$(cat /etc/ssl/openssl.cnf) $(printf "\n[SAN]\nsubjectAltName=DNS:localhost,DNS:prometheus1.rbb.gov.br")"
ext="$(printf "[v3]\nsubjectAltName=DNS:localhost,DNS:prometheus1.rbb.gov.br")"
echo "$ext" > certs/ext.cnf

openssl req \
    -passout pass:abcd \
    -subj "/C=BR/ST=MG/L=Belo Horizonte/O=Prodemge/OU=Prodemge RBB/CN=Prometheus 1/emailAddress=caleo@prodemge.gov.br" \
    -new \
    -out certs/prometheus1.cert.csr

mv privkey.pem certs/prometheus1.privkey.pem

openssl rsa -passin pass:abcd -in certs/prometheus1.privkey.pem -out certs/rbb.prometheus1.key

openssl x509 -req \
    -in certs/prometheus1.cert.csr \
    -out certs/rbb.prometheus1.cert \
    -CA certs/rbb.ca.cert \
    -CAkey certs/rbb.ca.key \
    -CAcreateserial \
    -days 365 \
    -extensions v3 \
    -extfile certs/ext.cnf

# Cria certificados para o Prometheus 2
ext="$(printf "[v3]\nsubjectAltName=DNS:localhost,DNS:prometheus2.rbb.gov.br")"
echo "$ext" > certs/ext.cnf

openssl req \
    -passout pass:abcd \
    -subj "/C=BR/ST=MG/L=Belo Horizonte/O=Prodemge/OU=Prodemge RBB/CN=Prometheus 2/emailAddress=caleo@prodemge.gov.br" \
    -new \
    -out certs/prometheus2.cert.csr

mv privkey.pem certs/prometheus2.privkey.pem

openssl rsa -passin pass:abcd -in certs/prometheus2.privkey.pem -out certs/rbb.prometheus2.key

openssl x509 -req \
    -in certs/prometheus2.cert.csr \
    -out certs/rbb.prometheus2.cert \
    -CA certs/rbb.ca.cert \
    -CAkey certs/rbb.ca.key \
    -CAcreateserial \
    -days 365 \
    -extensions v3 \
    -extfile certs/ext.cnf

# Cria certificados para o Prometheus 3
ext="$(printf "[v3]\nsubjectAltName=DNS:localhost,DNS:prometheus3.rbb.gov.br")"
echo "$ext" > certs/ext.cnf

openssl req \
    -passout pass:abcd \
    -subj "/C=BR/ST=MG/L=Belo Horizonte/O=Prodemge/OU=Prodemge RBB/CN=Prometheus 3/emailAddress=caleo@prodemge.gov.br" \
    -new \
    -out certs/prometheus3.cert.csr

mv privkey.pem certs/prometheus3.privkey.pem

openssl rsa -passin pass:abcd -in certs/prometheus3.privkey.pem -out certs/rbb.prometheus3.key

openssl x509 -req \
    -in certs/prometheus3.cert.csr \
    -out certs/rbb.prometheus3.cert \
    -CA certs/rbb.ca.cert \
    -CAkey certs/rbb.ca.key \
    -CAcreateserial \
    -days 365 \
    -extensions v3 \
    -extfile certs/ext.cnf

rm certs/ext.cnf

cp certs/rbb.prometheus1.cert prometheus1/tls/
cp certs/rbb.prometheus1.key  prometheus1/tls/

cp certs/rbb.prometheus2.cert prometheus2/tls/
cp certs/rbb.prometheus2.key  prometheus2/tls/

cp certs/rbb.prometheus3.cert prometheus3/tls/
cp certs/rbb.prometheus3.key  prometheus3/tls/