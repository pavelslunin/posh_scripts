$VM = Get-AzureVM -ServiceName "cSuiteLLC-cBlinders" -Name "cBlinder"
for ($Port = 5020; $Port -le 5030; $Port++)
{
    $VM = $VM | Add-AzureEndpoint -Name "FTP-Data-$Port" -Protocol 'TCP' -LocalPort $Port -PublicPort $Port
}
$VM | Update-AzureVM