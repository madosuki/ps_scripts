param (
    [Parameter(Mandatory, ValueFromPipeline)][string[]]$textArray,
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
foreach($text in $textArray) {
    if ($result -ne "") {
        $result += "`r`n"
    }

    if ($decode) {
        $result += (Decode -target $text)
    } else {
        $result += (Encode -target $text)
    }
}

Write-Output $result

if ($clip) {
    $result | Set-Clipboard
}