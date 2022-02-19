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
git clone --config user.email=$2 https://cloudruler@dev.azure.com/cloudruler/infrastructure/_git/images

ln infrastructure/infrastructure.code-workspace ./infrastructure.code-workspace
ln -s infrastructure/.devcontainer ./.devcontainer

#Install aks-engine binaries into path. Can be used to deploy an aks-engine
wget -q --show-progress --https-only --timestamping "https://github.com/Azure/aks-engine/releases/download/v0.61.0/aks-engine-v0.61.0-linux-amd64.tar.gz"
tar -xvf aks-engine-v0.61.0-linux-amd64.tar.gz
sudo mv aks-engine-v0.61.0-linux-amd64/aks-engine /usr/local/bin/

rm -rf aks-engine-v0.61.0-linux-amd64
rm aks-engine-v0.61.0-linux-amd64.tar.gz


#wget -q --show-progress --https-only --timestamping "https://github.com/Azure/azure-container-networking/releases/download/v1.2.8/azure-vnet-cni-linux-amd64-v1.2.8.tgz"
#tar -xvf azure-vnet-cni-linux-amd64-v1.2.8.tgz
#sudo mv azure-vnet-cni-linux-amd64-v1.2.8/aks-engine /usr/local/bin/