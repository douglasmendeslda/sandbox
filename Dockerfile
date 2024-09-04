# Use uma versão antiga e vulnerável do Ubuntu
FROM ubuntu:18.04

# Instalar curl e openssl sem atualizar para versões mais recentes
RUN apt-get update && \
    apt-get install -y \
    curl=7.58.0-2ubuntu3.16 \
    openssl=1.1.1-1ubuntu2.1~18.04.20

# Criar o diretório da aplicação
RUN mkdir -p /usr/src/app

# Criar um arquivo básico de aplicação
RUN echo "Hello, this is a vulnerable image!" > /usr/src/app/index.html

# Definir o diretório de trabalho
WORKDIR /usr/src/app

# Expor uma porta para demonstração
EXPOSE 8080

# Executar um comando simples
CMD ["cat", "index.html"]
