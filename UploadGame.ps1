$confirmation = Read-Host "Are you sure you want to update Super Nostalgia Zone? (y/n)"

if ($confirmation -eq 'y') 
{
    Write-Output "Grabbing cookie..."
    
    $regKey = "HKCU:\Software\Roblox\RobloxStudioBrowser\roblox.com"
    $regVal = Get-ItemPropertyValue -Path $regKey -Name ".ROBLOSECURITY"
    $cookie = [regex]::Match($regVal, "COOK::<([^>]*)>") | ForEach-Object { $_.Groups[1].Value }
    
    Write-Output "Uploading core..."
    rojo upload --cookie "`"$cookie`"" --asset_id 14387585794 core.project.json
    
    Write-Output "Uploading shared..."
    rojo upload --cookie "$cookie" --asset_id 14387606388 shared.project.json
    
    Write-Output "Finished!"
}