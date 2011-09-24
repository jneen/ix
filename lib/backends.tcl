package require oo

# -- BASE CLASSES -----------------CLASSES
# Base 'abstract' class
class Mode {
    name "base class"
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

NormalMode method processInput { input } {
    switch $input {
        dd {
            # Delete line
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
}

CommandMode method processInput { input } {
    # Process input
    switch $input {
        e {
            # Open file
        }
        w {
            # Save file
        }
        q {
            # Close window
        }
        
        default {
            # pass
        }
    }
}


# - HELPER FUNCTIONS -------------------------

# Identity backend
proc identity { input } {
    return $input
}

