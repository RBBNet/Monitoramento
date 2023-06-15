# https://www.ibm.com/docs/en/rstfsq/9.2.1?topic=overview-creating-digital-certificate-openssl

openssl req \
    -passout pass:abcdefg \
    -subj "/C=BR/ST=MG/L=Belo Horizonte/O=Prodemge/OU=Prodemge RBB/CN=Comite Tecnico da RBB/emailAddress=caleo@prodemge.gov.br" \
    -new > certs/rbb.ca.cert.csr

mv privkey.pem certs/ca.privkey.pem

openssl rsa -passin pass:abcdefg -in certs/ca.privkey.pem -out certs/rbb.ca.key

openssl x509 -in certs/rbb.ca.cert.csr -out certs/rbb.ca.cert -req -signkey certs/rbb.ca.key -days 365

cp certs/rbb.ca.cert prometheus1/tls/
cp certs/rbb.ca.cert prometheus2/tls/
cp certs/rbb.ca.cert prometheus3/tls/
