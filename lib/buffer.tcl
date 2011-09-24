# Buffer object.
# Caution:  may set your homework on fire.

package require aio

class Buffer {
    filename ""
    buffer ""
}

Buffer method initialize {path} {
    set filename $path

    if {[file exists $path]} {
        set handle [open $path r]
        seek $handle 0
        set buffer [split [read $handle] "\n"]
        close $handle
        unset handle
    }
}

Buffer method getBuffer {} {
    return $buffer
}

Buffer method setBuffer {newBuffer} {
    set buffer $newBuffer
}

Buffer method write {} {
    # NB:  This will clobber anything that tries to get in its way.
    set handle [open $filename w\+]
    puts -nonewline $handle $buffer
    close $handle
}
