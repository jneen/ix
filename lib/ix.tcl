lappend auto_path [file dirname [info script]]/../deps/jim-ncurses/lib

package require ncurses

set IX_LIB [file dirname [info script]]

source $IX_LIB/channel.tcl

proc ix.run {} {
  ncurses.do {
    stdscr puts "LOL"
    ncurses.getc
  }
}
