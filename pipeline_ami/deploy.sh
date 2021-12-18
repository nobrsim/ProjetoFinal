cd ./terraform-prep

echo "$(pwd)"
echo "$(sudo su jenkins)"

terraform init
terraform fmt
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

echo $"[ec2-img]" > ../ansible/hosts # cria arquivo
echo "$(terraform output | grep public_ip | awk '{print $2;exit}')" | sed -e "s/\",//g" >> ../ansible/hosts 

echo "Aguardando criação de maquinas ..."
sleep 10 # Dá para melhor com um while

cd ../ansible

echo "Executando ansible ::::: [ ansible-playbook -i hosts provision.yml -u ubuntu --private-key /var/lib/jenkins/kp-turma3-talyson-1.pem ]"
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts provision.yml -u ubuntu --private-key /var/lib/jenkins/kp-turma3-talyson-1.pem
# ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts provision.yml -u ubuntu --private-key /home/ubuntu/chave-privada.pem



