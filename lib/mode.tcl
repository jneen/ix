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


Mode method processInput { input } {
    # Process input
}

# -- CONCRETE CLASSES ----------------

# Normal Mode
class NormalMode Mode {
    name "normal"
}

# INTERFACE TO BUFFER
# ... Wait for Jordan
# Given a buffer, you can tell it:
# 

NormalMode method processKey { input } {
    switch $input {
        i {
            # change Mode
        }

        h {
            # Move left
        }

        l {
            # Move right
        }

        k {
            # Move up
        }

        j {
            # Move down
        }
        
        e {
            # To end of word
        }

        b {
            # To beginning of word
        }
    
        0 {
            # To beginning of line
        
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

CommandMode method processInput { input } {
    # Process input
    switch $input {
        <Enter> {
            $self execute $contents
            set contents ""
        }

        default {
            string append contents $input
            # pass
        }
    }
}

CommandMode method execute {command} {
    uplevel #0 $command
}

# - HELPER FUNCTIONS -------------------------

# Identity backend
proc identity { input } {
    return $input
}
