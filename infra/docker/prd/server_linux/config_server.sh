#!/bin/bash

# Atualizar a lista de pacotes
sudo apt-get update

# Atualizar todos os pacotes instalados
sudo apt-get upgrade -y

# Descobrir a interface de rede automaticamente
INTERFACE=$(ip -o -4 route show to default | awk '{print $5}')

# Verificar se a interface foi encontrada
if [ -z "$INTERFACE" ]; then
  echo "Não foi possível determinar a interface de rede."
  exit 1
fi

# Obter informações da rede atual
CURRENT_IP=$(ip -o -4 addr list $INTERFACE | awk '{print $4}' | cut -d/ -f1)
GATEWAY=$(ip -4 route | grep default | awk '{print $3}')
DNS_SERVERS="8.8.8.8, 8.8.4.4"  # Usando DNS público do Google

# Determinar o novo endereço IP estático (adicionando 1 ao último octeto)
IFS='.' read -r i1 i2 i3 i4 <<< "$CURRENT_IP"
STATIC_IP="$i1.$i2.$i3.$((i4 + 1))"

# Configurar IP estático
cat <<EOF | sudo tee /etc/netplan/01-netcfg.yaml
network:
  version: 2
  ethernets:
    $INTERFACE:
      addresses:
        - $STATIC_IP/24
      gateway4: $GATEWAY
      nameservers:
        addresses:
          - $DNS_SERVERS
EOF

# Aplicar as configurações de rede
sudo netplan apply

# Desativar todos os firewalls
sudo ufw disable

# Abrir todas as portas no firewall (caso algum firewall adicional esteja configurado)
sudo iptables -F

echo "Script executado com sucesso. O servidor foi atualizado, o IP foi configurado como estático e todos os firewalls foram desativados."