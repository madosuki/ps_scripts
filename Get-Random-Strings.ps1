Param($num)
if (!$num) {
	Write-Output "require a argument of string size number"
	return
}

-join ((48..57) + (65..90) + (97..122) | Get-Random -count $num | ForEach-Object { [char]$_} )
