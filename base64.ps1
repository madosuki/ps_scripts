param (
    [Parameter(Mandatory=$True)][String]$text = "",
    [switch]$decode
)

function Encode {
    param([string]$target)
    $byteArray = ([System.Text.Encoding]::Default).GetBytes($target)
    $encoded = [Convert]::ToBase64String($byteArray)
    Write-Host $encoded
}

function Decode {
    param (
        [string]$target
    )
    
    $byteArray = [Convert]::FromBase64String($target)
    $decoded = [System.Text.Encoding]::Default.GetString($byteArray)
    Write-Host $decoded
}

if ($decode) {
    Decode -target $text
} else {
    Encode -target $text
}