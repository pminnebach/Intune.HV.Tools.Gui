<#---------------
 | Functions
 #---------------#>





<#---------------
 | Xaml Objects
 #---------------#>

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

#Reference

#Adding items to a dropdown/combo box
#$vmpicklistView.items.Add([pscustomobject]@{'VMName'=($_).Name;Status=$_.Status;Other="Yes"})

#Setting the text of a text box to the current PC name
#$WPFtextBox.Text = $env:COMPUTERNAME

#Adding code to a button, so that when clicked, it pings a system
# $WPFbutton.Add_Click({ Test-connection -count 1 -ComputerName $WPFtextBox.Text
# })

