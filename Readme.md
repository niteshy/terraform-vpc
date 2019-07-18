# To Run on default aws configuration:  

terraform plan
terraform apply 

# To Run on custom aws configuration:  

Add configuration in the variable file like stage.tfvars

terraform plan -var-file=stage.tfvars
terraform apply 

# To Run and auto-approve

terraform plan -var-file=stage.tfvars && terraform apply -auto-approve