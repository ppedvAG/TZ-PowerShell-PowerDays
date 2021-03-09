function Out-Green
{
<#
.Synopsis
   Eigene Kurzbeschreibung
.DESCRIPTION
   Eigene lange Beschreibung
.EXAMPLE
   Beispiel für die Verwendung dieses Cmdlets
.EXAMPLE
   Ein weiteres Beispiel für die Verwendung dieses Cmdlets
#>
[cmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [string]$Text
)

    Write-Host -ForegroundColor Green -Object $Text
}

function Out-Red
{
<#
.Synopsis
   Eigene Kurzbeschreibung
.DESCRIPTION
   Eigene lange Beschreibung
.EXAMPLE
   Beispiel für die Verwendung dieses Cmdlets
.EXAMPLE
   Ein weiteres Beispiel für die Verwendung dieses Cmdlets
#>
[cmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [string]$Text
)

    Write-Host -ForegroundColor Red -Object $Text
}

function Out-Voice
{
[cmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [string]$Text
)

$audioserv = Get-Service -Name Audiosrv
if($audioserv.Status -eq "Stopped")
{
    $audioserv.Start()
}


Add-Type -AssemblyName System.Speech
$synthesizer = New-Object System.Speech.Synthesis.SpeechSynthesizer
$synthesizer.SelectVoice("Microsoft Zira Desktop")
$synthesizer.Speak($Text)
}