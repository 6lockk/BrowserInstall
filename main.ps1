$validInput = $false
while ($validInput -eq $false) {
    Write-Host "Please select a browser to download:"
    Write-Host "1. Google Chrome"
    Write-Host "2. Mozilla Firefox"
    Write-Host "3. Chromium"
    Write-Host "4. Brave"
    Write-Host "5. Ungoogled Chromium"
    Write-Host "6. LibreWolf"
    Write-Host "7. Tor"

    $input = Read-Host -Prompt "Enter a number (1-7)"

    if ($input -in 1..7) {
        $validInput = $true
    }
}

# Download selected browser
switch ($input) {
    1 { 
        $url = "https://dl.google.com/chrome/install/standalone/enterprise/GoogleChromeEnterpriseBundle64.msi"
        $output = "$env:USERPROFILE\Downloads\GoogleChromeEnterpriseBundle64.msi"
    }
    2 { 
        $url = "https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=en-US"
        $output = "$env:USERPROFILE\Downloads\FirefoxSetup.exe"
    }
    3 { 
        $url = "https://github.com/Hibbiki/chromium-win64/releases/latest/download/chromium-win64.zip"
        $output = "$env:USERPROFILE\Downloads\chromium-win64.zip"
    }
    4 { 
        $url = "https://laptop-updates.brave.com/latest/winx64"
        $output = "$env:USERPROFILE\Downloads\BraveSetup.exe"
    }
    5 { 
        $url = "https://github.com/Eloston/ungoogled-chromium/releases/latest/download/ungoogled-chromium-94.0.4606.81-1.windows.7z"
        $output = "$env:USERPROFILE\Downloads\ungoogled-chromium.7z"
    }
    6 { 
        $url = "https://gitlab.com/librewolf-community/browser/windows/uploads/4d3f15006bae10b14938f78f8d212d37/LibreWolf-100.0.1.en-US.win64.zip"
        $output = "$env:USERPROFILE\Downloads\LibreWolf.zip"
    }
    7 { 
        $url = "https://www.torproject.org/dist/win64/torbrowser/11.0.5/torbrowser-install-win64-11.0.5_en-US.exe"
        $output = "$env:USERPROFILE\Downloads\TorBrowser.exe"
    }
}

try {
    Invoke-WebRequest $url -OutFile $output -ErrorAction Stop
    Write-Host "Download complete!"
} catch {
    if ($_.Exception.Response.StatusCode.Value__ -eq 404) {
        Write-Host "Error: The URL cannot be found."
    } else {
        Write-Host "Error: $_"
    }
}
