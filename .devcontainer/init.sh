az login;
git config --global credential.useHttpPath true;
git config --global user.name $1
git config user.email $2
git credential approve <<EOF
protocol=https
host=dev.azure.com
username=$1
password=$3

EOF
cd /workspaces
#mkdir infrastructure
#mv infrastructure infrastructure
#cd infrastructure
git clone --config user.email=$2 https://cloudruler@dev.azure.com/cloudruler/infrastructure/_git/aks-engine
git clone --config user.email=$2 https://cloudruler@dev.azure.com/cloudruler/infrastructure/_git/connectivity
git clone --config user.email=$2 https://cloudruler@dev.azure.com/cloudruler/infrastructure/_git/devops
git clone --config user.email=$2 https://cloudruler@dev.azure.com/cloudruler/infrastructure/_git/identity
git clone --config user.email=$2 https://cloudruler@dev.azure.com/cloudruler/infrastructure/_git/management
git clone --config user.email=$2 https://cloudruler@dev.azure.com/cloudruler/infrastructure/_git/initialization
git clone --config user.email=$2 https://cloudruler@dev.azure.com/cloudruler/infrastructure/_git/management
git clone --config user.email=$2 https://cloudruler@dev.azure.com/cloudruler/infrastructure/_git/sandbox
git clone --config user.email=$2 https://cloudruler@dev.azure.com/cloudruler/infrastructure/_git/scripts
git clone --config user.email=$2 https://cloudruler@dev.azure.com/cloudruler/infrastructure/_git/terraform-cloudruler-common

ln infrastructure/infrastructure.code-workspace ./infrastructure.code-workspace
ln -s infrastructure/.devcontainer ./.devcontainer