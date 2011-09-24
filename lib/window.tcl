# Window object.

class Window {
    win ""
    buffer ""
    dimensions {}
    firstline 0
    cursor {}
}

Window method initialize {buf} {
    set buffer $buf
}

Window method show {} {
    ncurses.do {
        set win [stdscr window {*}[stdscr getmaxyx] 0 0]
        $win box

        for {set i 0} {$i < [lindex [$win getmaxyx] 0]} {incr i} {
            $win puts [list [+ 1 $i] 1] [lindex [$buffer getBuffer] [+ $i $firstline]]
        }

        ncurses.getc
    }
}
