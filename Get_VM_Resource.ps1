$vmName = ""
$vmDesc = ""
$out = ""
foreach ($i in 0,1,2,3,4,5) {
Get-SCVirtualMachine | % {
    $vmName = $_.Name.ToString()
    $vmDesc = $_.Description.Replace("`n"," ")
    $vmCloud=$_.Cloud
    $vmCPU=$_.CPUCount
    $vmMemory = $_.MemoryAssignedMB
    $vmHDD=[math]::Round($_.TotalSize/1GB)
    Write-Output $vmName";"$vmDesc";"$vmCloud";"$vmCPU";"$vmMemory";"$vmHDD"Gb"
    }

}

