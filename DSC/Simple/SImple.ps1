Configuration WebServerConfiguration
{
    Node "Member1"
    {
        WindowsFeature WebServer
        {
            Name = "Web-Server"
            Ensure = "Present"
        }
        WindowsFeature ManagementTools
        {
            Name = "Web-MgmT-Tools"
            Ensure = "Present"
        }
    }
}

WebServerConfiguration -OutputPath C:\DSC
Start-DscConfiguration -Path C:\DSC 