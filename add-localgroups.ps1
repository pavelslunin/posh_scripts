$srv = "t2ru-trmcons-01"
$group = "Server T2RU-TRMCONS-01 Admins"
$winnt="WinNT://"+$srv+"/Administrators,group"
$winntadd="WinNT://T2RU/"+$group+",group"
([adsi]$winnt).Add($winntadd)