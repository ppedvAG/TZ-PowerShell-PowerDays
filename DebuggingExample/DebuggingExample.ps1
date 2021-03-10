[cmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [string]$text
)

#Write Verbose gibt zusatz Informationen die im Normalfall unterdrückt werden. Skript aufruf mit -Verbose !
Write-Verbose -Message "Folgender WErt wurde übergeben: $text"

Write-Debug -Message "Vor erster Ausgabe"
Write-Host -Object $text -ForegroundColor DarkMagenta

Write-Debug -Message "Vor zweiter Ausgabe"
Write-Host -Object $text -ForegroundColor Magenta

Write-Debug -Message "Vor dritter Ausgabe"
Write-Host -Object $text -ForegroundColor Green