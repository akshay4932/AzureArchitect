#Login & Subscription selection
Connect-AzAccount
Select-AzSubscription -Subscription "Pay-As-You-Go"

#Variables
$RGName = "RG-Storage-PS"
$RGLocation = "West Europe"
$StorageAccountName = "stortrainify1108"

#Resource Group Operation
Write-Host "started checking & creating Resource Group"

$RG = Get-AzResourceGroup -Name $RGName -ErrorAction SilentlyContinue

if(!$RG){
Write-Host "creating Resource Group"
$RG = New-AzResourceGroup -Name $RGName -Location $RGLocation
Write-Host " Resource Group created"
}

else
{
Write-Host "Resource Group Already Exists"
}

#Storage Account Operation
Write-Host "started checking & creating Storage Account"
$SA = Get-AzStorageAccount -Name $StorageAccountName -ResourceGroupName $RG.ResourceGroupName -ErrorAction SilentlyContinue

if(!$SA){
Write-Host "creating Storage Account"
$SA = New-AzStorageAccount -Name $StorageAccountName -ResourceGroupName $RG.ResourceGroupName -Location $RG.Location -SkuName Standard_LRS -Kind StorageV2 -AccessTier Hot
Write-Host " Storage Account created"
}

else
{
Write-Host "Storage Account Already Exists"
}