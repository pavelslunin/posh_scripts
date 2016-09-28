Select-AzureSubscription "Free Trial"  
 
### Source VHD (West US) - anonymous access container ###
$srcUri = "" 
 
### Target Storage Account (East US) ###
$storageAccount = ""
$storageKey = ""
 
### Create the destination context for authenticating the copy
$destContext = New-AzureStorageContext  –StorageAccountName $storageAccount `
                                        -StorageAccountKey $storageKey  
 
### Target Container Name
$containerName = "cpoiedvhds"
 
### Create the target container in storage
#New-AzureStorageContainer -Name $containerName -Context $destContext 
 
### Start the Asynchronous Copy ###
$blob1 = Start-AzureStorageBlobCopy -srcUri $srcUri `
                                    -DestContainer $containerName `
                                    -DestBlob "rhel55-amd64-template.vhd" `
                                    -DestContext $destContext