#!/bin/bash

# Caminho para a pasta de DAGs
DAGS_DIR=/home/linhares/airflow/dbt/athena_dbt

# Verifica se a pasta de DAGs já existe
if [ -d "$DAGS_DIR" ]; then
  # Se a pasta existe, entra nela e atualiza o repositório
  cd "$DAGS_DIR"
  git pull origin main
else
  # Se a pasta não existe, clona o repositório
  git clone git@github.com:Linhares015/athena_dbt.git "$DAGS_DIR"
fi