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
    },
    @{
        NodeName = "localhost"
        WindowsFeature = @(
            @{
                Name = "RSAT-DHCP"
                Ensure = "Present"
            }
        )
    }
)
}