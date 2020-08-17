Connect-AzAccount
$RGName = "RG_VNET_DEMO_PS"
$RGLocation = "West Europe"

$RG = Get-AzResourceGroup -Name $RGName -ErrorAction SilentlyContinue

if(!$RG){
$RG = New-AzResourceGroup -Name $RGName -Location $RGLocation
}

$VNETName ="VNET_DEMO_PS"
$AddressSpace ="192.168.0.0/24"

$VNET = Get-AzVirtualNetwork -Name $VNETName -ResourceGroupName $RGName

if(!$VNET)
{
$VNET = New-AzVirtualNetwork -Name $VNETName -ResourceGroupName $RGName -Location $RGLocation -AddressPrefix $AddressSpace
}

#Get the details of VNET in which subnet will be created
$VNET = Get-AzVirtualNetwork -Name $VNETName -ResourceGroupName $RGName
$SubnetName ="Subnet-1"
$SubnetAddressSpace = "192.168.0.0/27"
if(!($VNET.SubnetsText.Contains($SubnetName)))
{
$subnetconfig = Add-AzVirtualNetworkSubnetConfig -Name $SubnetName -VirtualNetwork $VNET -AddressPrefix $SubnetAddressSpace
}


Set-AzVirtualNetwork -VirtualNetwork $VNET

