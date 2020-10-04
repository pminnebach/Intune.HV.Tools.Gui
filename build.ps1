# Get the XAML from the WpfApp1 solution.
$xaml = Get-Content -Path "$PSScriptRoot\WpfApp1\MainWindow.xaml"

# Get the content from the XAML to GUI snippet.
$snippet = Get-Content -Path "$PSScriptRoot\PowerShell_XAML\Snippet.ps1"
$xamlStuff = $snippet[16..57]
$xamlForm  = $snippet[69..75]

# Get your code from code.ps1.
$code = Get-Content -Path "$PSScriptRoot\code.ps1"

# Write all contents to a new .ps1 file.
$destination = "$PSScriptRoot\run.ps1"

# Delete the run.ps1 if it already exists.
if (Test-Path $destination) { Remove-Item $destination -Force }

Add-Content -Path $destination -Value '$inputXML = @"'
Add-Content -Path $destination -Value $xaml
Add-Content -Path $destination -Value '"@'
Add-Content -Path $destination -Value $xamlStuff
Add-Content -Path $destination -Value $code
Add-Content -Path $destination -Value $xamlForm
Add-Content -Path $destination -Value '$Form.ShowDialog() | out-null'
