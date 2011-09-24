proc eq {a b} {
    expr {$a == $b}
}

proc print {args} {
    puts -nonewline {*}$args
}
