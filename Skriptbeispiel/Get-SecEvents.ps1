[cmdletBinding()]
param(
[Parameter(Mandatory=$true)]
[ValidateSet(4624,4625,4634)] #Lässt nur die angegebenen Werte zu
[int]$EventId,

[ValidateScript({Test-NetConnection -Computername $PSItem -CommonTcpPort WinRM -InformationLevel Quiet})]
[string]$Computername = "localhost",

[ValidateRange(5,10)]  #lässt nur Werte im angegebenen Bereich zu
[int]$Newest = 5
)

Write-Verbose -Message "EventID: $EventId"
Write-Verbose -Message "Computername: $Computername"
Write-Verbose -Message "Newest: $Newest"
Get-EventLog -LogName Security -ComputerName $Computername | Where-Object EventID -eq $EventId | Select-Object -First $Newest