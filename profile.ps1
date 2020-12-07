Import-Module PSReadLine
Set-PSReadlineOption -EditMode Emacs
Set-PSReadLineKeyHandler -Key Ctrl+d -Function DeleteChar
Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete

Set-Alias -name rmall -value Remove-Item -Recurse