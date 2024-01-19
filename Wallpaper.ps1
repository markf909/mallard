# Set the URL of the picture you want to download
$url = "https://github.com/markf909/mallard/raw/main/Muppet.jpg"

# Set the path where you want to save the downloaded picture
$downloadPath = "C:\Test\Muppet.jpg"

# Create a WebClient object
$webClient = New-Object System.Net.WebClient

# Download the picture
try {
    $webClient.DownloadFile($url, $downloadPath)
    Write-Host "Download successful. File saved to: $downloadPath"

    # Set the downloaded picture as the desktop background
    Set-DesktopBackground $downloadPath
} catch {
    Write-Host "Download failed. Error: $_"
} finally {
    # Dispose of the WebClient object
    $webClient.Dispose()
}

# Function to set the desktop background
function Set-DesktopBackground {
    param (
        [Parameter(Position = 0, Mandatory = $true)]
        [string]$WallpaperPath
    )

    Add-Type @"
        using System;
        using System.Runtime.InteropServices;

        public class Wallpaper {
            [DllImport("user32.dll", CharSet = CharSet.Auto)]
            public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
        }
"@
    [Wallpaper]::SystemParametersInfo(20, 0, $WallpaperPath, 3)
}

Write-Host "Desktop background set to $downloadPath"
