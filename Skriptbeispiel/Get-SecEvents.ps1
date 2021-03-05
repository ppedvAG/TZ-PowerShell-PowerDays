[cmdletBinding()]
param(
[Parameter(Mandatory=$true)]
[int]$EventId,

[string]$Computername = "localhost",

[int]$Newest = 5
)

Write-Verbose -Message "EventID: $EventId"
Write-Verbose -Message "Computername: $Computername"
Write-Verbose -Message "Newest: $Newest"
Get-EventLog -LogName Security -ComputerName $Computername | Where-Object EventID -eq $EventId | Select-Object -First $Newest