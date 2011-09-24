# Buffer object.
# Caution:  may set your homework on fire.

package require aio

class Buffer {
    filename ""
    buffer ""
    position ""
}

Buffer method initialize {path} {
    set filename $path

    if {[file exists $path]} {
        set handle [open $path r]
        seek $handle 0
        set buffer [read $handle]
        split buffer "\n"
        close $handle
        unset handle
    }
}

Buffer method getBuffer {} {
    return [ref buffer "Buffer value"]
}

Buffer method write {} {
    # NB:  This will clobber anything that tries to get in its way.
    set handle [open $filename w\+]
    puts $handle $buffer
    close $handle
}
