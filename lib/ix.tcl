lappend auto_path [file dirname [info script]]/../deps/jim-ncurses/lib

package require ncurses

set IX_LIB [file dirname [info script]]

source $IX_LIB/channel.tcl
source $IX_LIB/buffer.tcl

proc ix.run {} {
    set fooBuffer [Buffer new]
    $fooBuffer initialize "foobar.txt"

    ncurses.do {
        stdscr puts [$fooBuffer get buffer]
        ncurses.getc
    }
}
