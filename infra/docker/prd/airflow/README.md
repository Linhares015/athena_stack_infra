# Subir o Airflow

- Primeiro passo mova o arquivo `docker-compose.yml` para a pasta onde você deseja subir o Airflow, eu recomendo que seja na pasta `home/seu user/`.

- Segundo vamos iniciar o webserver do Airflow, para isso execute o comando abaixo:

```bash
docker-compose run --rm webserver airflow db init
```

- Terceiro vamos criar o usuário para acessar o Airflow, execute o comando abaixo:

```bash
docker-compose run --rm webserver airflow users create \
  --username admin \
  --password admin \
  --firstname Admin \
  --lastname User \
  --role Admin \
  --email admin@example.com
```

- Quarto vamos iniciar o Airflow, execute o comando abaixo:

```bash
docker-compose up -d #caso queira ver os logs execute o comando sem o -d
```

- Quinto de permissão nas pastas do Airflow, execute o comando abaixo:

```bash
sudo chmod -R 777 ./dags ./logs ./plugins
```

- Sexto acesse o Airflow no seu navegador, o endereço é `http://localhost:8080/` e faça login com o usuário e senha que você criou. 

Caso você tenha subido o Airflow em outro lugar, substitua o `localhost` pelo endereço que você subiu o Airflow.

Você também pode criar um túnel, caso você esteja usando o VScode acessando a outra maquina com ele execute o comando abaixo:

```bash
curl http://localhost:8080/
```

- Pronto, agora você já pode começar a criar seus DAGs e executar suas tarefas.

# Fazendo o gitsync com nosso repositório via shell script

- Primeiro acesse o arquivo `update_dags.sh` e mude a linha 4 com o endereço da pasta dags do airflow.

- Segundo mude a linha 13 para o endereço do seu repositório.

- Terceiro vai depende se você quer usar o crontab do linux ou o scheduler do Airflow, caso queira usar o crontab execute o comando abaixo:

```bash
crontab -e
```

- Quarto adicione a linha abaixo no final do arquivo:

```bash
*/3 * * * * /caminho/do/arquivo/update_dags.sh #isso vai executar o script a cada 3 minutos
```

- Quinto salve o arquivo e reinicie o crontab com o comando abaixo:

```bash
sudo service cron restart
```

# Exemplo de DAG para Airbyte

```python
from datetime import timedelta
from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from airflow.utils.dates import days_ago
import requests
from requests.auth import HTTPBasicAuth
import logging
import time

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

def trigger_airbyte_crypto():
    airbyte_connection_id = '3ad7e960-3179-45fd-8e2c-823344469abb'
    airbyte_crypto_url = 'http://192.168.1.37:8001/api/v1/connections/sync'
    airbyte_job_status_url = 'http://192.168.1.37:8001/api/v1/jobs/get'
    headers = {'Content-Type': 'application/json'}
    payload = {'connectionId': airbyte_connection_id}
    
    auth = HTTPBasicAuth('airbyte', 'password')
    
    response = requests.post(airbyte_crypto_url, headers=headers, json=payload, auth=auth)
    response.raise_for_status()
    
    job_id = response.json()['job']['id']
    logging.info('Airbyte sync job started: %s', job_id)
    
    timeout = 3600
    check_interval = 3
    elapsed_time = 0
    
    while elapsed_time < timeout:
        job_status_response = requests.post(airbyte_job_status_url, headers=headers, json={'id': job_id}, auth=auth)
        job_status_response.raise_for_status()
        job_status = job_status_response.json()['job']['status']
        
        if job_status == 'succeeded':
            logging.info('Airbyte sync succeeded: %s', job_status_response.json())
            return {'job_id': job_id, 'status': 'succeeded'}
        elif job_status == 'failed':
            logging.error('Airbyte sync failed: %s', job_status_response.json())
            raise Exception('Airbyte sync failed')
        else:
            logging.info('Airbyte sync in progress: %s', job_status)
            time.sleep(check_interval)
            elapsed_time += check_interval
    
    raise Exception('Airbyte sync timed out')

with DAG(
    'airbyte_crypto_dag',
    default_args=default_args,
    description='DAG to trigger Airbyte sync',
    schedule_interval=timedelta(days=1),
    start_date=days_ago(1),
    tags=['airbyte','Postgres_DW','crypto_data'],
) as dag:

    run_airbyte_crypto = PythonOperator(
        task_id='run_airbyte_crypto',
        python_callable=trigger_airbyte_crypto,
    )

    run_airbyte_crypto
```


## Repo de exemplo das DAGS com o cosmos para DBT

https://github.com/astronomer/cosmos-demo