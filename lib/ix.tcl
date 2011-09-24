lappend auto_path [file dirname [info script]]/../deps/jim-ncurses/lib

package require ncurses

set IX_LIB [file dirname [info script]]

source $IX_LIB/support.tcl
source $IX_LIB/channel.tcl
source $IX_LIB/buffer.tcl
source $IX_LIB/window.tcl
source $IX_LIB/mode.tcl
source $IX_LIB/commands.tcl

proc ix.run {fname} {
    set fooBuffer [Buffer new]
    $fooBuffer initialize $fname

    ncurses.do {
        set fooWindow [TextWindow new]
        $fooWindow initialize $fooBuffer
        $fooWindow show 0 0
        $fooWindow focus
        $fooWindow loop
    }
}
