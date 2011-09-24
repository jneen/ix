# commands for typing in Command Mode

proc quit {} {
    set ::continueFlag 0
}
alias q quit

proc write {} {
    [$::currentWindow getBuffer] write
}
alias w write

proc wq {} { w; q }

proc edit {fname} {
    set buf [Buffer new]
    $buf initialize $fname

    set win [TextWindow new]
    $win initialize $buf

    $win show 0 0
    $win focus
    $win loop
}
alias e edit
