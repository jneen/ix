lappend auto_path [pwd]/lib
puts $auto_path
package require ix
# bah!  the test proc needs to be in stdlib, guys
source [file dirname [info script]]/../deps/jimtcl/tests/testing.tcl

# build the tests list
set tests [lindex $argv 0]
if {$tests == ""} {set tests [glob ./test/*.test.tcl]}

# run the things!
foreach test $tests { source $test }

testreport
