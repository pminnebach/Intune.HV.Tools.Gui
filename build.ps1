# Get the XAML from the WpfApp1 solution.
$xaml = Get-Content -Path .\WpfApp1\MainWindow.xaml

# Get the content from the XAML to GUI snippet.
$snippet = Get-Content -Path .\PowerShell_XAML\Snippet.ps1 -Tail 60

# Write all contents to a new .ps1 file.
$destination = "$PSScriptRoot\run.ps1"

# Delete the run.ps1 if it already exists.
if (Test-Path $destination) { Remove-Item $destination -Force }

Add-Content -Path $destination -Value '$inputXML = @"'
Add-Content -Path $destination -Value $xaml
Add-Content -Path $destination -Value '"@'
Add-Content -Path $destination -Value $snippet
Add-Content -Path $destination -Value '$Form.ShowDialog() | out-null'
