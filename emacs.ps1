if($args.Count -gt 0) {
    $arguments_str = $args -join " "
    # $args[0]
    emacs.exe -nw $arguments_str
} else {
    emacs.exe -nw
}
