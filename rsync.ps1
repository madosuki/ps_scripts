Param(
    [parameter(mandatory=$true)]$from,
    [parameter(mandatory=$true)]$to,
    [parameter(mandatory=$true)]$option
)

$fromEscaped = [regex]::escape($from)
$toEscaped = [regex]::escape($to)

$fromDecodePath = wsl wslpath $fromEscaped
$toDecodePath = wsl wslpath $toEscaped

wsl rsync $option $fromDecodePath $toDecodePath
