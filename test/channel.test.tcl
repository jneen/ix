proc eq {a b} {
  expr {$a == $b}
}

test channel-1.1 "Creating a channel" {
  set channel [Channel new]
  $channel subscribers
} {}

test channel-1.2 "Subscribing to a channel" {
  set channel [Channel new]

  set body {a body}
  set argsList {a b c}

  set sub [$channel subscribe $argsList $body]

  set results {}

  lappend results [eq $sub [lindex [$channel subscribers] 0]]
  lappend results [eq $body [info body $sub]]
  lappend results [eq $argsList [info args $sub]]

  set results
} {1 1 1}

test channel-1.3 "Publishing to a channel" {
  set channel [Channel new]

  set flag 0

  $channel subscribe {&var val} {
    set var $val
  }

  $channel publish flag callbackArg

  set flag
} callbackArg
