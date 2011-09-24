# Window object.

class Window {
    win ""
    buffer ""
    dimensions {}
    cursor {}
}

Window method initialize {buf} {
    set buffer $buf
}

Window method show {} {
    ncurses.do {
        set win [stdscr window {*}[stdscr getmaxyx] 0 0]
        $win box
        $win puts {1 1} [$buffer getBuffer]
        ncurses.getc
    }
}
