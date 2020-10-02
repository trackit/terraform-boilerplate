for ws in $(terraform workspace list | grep 'refs-')
do
  terraform workspace select $ws
  terraform destroy -auto-approve -var-file ../envs/qa.tfvars
done
