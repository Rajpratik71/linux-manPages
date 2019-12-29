SETKEYCODES(8)                             Keyboard Support                             SETKEYCODES(8)

NAME
       setkeycodes - load kernel scancode-to-keycode mapping table entries

SYNOPSIS
       setkeycodes scancode keycode ...

DESCRIPTION
       The setkeycodes command reads its arguments two at a time, each pair of arguments consisting of
       a scancode (given in hexadecimal) and a keycode (given in decimal).  For  each  such  pair,  it
       tells the kernel keyboard driver to map the specified scancode to the specified keycode.

       This  command  is  useful only for people with slightly unusual keyboards, that have a few keys
       which produce scancodes that the kernel does not recognize.

THEORY
       The usual PC keyboard produces a series of scancodes for each key press and key release. (Scan‐
       codes  are  shown  by showkey -s, see showkey(1).)  The kernel parses this stream of scancodes,
       and converts it to a stream of keycodes (key press/release events).   (Keycodes  are  shown  by
       showkey.)   Apart  from  a few scancodes with special meaning, and apart from the sequence pro‐
       duced by the Pause key, and apart from shiftstate related scancodes, and  apart  from  the  key
       up/down  bit,  the  stream of scancodes consists of unescaped scancodes xx (7 bits) and escaped
       scancodes e0 xx (8+7 bits).  To these scancodes or scancode pairs, a corresponding keycode  can
       be assigned (in the range 1-127).  For example, if you have a Macro key that produces e0 6f ac‐
       cording to showkey(1), the command
              setkeycodes e06f 112
       will assign the keycode 112 to it, and then loadkeys(1) can be used to define the  function  of
       this key.

       Some  older kernels might hardwire a low scancode range to the equivalent keycodes; setkeycodes
       will fail when you try to remap these.

2.6 KERNELS
       In 2.6 kernels key codes lie in the range 1-255, instead of 1-127.  (It might be best  to  con‐
       fine oneself to the range 1-239.)

       In  2.6  kernels  raw  mode,  or  scancode  mode, is not very raw at all.  The code returned by
       showkey -s will change after use of setkeycodes.  A kernel bug. See also showkey(1).

OPTIONS
       None.

BUGS
       The keycodes of X have nothing to do with those of Linux.  Unusual keys can be made visible un‐
       der Linux, but not under X.

SEE ALSO
       dumpkeys (1), loadkeys (1), showkey (1), getkeycodes (8)

Local                                         8 Nov 1994                                SETKEYCODES(8)
