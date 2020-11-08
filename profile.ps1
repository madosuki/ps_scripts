Import-Module PSReadLine
Set-PSReadlineOption -EditMode Emacs
Set-PSReadLineKeyHandler -Key Ctrl+d -Function DeleteChar
Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete