# Buffer object.
# Caution:  may set your homework on fire.

package require aio

class Buffer {
    name ""
    handle ""
    buffer ""
}

Buffer method initialize {path} {
    if {[file exists $path]} {
        set handle [open $path r]
        seek $handle 0
        set buffer [read $handle]
        close $handle
        unset handle
    }
}
