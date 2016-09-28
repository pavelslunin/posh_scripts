gwmi win32_LogicalDisk | select -Property DeviceID,Size,FreeSpace | ft @{Expression={$_.DeviceID};label="Disk"},@{Expression={[System.Math]::Round($_.Size/1Gb)};label="Size"},@{Expression={[System.Math]::Round($_.FreeSpace/1Gb)};label="Free space"} -AutoSize