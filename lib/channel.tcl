# Channel class, for publishing and subscribing

package require oo

class Channel {
  subscribers {}
}

Channel method subscribers {} {
  return $subscribers
}

Channel method subscribe {args} {
  lappend subscribers [lambda {*}$args]
}

Channel method publish {args} {
  foreach sub $subscribers {
    uplevel 2 [list $sub {*}$args]
  }
}
