lappend auto_path [file dirname [info script]]/../deps/jim-ncurses/lib

package require ncurses

proc ix.run {} {
  ncurses.do {
    stdscr puts "LOL"
    ncurses.getc
  }
}
