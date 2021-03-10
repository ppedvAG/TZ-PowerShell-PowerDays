configuration webserverconfig
{
    node $AllNodes.NodeName
    {
        foreach($Feature in $Node.WindowsFeature)
        {
            WindowsFeature $Feature.Name
            {
                Name = $Feature.NAme
                Ensure = $Feature.EnSure
            }
        }
    }
}

WebServerConfig -ConfigurationData C:\KursExamples\DSC\Advanced\DSCConfigData.psd1 -OutputPath C:\KursExamples\DSC\Advanced\ 