# Monitoração
Este projeto apresenta exemplos de configuração para federação do Prometheus e uso de TLS na comunicação. 

São usados três Prometheus, com comunicação TLS entre dois deles. O Prometheus 3 simula o servidor junto aos agentes de monitoração e fornece suas métricas para o Prometheus 2. Esse, por sua vez, fornece as métricas dele e do Prometheus 3 para o Prometheus 1 através de um canal TLS. 

O canal é criptografado pelo Prometheus 2 (servidor). A configuração de TLS exige ainda que o Prometheus 1 apresente seu certificado para o Prometheus 2. Esse certificado será validado se emitido pela Autoridade Certificadora reconhecida pelo Prometheus 2. 

Prometheus1 <--TLS-- Prometheus2 <------- Prometheus 3

### Prerequisitos
- Docker
- Docker compose
- OpenSSL 1.1.1 (opcional, apenas para geração de certificados)

### Geração de certificados
**OBS:** o projeto já inclui alguns certificados que poderão ser utilizados.

Nesse exemplo, os certificados são gerados usando o OpenSSL. O script *create-ca.sh* gera o certificado e chave privada da autoridade certificadora (CA). O script *create-certificates.sh* gera certificados e chaves privadas para os Prometheus assinados pela CA.
```
$ sh create-ca.sh
$ sh create-certificates.sh
```

### Executando o projeto
Para executar o projeto, execute:
```
$ docker-compose up -d
```

Na interface web do Prometheus 1 (http://localhost:9091), as métricas de todos os componentes podem ser visualizadas. Nesse servidor, foi habilitada a autenticação básica. Utilize o usuário *rbb* e senha *rbb*.

