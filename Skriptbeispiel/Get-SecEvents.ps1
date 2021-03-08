<#
.Synopsis
   Skript zum Abfragen von von Anmeldebezogenene Events
.DESCRIPTION
   Dieses Skript ermöglicht uns Events vom Security Log abzufragen.
.PARAMETER EventId
   Es werden folgende Werte unterstützt
   4624 : Anmeldung
   4625 : fehlgeschlagene Anmeldung
   4634 : Abmeldung
.EXAMPLE
   Skriptbeispiel\Get-SecEvents.ps1 -EventId 4624

   Index Time          EntryType   Source                 InstanceID Message
   ----- ----          ---------   ------                 ---------- -------
   50089 Mrz 08 12:04  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet...
   50086 Mrz 08 12:04  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet...
   50082 Mrz 08 12:03  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet...
   50078 Mrz 08 12:02  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet...
   50075 Mrz 08 12:02  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet...

   Bei dieser Verwendung werden die akutellsten fünf Anmeldeevents abgefragt
#>
[cmdletBinding()]
param(
[Parameter(Mandatory=$true)]
[ValidateSet(4624,4625,4634)] #Lässt nur die angegebenen Werte zu
[int]$EventId,

[ValidateScript({Test-NetConnection -Computername $PSItem -CommonTcpPort WinRM -InformationLevel Quiet})]
[string]$Computername = "localhost",

#lässt nur Werte im angegebenen Bereich zu
[ValidateRange(5,10)]  
[int]$Newest = 5
)

Write-Verbose -Message "EventID: $EventId"
Write-Verbose -Message "Computername: $Computername"
Write-Verbose -Message "Newest: $Newest"
Get-EventLog -LogName Security -ComputerName $Computername | Where-Object EventID -eq $EventId | Select-Object -First $Newest