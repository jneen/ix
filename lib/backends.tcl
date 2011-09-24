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
    if string equal input dd {
        # Delete line
    } elseif string equal input h {
        # Move left
    } elseif string equal input l {
        # Move right
    } elseif string equal input k {
        # Move up
    } elseif string equal input j {
        # Move down
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
    return input
}

