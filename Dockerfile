# Use uma versão antiga e conhecida por ter vulnerabilidades
FROM ubuntu:20.04

# Definir a variável de ambiente DEBIAN_FRONTEND para não interativo
ENV DEBIAN_FRONTEND=noninteractive

# Instalar pacotes que introduzem vulnerabilidades
RUN apt-get update && \
    apt-get install -y \
    curl \
    openssl \
    wget \
    apache2 \
    python2.7  # Python 2.7 é conhecido por ter diversas vulnerabilidades, pois não recebe mais suporte

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
