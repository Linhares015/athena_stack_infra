Para configurar o Grafana como seu monitor principal usando o cAdvisor e o Prometheus para coletar métricas de CPU, memória, quantidade de containers e uso por container, siga os passos abaixo:


1. **Adicione a fonte de dados Prometheus:**
   - Acesse o Grafana em `http://localhost:3000` e faça login (usuário padrão: `admin`, senha padrão: `admin`).
   - Vá para **Configuration** > **Data Sources** > **Add data source**.
   - Selecione **Prometheus**.
   - Configure a URL para o Prometheus (por exemplo, `http://<PROMETHEUS_HOST>:9090`).
   - Clique em **Save & Test** para garantir que a configuração está correta.

### Passo 4: Personalizar os Indicadores

1. **Criar Painéis Personalizados:**
   - Crie novos painéis conforme necessário em **Dashboards** > **New Dashboard** > **Add new panel**.
   - Use as consultas Prometheus para criar gráficos de CPU, memória, quantidade de containers, uso por container, etc. Aqui estão algumas consultas úteis:

     - **Uso de CPU por Container:**
       ```promql
       rate(container_cpu_usage_seconds_total{image!=""}[1m])
       ```
     
     - **Uso de Memória por Container:**
       ```promql
       container_memory_usage_bytes{image!=""}
       ```

     - **Quantidade de Containers:**
       ```promql
       count(container_memory_usage_bytes{image!=""})
       ```

     - **Uso de Disco por Container:**
       ```promql
       container_fs_usage_bytes{image!=""}
       ```

     - **Uso de CPU do Host:**
       ```promql
       100 - (avg by (instance) (irate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)
       ```
     
     - **Uso de Memória do Host:**
       ```promql
      node_memory_MemTotal_bytes - node_memory_MemAvailable_bytes
       ```
### Passo 5: Monitoramento e Alertas

1. **Configurar Alertas:**
   - Vá para **Alerting** > **Notification channels** para configurar canais de notificação (e-mail, Slack, etc.).
   - Adicione alertas aos seus painéis configurando regras de alerta e notificações para condições específicas.

Seguindo esses passos, você terá um sistema de monitoramento robusto com o Grafana exibindo métricas coletadas pelo cAdvisor e Prometheus, permitindo uma visualização detalhada do desempenho dos seus containers e do servidor.