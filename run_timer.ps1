# timer_with_voice.exe is generate by `cargo build` on https://github.com/madosuki/timer-r

$get_command_result = $(where.exe timer_with_voice)

if (Test-Path($get_command_result)) {
    timer_with_voice.exe -f .\voice.wav $args
} else {
    Write-Output "not found timer_with_voice.exe"
}


