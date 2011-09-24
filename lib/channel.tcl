package require oo

class Channel {
  subscribers {}
}

Channel method subscribe {args} {
  lappend subscribers [lambda {*}$args]
}

Channel method publish {args} {
  foreach sub $subscribers {
    $sub {*}$args
  }
}
