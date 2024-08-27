#!/bin/bash

# Atualizar o índice de pacotes
sudo apt-get update

# Instalar pacotes necessários para permitir o uso de repositórios via HTTPS
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

# Adicionar a chave GPG oficial do Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Adicionar o repositório Docker APT
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Atualizar o índice de pacotes novamente
sudo apt-get update

# Instalar o Docker Engine
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

# Adicionar o usuário atual ao grupo "docker" para permitir o uso de Docker sem sudo
sudo usermod -aG docker $USER

# Aplicar as permissões do grupo "docker" sem reiniciar
newgrp docker

# Instalar o Docker Compose
DOCKER_COMPOSE_VERSION="1.29.2"
sudo curl -L "https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Aplicar permissões executáveis ao binário do Docker Compose
sudo chmod +x /usr/local/bin/docker-compose

# Verificar as versões instaladas
docker --version
docker-compose --version

# Mensagem final
echo "Instalação do Docker e Docker Compose concluída. Se ainda encontrar problemas de permissão, por favor, faça logout e login novamente ou reinicie seu sistema para que as alterações tenham efeito."