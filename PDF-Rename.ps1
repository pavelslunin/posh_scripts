Param (
    [Parameter(Mandatory=$True)]
    [string] $ServerCSV
)

$LogTime = (get-date).ToShortDateString()+" "+(get-date).ToShortTimeString()
$file = "logfile.txt"
try {
    New-Item $file -ErrorAction Ignore
    
} catch {}

try {
    $servers = Import-Csv $ServerCSV
} catch {
    $str = $LogTime+"   Path to CSV didn't find"
    Write-Output  | Tee-Object -FilePath $file -Append
}

foreach ($server in $servers) {
    $PDF = ($server.LocalPCLocation).Replace("\\D:","\\"+$server.Computers+"\D$")
    $fileName = $server.Computers+"_"+(get-date -Format d-MM-yyyy)+".pdf"
    if (Test-Connection -ComputerName $server.Computers -Count 1 -Quiet) {
            try {
            gi $PDF -ErrorAction Stop
            $path = (gi $PDF).DirectoryName+"\"+$fileName
            Rename-Item -Path $PDF -NewName $fileName -Force 
            Copy-Item -Path $path -Destination $server.ServerLocation -Force
            $str = $LogTime+"   "+$PDF+" renamed to "+$fileName+" and copied to "+$server.ServerLocation
            Write-Output $str | Tee-Object -FilePath $file -Append
        } catch
        {
            $str = "$LogTime"+"   File "+$PDF+" didn't find on "+$server.Computers 
            Write-Output $str | Tee-Object -FilePath $file -Append
        }
    }
    else {
        $str = "$LogTime"+"   Computer "+$server.Computers+" unavailable"
        Write-Output $str | Tee-Object -FilePath $file -Append
    }
}