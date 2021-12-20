cd pipelineAMI/terraform_prep

echo "$(pwd)"

<<<<<<< HEAD:pipeline_ami/deploy.sh
terraform init # Comentado temporáriamento pata testes
#terraform fmt # Comentado temporáriamento pata testes
=======
terraform init 
terraform fmt 
>>>>>>> dc1b8b648e04c70bcdfb1e38c724f5cb003bf694:pipelineAMI/deploy.sh
terraform apply --auto-approve

echo "Criando variável de ambiente SUBNET_ID"
SUBNET_ID=$(terraform output | grep aza-pub | awk '{print $1;exit}' | sed 's/"//g')

export TF_VAR_subnet_id=$SUBNET_ID

cd ../terraform

echo "$(pwd)"

terraform init 
terraform fmt 
terraform apply --auto-approve

echo "Aguardando criação de maquinas ..."
sleep 10 # Dá para melhor com um while

echo "[ec2-img]" > ../ansible/hosts 
echo "$(terraform output | grep public_ip | awk '{print $2;exit}')" | sed -e "s/\",//g" >> ../ansible/hosts 

echo "Aguardando criação de maquinas ..."
sleep 10 # Dá para melhor com um while

cd ../ansible

echo "Executando ansible ::::: [ ansible-playbook -i hosts provision.yml -u ubuntu --private-key /var/lib/jenkins/kp-turma3-talyson-1.pem ]"
# ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts provision.yml -u ubuntu --private-key ~/.ssh/kp-turma3-talyson-1.pem
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts provision.yml -u ubuntu --private-key /var/lib/jenkins/chave-privada.pem
# ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts provision.yml -u ubuntu --private-key /home/ubuntu/chave-privada.pem



