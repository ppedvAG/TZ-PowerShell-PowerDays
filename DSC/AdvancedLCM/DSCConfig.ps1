configuration webserverconfig
{
    LocalConfigurationManager
    {
        #ApplyOnly
        #ApplyAndMonitor
        #ApplyAndAutoCorrect
        ConfigurationMode = "ApplyAndAutoCorrect" 

        #Abstand zur Prüfung, Default und Mindestwert sind 15 Minuten 
        ConfigurationModeFrequencyMins = 15
    }


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

WebServerConfig -ConfigurationData C:\KursExamples\DSC\AdvancedLCM\DSCConfigData.psd1 -OutputPath C:\KursExamples\DSC\AdvancedLCM