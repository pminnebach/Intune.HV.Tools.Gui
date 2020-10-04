<#---------------
 | Functions
 #---------------#>





<#---------------
 | Xaml Objects
 #---------------#>

#region TabItem: Environment

$WPFComputernameLabel.Content = $env:COMPUTERNAME
$WPFPSVersionLabel.Content = $PSVersionTable.PSVersion.ToString()
if ($PSVersionTable.PSVersion.Major -eq 5) {
    $WPFOSLabel.Content = "Windows"
}
else {
    $WPFOSLabel.Content = $PSVersionTable.OS
}

Get-Module -Name Hyper-ConvertImage,Microsoft.Graph.Intune, WindowsAutoPilotIntune, Intune.HV.Tools -ListAvailable | Sort-Object Name | ForEach-Object {
    $WPFmoduleGrid.AddChild([pscustomobject]@{
        ModuleType = $_.ModuleType
        Version = $_.Version
        Name = $_.Name
    })
}

#endregion

#region TabItem: hvconfig.json

$HVToolsConfig = Get-HVToolsConfig
$WPFhvConfigPathLabel.Content = $HVToolsConfig.hvConfigPath
$WPFvmPathLabel.Content = $HVToolsConfig.vmPath
$WPFvSwitchNameLabel.Content = $HVToolsConfig.vSwitchName
$WPFvLanIdLabel.Content = $HVToolsConfig.vLanId

$HVToolsConfig.tenantConfig | ForEach-Object {
    $WPFTenantGrid.AddChild([PSCustomObject]@{
            TenantName = $_.TenantName
            ImageName  = $_.ImageName
            AdminUpn   = $_.AdminUpn
    })
}

$HVToolsConfig.images | ForEach-Object {
    $WPFImagesGrid.AddChild([PSCustomObject]@{
            imageName = $_.imageName
            imagePath = $_.imagePath
            refImagePath = $_.refImagePath
    })
}

#endregion

#Reference

#Adding items to a dropdown/combo box
#$vmpicklistView.items.Add([pscustomobject]@{'VMName'=($_).Name;Status=$_.Status;Other="Yes"})

#Setting the text of a text box to the current PC name
#$WPFtextBox.Text = $env:COMPUTERNAME

#Adding code to a button, so that when clicked, it pings a system
# $WPFbutton.Add_Click({ Test-connection -count 1 -ComputerName $WPFtextBox.Text
# })

