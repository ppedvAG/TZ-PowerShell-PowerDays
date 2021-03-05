[cmdletBinding()]
param(
[Parameter(Mandatory=$true)]
[int]$EventId,

[string]$Computername = "localhost",

[int]$Newest = 5
)

Get-EventLog -LogName Security -ComputerName $Computername | Where-Object EventID -eq $EventId | Select-Object -First $Newest