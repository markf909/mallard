# PowerShell script to create a folder called Mallard in C:\test

# Specify the path for the folder
$folderPath = "C:\test\Mallard"

# Check if the folder already exists
if (-not (Test-Path -Path $folderPath -PathType Container)) {
    # Create the folder if it doesn't exist
    New-Item -ItemType Directory -Path $folderPath -Force

    Write-Host "Folder 'Mallard' created successfully in C:\test."
} else {
    Write-Host "Folder 'Mallard' already exists in C:\test."
}
exit