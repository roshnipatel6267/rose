#!/bin/bash
#echo "Executing azure_cli_login.sh"
# Install Azure CLI
sudo apt-get update
sudo apt-get install -y azure-cli

# Log in to Azure (you might need to follow the interactive prompt)

#az storage blob upload \
#    --account-name <storage-account> \
#    --container-name <container> \
#    --name file1.txt \
#    --file file1.txt \
 
 #az storage blob upload --account-name ${var.storage_account_name} \
 #                           --container-name ${var.container_name}  \
 #                           --name file1.txt \
 #                           --type block \
 #                           --content-type "text/plain" \
 #                           --file ./file1.txt

#az storage blob upload --account-name $storage_account_name \
#                            --container-name $container_name  \
#                            --name file1.txt \
#                            --type block \
#                            --content-type "text/plain" \
#                            --file ./file1.txt
# Upload file1.txt to Blob Storage
#az storage blob upload --account-name roshnitest11 --container-name roshni-container --name roshni-blob --type block --content-type 'text/plain'  --type block --content-type 'text/plain' --content-encoding 'gzip' --file file1.txt

# Upload file2.txt to Blob Storage
# az storage blob upload --account-name roshnitest11--container-name roshni-container --name file2.txt --type block --content-type "text/plain" --account-key <storage_account_key> --type block --content-type "text/plain" --content-encoding "gzip" --file ./file/file2.txt


