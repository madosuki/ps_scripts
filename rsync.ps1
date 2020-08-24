Param(
    [parameter(mandatory=$true)]$from,
    [parameter(mandatory=$true)]$to
)

$fromEscaped = [regex]::escape($from)
$toEscaped = [regex]::escape($to)

$fromDecodePath = wsl wslpath $fromEscaped
$toDecodePath = wsl wslpath $toEscaped

wsl rsync -av $fromDecodePath $toDecodePath
