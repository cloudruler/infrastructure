#This will log in to Azure and load some key vault secrets into the environment so that VS Code's devcontainers will have access to them.
Write-Host "Start up..."
$Env:ARM_TENANT_ID = "c17f8a71-76c6-4e70-bd08-fb10ead2bf68"
$Env:ARM_SUBSCRIPTION_ID = "2fb80bcc-8430-4b66-868b-8253e48a8317"
$Env:ARM_CLIENT_ID = "1e3fd996-8372-4ce4-8cbc-9406340e495b"
Write-Host "Log in to Azure..."
Connect-AzAccount -Tenant $Env:ARM_TENANT_ID -SubscriptionId $Env:ARM_SUBSCRIPTION_ID

Write-Host "Logged in to Azure. Grabbing Key Vault secrets..."
$keyVaultName = "cloudruler"
$Env:ARM_CLIENT_SECRET = Get-AzKeyVaultSecret -Name vault-automation-secret -VaultName $keyVaultName -AsPlainText
$Env:AZDO_PERSONAL_ACCESS_TOKEN = Get-AzKeyVaultSecret -Name azuredevops-pat-brianmoore -VaultName $keyVaultName -AsPlainText
$Env:GITHUB_TOKEN = Get-AzKeyVaultSecret -Name brianmoore180-gmail-github-pat -VaultName $keyVaultName -AsPlainText
$Env:TFE_TOKEN= Get-AzKeyVaultSecret -Name terraform-cloud-cloudruler-user-api-token -VaultName $keyVaultName -AsPlainText

Write-Host "Grabbed key vault secrets. Starting VS Code..."
Start-Process -FilePath "C:\Users\brian\AppData\Local\Programs\Microsoft VS Code\Code.exe"
Write-Host "Finished."
