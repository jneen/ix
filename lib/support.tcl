foreach op {> >= < <= ==} {
    proc $op {x y} [list expr [list {$x} $op {$y}]]
}

proc eq {a b} {
    expr {$a == $b}
}

proc print {args} {
    puts -nonewline {*}$args
}

proc repeat {reps {varName {}} script} {
    if {$varName != ""} { upvar 1 $varName i }
    for {set i 0} {$i < $reps} {incr i} {
        uplevel 1 $script
    }
}

proc clamp {&var {min 0} max} {
    if {$var < $min} { set var $min }
    if {$var > $max} { set var $max }
}
