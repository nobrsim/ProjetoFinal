#!/bin/bash

cd pipelineAPP/ansible

#ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts provisionar.yml -u ubuntu --private-key ~/.ssh/chaveprivada.pem

echo "Executando ansible ::::: [ ansible-playbook -i hosts provisionar.yml -u ubuntu --private-key /var/lib/jenkins/chave-privada.pem ]"
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts provisionarDev.yml -u ubuntu --private-key /var/lib/jenkins/chave-privada.pem
