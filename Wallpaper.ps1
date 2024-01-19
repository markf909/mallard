# Set the URL of the picture you want to download
$url = "https://github.com/markf909/mallard/blob/main/Muppet.jpg?"

# Set the path where you want to save the downloaded picture
$downloadPath = "$env:TEMP\wallpaper.jpg"

# Download the picture
Invoke-WebRequest -Uri $url -OutFile $downloadPath

# Set the downloaded picture as the desktop background
SystemParametersInfo(20, 0, $downloadPath, 3)

# Function to call SystemParametersInfo
function SystemParametersInfo
{
    param (
        [Parameter(Position = 0, Mandatory = $true)]
        [int]$uiAction,

        [Parameter(Position = 1, Mandatory = $true)]
        [int]$uiParam,

        [Parameter(Position = 2, Mandatory = $true)]
        [string]$pvParam,

        [Parameter(Position = 3, Mandatory = $true)]
        [int]$fWinIni
    )

    Add-Type -TypeDefinition @"
    using System;
    using System.Runtime.InteropServices;

    public class Wallpaper {
        [DllImport("user32.dll", CharSet = CharSet.Auto)]
        public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
    }
"@
    [Wallpaper]::SystemParametersInfo($uiAction, $uiParam, $pvParam, $fWinIni)
}

Write-Host "Desktop background set to $downloadPath"
