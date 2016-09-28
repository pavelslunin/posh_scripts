$cpu=0
$mem=0
$vhds=0
$cloud=""
#$cloud=Get-SCCloud "FileNet - LCA"
$serv=""
$serv2 = ""
$serv2 | % {Get-SCVirtualMachine -VMHost $_ } | % {
'Name: '+$_.Name;'CPU: '+$_.CPUCount;"Memory: "+$_.Memory;"Memory Available: "+$_.MemoryAvailablePercentage+"%";"Dynamic memory: "+$_.DynamicMemoryEnabled;"Dynamic memory MAX: "+$_.DynamicMemoryMaximumMB+" Mb";"Memory Assigned: "+$_.MemoryAssignedMB+" Mb";"HDD: "+$_.TotalSize/1Gb+" Gb";"`t"
$cpu+=$_.CPUCount
$mem+=$_.DynamicMemoryMaximumMB
$vhds+=$_.TotalSize
}
