cd pipeline_ami/terraform_prep

echo "$(pwd)"
# echo "$(sudo su jenkins)"

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
terraform destroy --auto-approve