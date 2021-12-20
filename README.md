<h1 align="center">ProjetoFinal</h1>
<p align="center">Programa de Desenvolvimento DOTI 2.0 : Uma parceria com Gama Academy : Projeto de conclusão do curso de DevOps</p>

<h2 align="left">Estrutura</h2>
O projeto está estruturado nos seguintes diretórios:

    1. network
    2. jenkins
    3. pipelineAMI
    4. pipelineMultimaster
    5. pipelineMYSQL
    6. pipelineAPP

<h2 align="left">Network</h2>
Em network está disposto o código terraform para provisionamento de uma rede na AWS com:

    1. Um VPC
    2. Três redes públicas associadas a uma route table e um internet gateway
    3. Três redes privadas cada uma associada ao sua respectiva route table e nat gateway

Utilize os scripts de shell script para fazer o deploy ou o destroy do ambiente.

<h2 align="left">Jenkins</h2>
Em jenkins estão dispostos os códigos terraform e ansible para provisionamento de uma EC2 para rodar o jenkins no qual os pipelines rodarão.
Utilize os scripts de shell script para fazer o deploy ou o destroy do ambiente.

<h2 align="left">PipelineAMI</h2>
Em pipelineAMI estão dispostos os códigos terraform e ansible para provisionamento para provisionamento de uma EC2 na qual instalamos os pacotes necessários para o pleno funcionamento do docker. 

Aqui o objetivo é gerar uma EC2, prepará-la, com base nessa instância, subir uma AMI na AWS e destruir a EC2 posteriormente.

<h2 align="left">PipelineMultimaster</h2>
Em pipelineMultimaster estão dispostos os códigos terraform e ansible para provisionamento de um cluster multimaster utilizando o kubernetes com:

    1. Uma máquina ec2 para servir de Proxy
    2. Três máquinas ec2 para servir de Masters
    3. Três máquinas ec2 para servir de Workers
 
<h2 align="left">PipelineMYSQL</h2>
Em pipelineMYSQL estão dispostos os códigos de terraform e ansible para provisionamento de três máquinas ec2 nas quais serão instalados o mysql.

<h2 align="left">PipelineAPP</h2>
Em pipelineAPP estão dispostos os códigos de terraform e ansible para deploy de uma aplicação no ambiente criado anteriormente 
