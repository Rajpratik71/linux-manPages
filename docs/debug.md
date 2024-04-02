debug(3tcl)                                                       debug narrative                                                      debug(3tcl)

__________________________________________________________________________________________________________________________________________________

NAME
       debug - debug narrative - core

SYNOPSIS
       package require Tcl  8.5

       package require debug  ?1.0.5?

       debug.tag message ?level?

       debug 2array

       debug define tag

       debug header text

       debug level tag ?level? ?fd?

       debug names

       debug off tag

       debug on tag

       debug parray arrayvarname

       debug pdict dict

       debug hexl data ?prefix?

       debug nl

       debug tab

       debug prefix tag ?text?

       debug setting (tag level) ... ?fd?

       debug suffix tag ?text?

       debug trailer text

__________________________________________________________________________________________________________________________________________________

DESCRIPTION
       Debugging  areas  of  interest  are  represented by 'tags' which have independently settable levels of interest (an integer, higher is more
       detailed).

API
       debug.tag message ?level?
              For each known tag the package creates a command with this signature the user can then use to provide the  debug  narrative  of  the
              tag.   The  narrative  message  is  provided as a Tcl script whose value is substed in the caller's scope if and only if the current
              level of interest for the tag matches or exceeds the call's level of detail.  This is useful, as one can place  arbitrarily  complex
              narrative in code without unnecessarily evaluating it.

              See methods level and setting for querying and manipulating the current level of detail for tags.

              The  actually  printed text consists of not only the message, but also global and tag-specific prefix and suffix, should they exist,
              with each line in the message having the specified headers and trailers.

              All these parts are substableTcl scripts, which are substituted once per message before assembly.

       debug 2array
              This method returns a dictionary mapping the names of all debug tags currently known to the package to their state  and  log  level.
              The  latter are encoded in a single numeric value, where a negative number indicates an inactive tag at the level given by the abso‐
              lute value, and a positive number is an active tag at that level.

              See also method settings below.

       debug define tag
              This method registers the named tag with the package.  If the tag was not known before it is placed in an inactive state. The  state
              of an already known tag is left untouched.

              The result of the method is the empty string.

       debug header text
              This method defines a global substable Tcl script which provides a text printed before each line of output.

              Note how this is tag-independent.

              Further note that the header substitution happens only once per actual printed message, i.e. all lines of the same message will have
              the same actual heading text.

              The result of the method is the specified text.

       debug level tag ?level? ?fd?
              This method sets the detail-level for the tag, and the channel fd to write the tags narration into.  The level is an  integer  value
              >= 0 defaulting to 1.  The channel defaults to stderr.

              The result of the method is the new detail-level for the tag.

       debug names
              This method returns a list containing the names of all debug tags currently known to the package.

       debug off tag
              This method registers the named tag with the package and sets it inactive.

              The result of the method is the empty string.

       debug on tag
              This method registers the named tag with the package, as active.

              The result of the method is the empty string.

       debug parray arrayvarname
              This  is  a  convenience  method  formatting the named array like the builtin command parray, except it returns the resulting string
              instead of writing it directly to stdout.

              This makes it suitable for use in debug messages.

       debug pdict dict
              This is a convenience method formatting the dictionary similarly to how the builtin command parray does for array, and  returns  the
              resulting string.

              This makes it suitable for use in debug messages.

       debug hexl data ?prefix?
              This is a convenience method formatting arbitrary data into a hex-dump and returns the resulting string.

              This makes it suitable for use in debug messages.

              Each line of the dump is prefixed with prefix. This prefix defaults to the empty string.

       debug nl
              This is a convenience method to insert a linefeed character (ASCII 0x0a) into a debug message.

       debug tab
              This is a convenience method to insert a TAB character (ASCII 0x09) into a debug message.

       debug prefix tag ?text?
              This  method  is similar to the method header above, in that it defines substable Tcl script which provides more text for debug mes‐
              sages.

              In contrast to header the generated text is added to the user's message before it is split  into  lines,  making  it  a  per-message
              extension.

              Furthermore the script is tag-dependent.

              In exception to that, a script for tag :: is applied to all messages.

              If both global and tag-dependent prefix exist, both are applied, with the global prefix coming before the tag-dependent prefix.

              Note that the prefix substitution happens only once per actual printed message.

              The result of the method is the empty string.

              If the tag was not known at the time of the call it is registered, and set inactive.

       debug setting (tag level) ... ?fd?
              This method is a multi-tag variant of method level above, with the functionality of methods on, and off also folded in.

              Each  named tag is set to the detail-level following it, with a negative level deactivating the tag, and a positive level activating
              it.

              If the last argument is not followed by a level it is not treated as tag name, but as the channel all the named  tags  should  print
              their messages to.

              The result of the method is the empty string.

       debug suffix tag ?text?
              This  method is similar to the method trailer below, in that it defines substable Tcl script which provides more text for debug mes‐
              sages.

              In contrast to trailer the generated text is added to the user's message before it is split into  lines,  making  it  a  per-message
              extension.

              Furthermore the script is tag-dependent.

              In exception to that, a script for tag :: is applied to all messages.

              If both global and tag-dependent suffix exist, both are applied, with the global suffix coming after the tag-dependent suffix.

              Note that the suffix substitution happens only once per actual printed message.

              The result of the method is the empty string.

              If the tag was not known at the time of the call it is registered, and set inactive.

       debug trailer text
              This method defines a global substable Tcl script which provides a text printed after each line of output (before the EOL however).

              Note how this is tag-independent.

              Further  note  that  the  trailer substitution happens only once per actual printed message, i.e. all lines of the same message will
              have the same actual trailing text.

              The result of the method is the specified text.

BUGS, IDEAS, FEEDBACK
       This document, and the package it describes, will undoubtedly contain bugs and other problems.  Please report such in the category debug of
       the  Tcllib Trackers [http://core.tcl.tk/tcllib/reportlist].  Please also report any ideas for enhancements you may have for either package
       and/or documentation.

KEYWORDS
       debug, log, narrative, trace

CATEGORY
       debugging, tracing, and logging

COPYRIGHT
       Copyright (c) 200?, Colin McCormack, Wub Server Utilities
       Copyright (c) 2012-2014, Andreas Kupries <andreas_kupries@users.sourceforge.net>

tcllib                                                                 1.0.5                                                           debug(3tcl)
