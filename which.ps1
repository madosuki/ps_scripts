param (
    # Parameter help description
    [Parameter(Mandatory=$true)]
    [String]
    $CommandName
)

Get-Command $CommandName | Select-Object "Source"