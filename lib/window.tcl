# Window object.

class Window {
    masterWindow ""
    innerWindow ""
    buffer ""
    dimensions {}
    firstline 0
    cursor {}
}

Window method initialize {buf} {
    set buffer $buf
}

Window method show {row col} {
    ncurses.do {
        set masterWindow [stdscr window {*}[stdscr getmaxyx] $row $col]
        set innerHeight [- [$masterWindow height] 2]
        set innerWidth  [- [$masterWindow width] 2]
        set innerWindow [$masterWindow window $innerHeight $innerWidth 1 1]
        $masterWindow box

        $masterWindow puts "height: [$masterWindow height]"

        for {set i 0} {$i < [$innerWindow height]} {incr i} {
            set line [lindex [$buffer getBuffer] [+ $i $firstline]]

            # truncate the string and add a $ at the end
            if {[string length $line] > $innerWidth} {
                set line "[string range $line 0 [- $innerWidth 2]]\$"
            }

            $innerWindow puts [list $i 0] $line
        }

        $masterWindow getc
    }
}
