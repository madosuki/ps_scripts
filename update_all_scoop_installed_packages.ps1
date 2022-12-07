where.exe scoop /Q

if ($LASTEXITCODE -ne 0) {
    Write-Output "not found scoop from path"
    return
}



scoop update && scoop status | Select-Object -Property Name | ForEach-Object { scoop update $_.Name }