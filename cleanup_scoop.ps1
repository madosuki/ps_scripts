where.exe scoop /Q

if ($LASTEXITCODE -ne 0) {
    Write-Output "not found scoop from path"
    return
}



scoop update && scoop list | Select-Object -Property Name | ForEach-Object { scoop cleanup $_.Name }