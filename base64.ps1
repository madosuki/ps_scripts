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
    $tmp = ""
    if ($decode) {
        $tmp = (Decode -target $text)
    } else {
        $tmp = (Encode -target $text)
    }
    Write-Output $tmp

    if ($result -ne "") {
        $result += "`r`n"
    }
    $result += $tmp
}

if ($clip) {
    $result | Set-Clipboard
}