#!/bin/bash
cd pipelineAMI/terraform

uri=$(terraform output | grep public_ip | awk '{print $2;exit}' | sed -e "s/\",//g")

# kube_adm=$(ssh -i /var/lib/jenkins/chave-privada.pem ubuntu@$uri 'kubeadm version')
kube_adm=$(ssh -i /var/lib/jenkins/kp-turma3-talyson-1.pem ubuntu@$uri 'kubeadm version')

echo $kube_adm

regex_kube='kubeadm version:'

# docker=$(ssh -i /var/lib/jenkins/chave-privada.pem ubuntu@$uri 'docker --version')
docker=$(ssh -i /var/lib/jenkins/kp-turma3-talyson-1.pem ubuntu@$uri 'docker --version')

echo $docker

regex_docker='Docker version'

if [[ $kube_adm =~ $regex_kube && $docker =~ $regex_docker ]]
then 
    echo "::::: kubernetes e docker no ar :::::"
    exit 0
else
    echo "::::: kubernetes e docker não estão no ar :::::"
    exit 1
fi