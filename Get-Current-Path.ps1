param (
    [switch]$clip
)

$path = Convert-Path .

if ($clip) {
    $path | Set-Clipboard
}

Write-Output $path
