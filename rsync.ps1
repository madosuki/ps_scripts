Param(
    [string]$from,
    [string]$to,
    [string]$single_options,
    [string]$double_options,
    [string]$exclude_paths,
    [switch]$help
)

if($help) {
    Write-Output("this command is run rsync from wsl2.")
    Write-Output('example: rsync.ps1 -single_options "av" -exclude_paths "node_modules" -from "C:\Downloads" -to "D:\bak"')
    Write-Output('when use multi parameter, use ":".\n example: -single_options "archive:verbose"')
    return
}

$absoluteFromPath = Resolve-Path $from
$absoluteToPath = Resolve-Path $to

$fromEscaped = [regex]::escape($absoluteFromPath)
$toEscaped = [regex]::escape($absoluteToPath)

$fromDecodePath = wsl wslpath $fromEscaped
$toDecodePath = wsl wslpath $toEscaped

if($toDecodePath -eq $to) {
    Write-Output("non mounted partition at wsl. If that partition are fine, try run wsl -t Ubuntu; maybe solve.")
    return
}

$singleOptionList = ""
if($single_options -ne "") {
    foreach($i in $single_options.split(":")) {
        $singleOptionList = $singleOptionList + "-" + $i + " "
    }
}

$doubleOptionList = ""
if($double_options -ne "") {
    foreach($i in $double_options.split(":")) {
        $doubleOptionList = $doubleOptionList + "--" + $i + " "
    }
}

$excludePathList = ""
if($exclude_paths -ne "") {
    foreach($i in $exclude_paths.split(":")) {
        $excludePathList = $excludePathList + "--exclude=" + $i + " "
    }
} else {
    $excludePathList = " --exclude=node_modules "
}

$final = "wsl rsync " + $singleOptionList + $doubleOptionList + $fromDecodePath + " " + $toDecodePath + " " + $excludePathList

Write-Output("run " + $final)

Invoke-Expression($final)

Write-Output("done!")
