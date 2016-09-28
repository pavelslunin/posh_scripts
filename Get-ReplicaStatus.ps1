#$cloud = Get-SCCloud 
#$vmhostgroup = Get-SCVMHostGroup clusters
#$cluster = Get-SCVMHostCluster  -VMHostGroup $vmhostgroup
#$VMHost = Get-VMHost -VMHostCluster $cluster
{Get-VMReplication -ComputerName  | ft name,state,health,primaryserver,replicaserver,LastReplicationTime -AutoSize}