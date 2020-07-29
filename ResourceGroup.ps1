#Connect-AzAccount
#Select-AzSubscription -Subscription "Pay-As-You-Go"
#Get-AzLocation | Select Location
$ResourceGroupName = "RG-Powershell-2907-01"
$ResourceGroupLocation = "westeurope"
$RG = Get-AzResourceGroup -Name $ResourceGroupName -ErrorAction SilentlyContinue
if(!$RG){
$RG = New-AzResourceGroup -Name $ResourceGroupName -Location $ResourceGroupLocation
Write-Host "Resource Group Created"
Write-Host $RG.ResourceGroupName
Write-Host $RG.Location
}
else{
Write-Host "Resource Group Already exists"
Write-Host $RG.ResourceGroupName
Write-Host $RG.Location
}
