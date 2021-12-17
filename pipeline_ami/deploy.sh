cd pipeline_ami/terraform
terraform init
terraform apply -auto-approve

echo "Aguardando criação de maquinas ..."
sleep 10 # Dá para melhor com um while

echo $"[ec2-img]" > ../ansible/hosts # cria arquivo
echo "$(terraform output | grep public_ip | awk '{print $2;exit}')" | sed -e "s/\",//g" >> ../ansible/hosts 

echo "Aguardando criação de maquinas ..."
sleep 10 # Dá para melhor com um while

cd ../ansible

echo "Executando ansible ::::: [ ansible-playbook -i hosts provision.yml -u ubuntu --private-key /var/lib/jenkins/.ssh/id_rsa ]"
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts provision.yml -u ubuntu --private-key /var/lib/jenkins/id_rsa


