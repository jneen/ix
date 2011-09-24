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


# - HELPER FUNCTIONS -------------------------

# Identity backend
proc identity { input } {
    return $input
}

