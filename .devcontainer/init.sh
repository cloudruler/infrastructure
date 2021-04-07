az login;
git config --global credential.useHttpPath true;
git credential approve <<EOF
protocol=https
host=dev.azure.com
username=$AZ_DO_USERNAME
password=$AZ_DO_PAT

EOF

git clone https://cloudruler@dev.azure.com/cloudruler/infrastructure/_git/aks-engine
git clone https://cloudruler@dev.azure.com/cloudruler/infrastructure/_git/connectivity
git clone https://cloudruler@dev.azure.com/cloudruler/infrastructure/_git/devops
git clone https://cloudruler@dev.azure.com/cloudruler/infrastructure/_git/identity
git clone https://cloudruler@dev.azure.com/cloudruler/infrastructure/_git/management
git clone https://cloudruler@dev.azure.com/cloudruler/infrastructure/_git/initialization
git clone https://cloudruler@dev.azure.com/cloudruler/infrastructure/_git/management
git clone https://cloudruler@dev.azure.com/cloudruler/infrastructure/_git/sandbox
git clone https://cloudruler@dev.azure.com/cloudruler/infrastructure/_git/scripts
git clone https://cloudruler@dev.azure.com/cloudruler/infrastructure/_git/terraform-cloudruler-common