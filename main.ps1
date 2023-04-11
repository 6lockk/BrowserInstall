# Prompt user to select a browser to download
$validInput = $false
while (-not $validInput) {
    Write-Host "Please select a browser to download:"
    Write-Host "1. Google Chrome"
    Write-Host "2. Mozilla Firefox"
    Write-Host "3. Chromium"
    Write-Host "4. Brave"
    Write-Host "5. Ungoogled Chromium"
    Write-Host "6. LibreWolf"
    Write-Host "7. Tor"

    $input = Read-Host -Prompt "Enter a number (1-7)"

    if ([int]::TryParse($input, [ref]$null) -and $input -in 1..7) {
        $validInput = $true
    } else {
        Write-Host "Invalid input. Please enter a number between 1 and 7."
    }
}

# Download selected browser
switch ($input) {
    1 { Invoke-WebRequest "https://dl.google.com/chrome/install/standalone/GoogleChromeStandaloneEnterprise64.msi" -OutFile "$env:USERPROFILE\Downloads\GoogleChromeEnterpriseBundle64.msi" }
    2 { Invoke-WebRequest "https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=en-US" -OutFile "$env:USERPROFILE\Downloads\FirefoxSetup.exe" }
    3 { Invoke-WebRequest "https://github.com/Hibbiki/chromium-win64/releases/latest/download/chromium-win64.zip" -OutFile "$env:USERPROFILE\Downloads\chromium-win64.zip" }
    4 { Invoke-WebRequest "https://laptop-updates.brave.com/latest/winx64" -OutFile "$env:USERPROFILE\Downloads\BraveSetup.exe" }
    5 { Invoke-WebRequest "https://github.com/Eloston/ungoogled-chromium/releases/latest/download/ungoogled-chromium-94.0.4606.81-1.windows.7z" -OutFile "$env:USERPROFILE\Downloads\ungoogled-chromium.7z" }
    6 { Invoke-WebRequest "https://gitlab.com/librewolf-community/browser/windows/uploads/4d3f15006bae10b14938f78f8d212d37/LibreWolf-100.0.1.en-US.win64.zip" -OutFile "$env:USERPROFILE\Downloads\LibreWolf.zip" }
    7 { Invoke-WebRequest "https://www.torproject.org/dist/win64/torbrowser/11.0.5/torbrowser-install-win64-11.0.5_en-US.exe" -OutFile "$env:USERPROFILE\Downloads\TorBrowser.exe" }
}

Write-Host "Download complete!" 
