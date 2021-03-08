[cmdletBinding()]
param(
[Parameter(Mandatory=$true)]
[string]$Path,
 
[int]$DirCount = 3,

[int]$FileCount = 8,

[switch]$Force

)

if($Path.EndsWith('\'))
{
    $Path += "TestFiles\"
}
else
{
    $Path += "\TestFiles\"
}

#prüft ob TestFiles Ordner bereits vorhanden ist
if(Test-Path $Path)
{
    Write-Verbose -Message "TestFilesOrdner vorhanden"
    if($Force)
    {   #Wenn Force True dann löschen des Ordners mitsamt Inhalt
        Remove-Item -Path $Path -Recurse -Force
        Write-Verbose -Message "TestFilesOrdner gelöscht"
    }
    else
    {   #Wenn Force False dann Ausgabe einer Medlung und Beeindigung des Skriptes
        Write-Host -ForegroundColor Red -Object "Der Ordner ist bereits vorhanden."
        exit
    }
}

#erstellen des TestFilesverzeichnises
New-Item -Path $Path -ItemType Directory

#Schleife zum erstellen der Dateien im root Verzeichnis
for($i=1;$i -le $FileCount; $i++)
{
    New-Item -Path $Path -Name "File$i.txt" -ItemType File
}

#Schleife zum erstellen der geforderten Ordner
for($i=1; $i -le $DirCount; $i++)
{
    Write-Verbose -Message "Schleife zum Ordner erstellen"
    $DirPath = $Path + "Ordner$i\"
    New-Item -Path $DirPath -ItemType Directory

    #Schleife zum erstellen der untergeordnenten Files
    for($j =1; $j -le $FileCount; $j++)
    {
        Write-Verbose -Message "Schleife zum Dateien erstellen Ordner:$i"
        New-Item -Path $DirPath -Name "File-O$i-$j.txt" -ItemType File
    }
}