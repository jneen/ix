# Window object.

class Window {
    masterWindow ""
    innerWindow ""
    commandWindow ""
    buffer ""
    mode {}
    dimensions {}
    firstline 0
    cursor {0 0}
    defaultMode {}
}

Window method initialize {buf} {
    set buffer $buf
}

Window method puts {args} { $innerWindow puts {*}$args }
Window method height {args} { $innerWindow height {*}$args }
Window method width {args} { $innerWindow width {*}$args }

Window method show {row col} {
    stdscr clear

    set masterWindow [stdscr window {*}[stdscr getmaxyx] $row $col]
    set innerHeight [- [$masterWindow height] 2]
    set innerWidth  [- [$masterWindow width] 2]
    set innerWindow [$masterWindow window $innerHeight $innerWidth 1 1]
    set commandWindow [$masterWindow window 1 $innerWidth $innerHeight 1]

    $masterWindow box

    for {set i 0} {$i < [$innerWindow height]} {incr i} {
        set line [lindex [$buffer getBuffer] [+ $i $firstline]]

        # truncate the string and add a $ at the end
        if {[string length $line] > $innerWidth} {
            set line "[string range $line 0 [- $innerWidth 2]]\$"
        }

        $innerWindow puts [list $i 0] $line
    }

    $self setCursor {0 0}
}

Window method clearCommand {} {
    $commandWindow clear
}

Window method setCommand {str} {
    $self clearCommand
    $commandWindow puts :$str
}

Window method setMode {modeName} {
    set mode [$modeName new]
    $mode initialize $self
}

Window method setCursor {coords} {
    lassign $coords row col

    set cursor $coords

    set maxcol [+ -1 [string length [$buffer getLine $row]]]
    if {$maxcol < 0} {set maxcol 0}

    clamp col $maxcol
    clamp row [$innerWindow height]

    $innerWindow move $row $col
    $innerWindow refresh
}

Window method cursor {} { return $cursor }

Window method focus {} {
    set ::currentWindow $self
    $self setMode $defaultMode
    $self setCursor {0 0}
}

Window method getInput {} {
    $masterWindow getc
}

Window method loopStep {} {
    set input [$self getInput]
    $mode processKey $input
}

set ::continueFlag 1

Window method loop {} {
    while {$::continueFlag} { $self loopStep }
}

class TextWindow {Window} {
    defaultMode NormalMode
}

