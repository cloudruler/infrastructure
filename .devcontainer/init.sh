az login;
git config --global credential.useHttpPath true;
git credential approve <<EOF
protocol=https
host=dev.azure.com
username=$1
password=$2

EOF
cd /workspaces
#mkdir infrastructure
#mv infrastructure infrastructure
#cd infrastructure
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

ln infrastructure/infrastructure.code-workspace ./infrastructure.code-workspace
ln -s infrastructure/.devcontainer ./.devcontainer