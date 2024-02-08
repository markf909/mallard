$url = "https://raw.githubusercontent.com/markf909/mallard/main/Muppet.jpg"
$downloadPath = [System.IO.Path]::Combine($env:USERPROFILE, 'Downloads\Muppet.jpg')

try {
    Invoke-WebRequest -Uri $url -OutFile $downloadPath
    Write-Host "Download successful. File saved to: $downloadPath"
    
    # Set the wallpaper using SystemParametersInfo
    Add-Type -TypeDefinition @"
    using System;
    using System.Runtime.InteropServices;
    
    public class Wallpaper {
        [DllImport("user32.dll", CharSet = CharSet.Auto)]
        public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
    }
"@
    [Wallpaper]::SystemParametersInfo(20, 0, $downloadPath, 0x01)
    
} catch {
    Write-Host "Download failed. Error: $_"
}

Read-Host "Press Enter to close this window"
