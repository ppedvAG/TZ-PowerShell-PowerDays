@{
AllNodes = @(
    @{
        NodeName = "Member1"
        WindowsFeature = @(
            @{
                Name = "Web-Server"
                Ensure = "Present"
             },
             @{
                Name = "Web-Mgmt-Tools"
                Ensure = "Present"
             }
        )
    }
)
}