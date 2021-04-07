az login;
git config --global credential.useHttpPath true;
git credential approve <<EOF
protocol=https
host=dev.azure.com
username=$AZ_DO_USERNAME
password=$AZ_DO_PAT

EOF