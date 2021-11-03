Param([int32]$num, [switch]$enable_symbol)
if (!$num) {
	Write-Output "require a argument of string size number"
	return
}

function GetCollection {
	if ($enable_symbol) {
		return 33..122
	}
	
	return (48..57) + (65..90) + (97..122) 
}

$collection = GetCollection

$charList = New-Object System.Collections.Generic.List[System.Object]
for ($i = 0; $i -lt $num; $i++) {
	$tmp = [char]($collection | Get-Random)
	$charList.Add($tmp)
}

$result = -join $charList

$result | Set-Clipboard
Write-Output $result
