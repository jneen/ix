package require oo

# -- BASE CLASSES -----------------CLASSES
# Base 'abstract' class
class Mode {
    name "base class"
    window {}
}

Mode method initialize {win} {
    set window $win
}

Mode method switchMode modeName {
    set mode [$modeName new]
    $mode initialize $window
    $window setMode $mode
}

# -- CONCRETE CLASSES ----------------

# Normal Mode
class NormalMode Mode {
    name "normal"
}

NormalMode method processKey { input } {
    switch $input {
        i {
            # change Mode
        }

        h {
            lassign [$window cursor] row col
            if {$col > 0} {
                $window setCursor [list $row [- $col 1]]
            }
        }

        l {
            lassign [$window cursor] row col
            if {$col < [$window width]} {
                $window setCursor [list $row [+ $col 1]]
            }
        }

        k {
            lassign [$window cursor] row col
            if {$row > 0} {
                $window setCursor [list [- $row 1] $col]
            }
        }

        j {
            lassign [$window cursor] row col
            if {$row < [$window height]} {
                $window setCursor [list [+ $row 1] $col]
            }
        }

        : { $window setMode CommandMode }
        
        e {
            # To end of word
        }

        b {
            # To beginning of word
        }
    
        0 {
            # To beginning of line
        }
        
        $ {
            # To end of line
        }

        default {
            # pass
        }
    }
}

# Insert Mode
class InsertMode Mode {
    name "insert"
}

InsertMode method processInput { input } {
    # Process input... Will write later
}

# Command Mode 
class CommandMode Mode {
    name "command"
    contents ""
}

CommandMode method initialize {win} {
    set window $win
    $window setCommand ""
}

CommandMode method setContents {str} {
    set contents $str
    $window setCommand $contents
}

CommandMode method processKey { input } {
    # Process input
    switch $input {
        <Enter> {
            $self execute $contents
            $window setMode NormalMode
            $window clearCommand
        }

        <Backspace> {
            $self setContents [string range $contents 0 end-1]
        }

        default {
            $self setContents $contents$input
        }
    }
}

CommandMode method execute {command} {
    catch {uplevel #0 $command}
}

# - HELPER FUNCTIONS -------------------------

# Identity backend
proc identity { input } {
    return $input
}
