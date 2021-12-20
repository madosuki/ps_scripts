param (
    [Parameter(Mandatory=$True)][String]$text = "",
    [switch]$decode,
    [switch]$clip
)

function Encode {
    param([string]$target)
    $byteArray = ([System.Text.Encoding]::Default).GetBytes($target)
    $encoded = [Convert]::ToBase64String($byteArray)
    return $encoded
}

function Decode {
    param ([string]$target)
    
    $byteArray = [Convert]::FromBase64String($target)
    $decoded = [System.Text.Encoding]::Default.GetString($byteArray)
    return $decoded
}

$result = ""
if ($decode) {
    $result = Decode -target $text
} else {
    $result = Encode -target $text
}

if ($clip) {
    $result | Set-Clipboard
}

Write-Output $result