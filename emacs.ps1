if($args.Count -gt 0) {
    emacs.exe -nw $args[0]
} else {
    emacs.exe -nw
}
