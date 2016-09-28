    $EmailFrom = “”

    $EmailTo = “”

    $Subject = “Status copy content”

    $Body = “Content was succesfull copied”

    $SMTPServer = “”

    $SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 25)

    #$SMTPClient.EnableSsl = $false

    #$SMTPClient.Credentials = New-Object System.Net.NetworkCredential(“usr”, “pass”);
    $SMTPClient.UseDefaultCredentials = $true

    $SMTPClient.Send($EmailFrom, $EmailTo, $Subject, $Body)