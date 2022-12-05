Param(
    [String]$dir
)

Set-Location $dir
git ls-files | select-string -Pattern "\.(ba)?sh$" | ForEach-Object { shellcheck $_ }