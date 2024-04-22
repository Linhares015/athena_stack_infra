# Projeto Athena - Evolução de uma Stack de Dados 🧙‍♂️

## Menu

- [Stack Inicial](#stack-inicial)
- [Stack de Dados Evoluída - Nivel 1](#stack-de-dados-evoluída---nivel-1)
- [Aulas do Projeto Athena | N1 | YouTube](#aulas-do-projeto-athena--n1--youtube)
- [Arquivos - Nível 1](#arquivos---nível-1)
- [Stack de Dados Evoluída - Nivel 2](#stack-de-dados-evoluída---nivel-2)
- [Aulas do Projeto Athena | N2 | YouTube](#aulas-do-projeto-athena--n2--youtube)


## Stack Inicial

### Introdução

O projeto Athena é um projeto de evolução de uma stack de dados. A stack de dados é um conjunto de ferramentas e tecnologias que são utilizadas para a ingestão, armazenamento, processamento e visualização de dados. A stack de dados inicial será baseada na que muitas empresas usam no seu dia a dia e a mesma que muitos profissionais de dados aprendem a utilizar. A stack de dados inicial é composta por:

- Excel como origem de dados;
- Power Query como ferramenta de ingestão de dados;
- Power Query como ferramenta de transformação de dados;
- Power Query como ferramenta de carga de dados;
- Power BI como ferramenta de visualização de dados.

<p align="center">
  <img src="img/1.png" width="800" height="450">
</p>

### Desvantagens

Apesar dessa ser na maioria das vezes a stack de dados inicial de muitas empresas e analistas de dados, ela possui algumas desvantagens:

- **Excel como origem de dados**: O Excel é uma ferramenta muito poderosa e versátil, mas não é a melhor ferramenta para armazenar dados. O Excel não é um banco de dados e não foi feito para armazenar grandes volumes de dados. Além disso, o Excel não é uma ferramenta colaborativa, o que dificulta o compartilhamento de dados entre os membros da equipe.

- **Power Query como ferramenta de ingestão de dados**: O Power Query é uma ferramenta muito poderosa e versátil, mas não é a melhor ferramenta para a ingestão de dados. O Power Query não foi feito para lidar com grandes volumes de dados e não é uma ferramenta colaborativa.

- **Power Query como ferramenta de transformação de dados**: Apesar de ter bastante poder de transformação de dados e ser fácil de usar, o Power Query não é a melhor ferramenta para a transformação de dados. O mesmo não foi feito para lidar com grandes volumes de dados além de não possuir versionamento de código, deixar todo o processo na ferramenta e não permitir a reutilização de código. Tudo isso gera uma divida técnica muito grande, para o time de dados.

- **Power Query como ferramenta de carga de dados**: O Power Query não é a melhor ferramenta para a carga de dados.

- **Power BI como ferramenta de visualização de dados**: O Power BI é uma ferramenta muito poderosa e versátil para a visualização de dados, e é ai que ele deve ser utilizado.

## Stack de Dados Evoluída - Nivel 1
[Topo ⤴︎](#menu)

A stack de dados evoluída é composta por:

- Excel como origem de dados;
- Apache Hop como ferramenta de ingestão de dados;
- PostgreSQL como banco de dados (Data Warehouse);
- Apache Hop como ferramenta de transformação de dados;
- Apache Hop como ferramenta de carga de dados;
- Power BI como ferramenta de visualização de dados.

<p align="center">
  <img src="img/2.png" width="800" height="450">
</p>

### Vantagens

A stack de dados evoluída possui várias vantagens em relação a stack de dados inicial:

- **Excel como origem de dados**: O Excel é uma ferramenta muito poderosa e versátil, e é muito utilizada como origem de dados. A stack de dados evoluída mantém o Excel como origem de dados, mas utiliza o Apache Hop para fazer a ingestão dos dados.

- **Apache Hop como ferramenta de ingestão de dados**: O Apache Hop é uma ferramenta muito poderosa e versátil para a ingestão de dados. O Apache Hop foi feito para lidar com grandes volumes de dados e é uma ferramenta colaborativa.

- **PostgreSQL como banco de dados (Data Warehouse)**: O PostgreSQL é um banco de dados muito poderoso e versátil, e é muito utilizado como Data Warehouse. O PostgreSQL foi feito para lidar com grandes volumes de dados e é uma ferramenta colaborativa.

- **Apache Hop como ferramenta de transformação de dados**: O Apache Hop é uma ferramenta muito poderosa e versátil para a transformação de dados. O Apache Hop foi feito para lidar com grandes volumes de dados e possui versionamento de código, permitindo a reutilização de código.

- **Apache Hop como ferramenta de carga de dados**: O Apache Hop é uma ferramenta muito poderosa e versátil para a carga de dados.

- **Power BI como ferramenta de visualização de dados**: O Power BI é uma ferramenta muito poderosa e versátil para a visualização de dados, e é ai que ele deve ser utilizado.

### Aulas do Projeto Athena | N1 | YouTube
[Topo ⤴︎](#menu)

- [Projeto Athena - Aula 01 - Introdução](https://youtu.be/d9yKAGrFB10)
- [Projeto Athena - Aula 02 - Instalação](https://youtu.be/2lVmmqdGxNU)
- [Projeto Athena - Aula 03 - Extração - Conceito](https://youtu.be/d_slBFnIJKw)
- [Projeto Athena - Aula 04 - Extração - Hands On](https://youtu.be/SGiIFvzNEvU)
- [Projeto Athena - Aula 05 - Staging - Hands On](https://youtu.be/Wll9ssdWLAA)
- [Projeto Athena - Aula 06 - Marts - Conceito](https://youtu.be/VKei-c16f0Y)
- [Projeto Athena - Aula 07 - Marts - Hands On](https://youtu.be/ln4Yx_XMjZc)
- [Projeto Athena - Aula 08 - Finalização](https://youtu.be/_7cb6J5ERvM)

### Arquivos - Nível 1

[baixar](https://mega.nz/file/wUdFDZbC#DH4JwgEpiLU_ohbJh2vrkkQL6E4deaVZciPa8PJiuns)

### Conclusão - Nível 1

A stack de dados evoluída é muito mais robusta e poderosa do que a inicial, capaz de processar maiores volumes de dados de forma eficiente e colaborativa.

Não mudamos só as ferramentas, mas também a forma de pensar e trabalhar com dados. A stack de dados evoluída é baseada em conceitos de DataOps e Data Engineering, que são fundamentais para a construção de pipelines de dados eficientes e escaláveis.

Porém como mencionamos essa não é a stack definitiva, ela é apenas o primeiro passo de uma longa jornada de evolução de dados. Por conta disso temos algumas oportunidades de melhoria que serão abordadas nas próximas evoluções:

- 🗒️ **Excel como origem de dados**: Apesar de termos criado validações, ainda é possível que os usuários do Excel façam alterações indevidas nos dados. O que torna o processo de ingestão de dados vulnerável a erros. A melhor abordagem seria a substituição do Excel por um banco de dados relacional, uma API ou um sistema de mensageria.

- **🦺 Modelagem de dados no Apache Hop**: Apesar de termos criado um Data Warehouse no PostgreSQL, a modelagem de dados no Apache Hop ainda é um ponto de atenção, pois estamos usando códigos SQL dentro da ferramenta, o que causa transtornos na hora da manutenção, versionamento e reutilização de código. A melhor abordagem seria a utilização de ferramentas de modelagem de dados como o dbt.

- **🔒 Segurança dos dados**: A segurança dos dados é um ponto crítico em qualquer stack de dados. A stack de dados evoluída não possui nenhum mecanismo de segurança dos dados, o que pode ser um problema em ambientes de produção. A melhor abordagem seria a implementação de mecanismos de segurança dos dados como criptografia, controle de acesso e auditoria.

- **📊 Monitoramento e alertas**: O monitoramento e alertas são fundamentais para garantir a integridade e disponibilidade dos dados. A stack de dados evoluída não possui nenhum mecanismo de monitoramento e alertas. A melhor abordagem seria a implementação de mecanismos de monitoramento e alertas como dashboards, alertas por e-mail e integração com ferramentas de monitoramento.

- **🎼 Orquestração de pipelines de dados**: A orquestração de pipelines de dados é fundamental para garantir a execução dos pipelines de forma eficiente e escalável. A stack de dados evoluída não possui nenhum mecanismo de orquestração de pipelines de dados. A melhor abordagem seria a implementação de mecanismos de orquestração de pipelines de dados como Apache Airflow ou Prefect.

- **🖥️ Ambiente local**: A stack de dados evoluída foi construída em um ambiente local, o que pode tornar o ambiente instável, pois todas as etapas vão depender do poder de processamento da maquina local. A melhor abordagem seria a implementação da stack de dados em um ambiente de nuvem como AWS, GCP ou Azure.

- **🫅 Governança de dados**: A governança de dados é fundamental para garantir a qualidade e integridade dos dados. A stack de dados evoluída não possui nenhum mecanismo de governança de dados. A melhor abordagem seria a implementação de mecanismos de governança de dados como catálogo de dados, glossário de dados e políticas de dados.

- **⌨️ Testes automatizados**: Os testes automatizados são fundamentais para garantir a qualidade e integridade dos dados. A stack de dados evoluída não possui nenhum mecanismo de testes automatizados. A melhor abordagem seria a implementação de mecanismos de testes automatizados como testes de integração, testes de unidade e testes de regressão.

- **👩‍🏫 Documentação dos processos**: A documentação dos processos é fundamental para garantir a qualidade e integridade dos dados. A stack de dados evoluída não possui nenhum mecanismo de documentação dos processos. A melhor abordagem seria a implementação de mecanismos de documentação dos processos como documentação de código, documentação de pipelines e documentação de datasets.

A perfeição é inatingível, mas a melhoria é infinita. A stack de dados evoluída é um grande avanço em relação a stack de dados inicial, mas ainda há muito a ser feito para torná-la ainda mais robusta e poderosa. A stack de dados evoluída é apenas o primeiro passo de uma longa jornada de evolução de dados, e estamos apenas começando, aguardem os próximos níveis.

## Stack de Dados Evoluída - Nivel 2
[Topo ⤴︎](#menu)

A stack de dados evoluída nível 2 é composta pelas seguintes melhorias:

- Banco de dados relacional como origem de dados;
- GitHub integrado com Apache Hop;
- Data Warehouse rodando no Linux (Docker);
- Data Warehouse aberto a conexões externas;
- Níveis de acesso no DW PostgreSQL;
- Pipelines do Apache Hop Orquestrados;


<p align="center">
  <img src="img/4.png" width="800" height="450">
</p>

### Vantagens

A stack de dados evoluída nível 2 possui várias vantagens em relação a stack nível 1:

- **Banco de dados relacional como origem de dados**: O banco de dados relacional é uma fonte de dados mais robusta e segura do que o Excel. O banco de dados relacional possui mecanismos de segurança e integridade dos dados que o Excel não possui.

- **GitHub integrado com Apache Hop**: O GitHub é uma ferramenta muito poderosa e versátil para o versionamento de código. O GitHub permite o controle de versão do código, o que facilita a colaboração entre os membros da equipe.

- **Data Warehouse rodando no Linux (Docker)**: O Data Warehouse rodando no Linux (Docker) é mais estável e seguro do que o Data Warehouse rodando no Windows. O Linux é um sistema operacional mais robusto e seguro, e o Docker é uma ferramenta muito poderosa e versátil para a execução de containers.

- **Data Warehouse aberto a conexões externas**: O Data Warehouse aberto a conexões externas permite que outras ferramentas e sistemas se conectem ao Data Warehouse. O Data Warehouse aberto a conexões externas facilita a integração automática Power BI, Tableau, Metabase, etc.

- **Níveis de acesso no DW PostgreSQL**: Os níveis de acesso no Data Warehouse PostgreSQL permitem controlar quem pode acessar e modificar os dados. Os níveis de acesso garantem a segurança e integridade dos dados.

- **Pipelines do Apache Hop orquestrados**: Os pipelines do Apache Hop orquestrados garantem a execução dos pipelines de forma eficiente e escalável. Os pipelines orquestrados permitem a execução dos pipelines em paralelo e em sequência, tornando as cargas automáticas e escaláveis.

### Aulas do Projeto Athena | N2 | YouTube
[Topo ⤴︎](#menu)

- [Projeto Athena - Aula 01 - Introdução](https://youtu.be/7Z9Z9Z9Z9Z9)
- [Projeto Athena - Aula 02 - GIT - Conceito](https://youtu.be/7Z9Z9Z9Z9Z9) - Em breve
- [Projeto Athena - Aula 03 - GIT - Hands On](https://youtu.be/7Z9Z9Z9Z9Z9) - Em breve
- [Projeto Athena - Aula 04 - Linux - Conceito](https://youtu.be/7Z9Z9Z9Z9Z9) - Em breve
- [Projeto Athena - Aula 05 - Docker - Conceito](https://youtu.be/7Z9Z9Z9Z9Z9) - Em breve
- [Projeto Athena - Aula 06 - Mudança DW - Hands On](https://youtu.be/7Z9Z9Z9Z9Z9) - Em breve
- [Projeto Athena - Aula 07 - Segurança - Conceito](https://youtu.be/7Z9Z9Z9Z9Z9) - Em breve
- [Projeto Athena - Aula 08 - Segurança - Hands On](https://youtu.be/7Z9Z9Z9Z9Z9) - Em breve
- [Projeto Athena - Aula 09 - Orquestração - Conceito](https://youtu.be/7Z9Z9Z9Z9Z9) - Em breve
- [Projeto Athena - Aula 10 - Orquestração - Hands On](https://youtu.be/7Z9Z9Z9Z9Z9) - Em breve
- [Projeto Athena - Aula 11 - Finalização](https://youtu.be/7Z9Z9Z9Z9Z9) - Em breve


### Obrigado por apreciar o material, ajudem compartilhando e disseminando esse conhecimento. 

Selo:

[<img src="img/image.webp" width="100" height="100">](https://github.com/Linhares015)