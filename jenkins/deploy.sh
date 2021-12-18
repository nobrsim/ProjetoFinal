#!/bin/bash

cd 0-terraform
terraform init
terraform fmt
terraform apply --auto-approve

echo "Criando variável de ambiente SUBNET_ID"
SUBNET_ID=$(terraform output | grep aza-pub | awk '{print $1;exit}' | sed 's/"//g')

export TF_VAR_subnet_id=$SUBNET_ID

cd ../1-terraform
terraform init
terraform fmt
terraform apply --auto-approve

echo "Aguardando criação de maquinas ..."
sleep 10 # 10 segundos

echo "[ec2-jenkins]" > ../2-ansible/hosts # cria arquivo
echo "$(terraform output | grep public | awk '{print $2;exit}')" | sed -e "s/\",//g" >> ../2-ansible/hosts # captura output faz split de espaco e replace de ",

echo "Aguardando criação de maquinas ..."
sleep 20 # 20 segundos

cd ../2-ansible
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts provisionar.yml -u ubuntu --private-key ~/.ssh/kp-turma3-talyson-1.pem

cd ../1-terraform
terraform output

echo "Agora somente abrir a URL: http://$(terraform output | grep public | awk '{print $2;exit}'):8080" | sed -e "s/\",//g"

# open "http://$(terraform output | grep public | awk '{print $2;exit}'):8080" | sed -e "s/\",//g"" #mac
# explorer "http://$(terraform output | grep public | awk '{print $2;exit}'):8080" | sed -e "s/\",//g"" #windows
# nautilus "http://$(terraform output | grep public | awk '{print $2;exit}'):8080" | sed -e "s/\",//g"" #linux

ID_MAQUINA=$(terraform output | grep id | awk '{print $2;exit}')
echo ${ID_MAQUINA/\",/}

# cd ../2-terraform-ami/

# terraform init
# terraform fmt
# terraform apply -var="resource_id=${ID_MAQUINA/\",/}" -auto-approve 
# # terraform apply -var="resource_id=${ID_MAQUINA/\",/} versao=0.0.2" -auto-approve 
# terraform output
