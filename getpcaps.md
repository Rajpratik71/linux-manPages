GETPCAPS(1)                                    GETPCAPS                                    GETPCAPS(1)

NAME
       getpcaps - List Process Capabilities

SYNOPSIS
       getpcaps <pid> [<pid> ...]

DESCRIPTION
       getpcaps is a simple utility to display the capabilities on the queried process(es).  The
       capabilities are displayed in the cap_from_text(3) format, portions of which are reproduced in
       the section "TEXTUAL REPRESENTATION" below.

TEXTUAL REPRESENTATION
       A textual representation of capability sets consists of one or more whitespace-separated
       clauses.  Each clause specifies some operations on a capability set; the set starts out with
       all capabilities lowered, and the meaning of the string is the state of the capability set
       after all the clauses have been applied in order.

       Each clause consists of a list of comma-separated capability names (or the word `all'),
       followed by an action-list.  An action-list consists of a sequence of operator flag pairs.
       Legal operators are: `=', '+', and `-'.  Legal flags are: `e', `i', and `p'.  These flags are
       case-sensitive and specify the Effective, Inheritable and Permitted sets respectively.

       In the capability name lists, all names are case-insensitive.  The special name `all' specifies
       all capabilities; it is equivalent to a list naming every capability individually.

       Unnamed capabilities can also be specified by number. This feature ensures that libcap can
       support capabilities that were not allocated at the time libcap was compiled. However,
       generally upgrading libcap will add names for recently allocated capabilities.

       The `=' operator indicates that the listed capabilities are first reset in all three capability
       sets.  The subsequent flags (which are optional when associated with this operator) indicate
       that the listed capabilities for the corresponding set are to be raised.  For example: "all=p"
       means lower every capability in the Effective and Inheritable sets but raise all of the
       Permitted capabilities; or, "cap_fowner=ep" means raise the Effective and Permitted override-
       file-ownership capability, while lowering this Inheritable capability.

       In the case that the leading operator is `=', and no list of capabilities is provided, the
       action-list is assumed to refer to `all' capabilities.  For example, the following three
       clauses are equivalent to each other (and indicate a completely empty capability set): "all=";
       "="; "cap_chown,<every-other-capability>=".

       The operators, `+' and `-' both require an explicit preceding capability list and one or more
       explicit trailing flags.  The `+' operator will raise all of the listed capabilities in the
       flagged capability sets.  The `-' operator will lower all of the listed capabilities in the
       flagged capability sets.  For example: "all+p" will raise all of the Permitted capabilities;
       "cap_fowner+p-i" will raise the override-file-ownership capability in the Permitted capability
       set and lower this Inheritable capability; "cap_fowner+pe-i" and "cap_fowner=+pe" are
       equivalent.

FILES
       None

SEE ALSO
       cap_from_text(3).

COPYRIGHT
       Copyright © 1997-8,2007 Andrew G. Morgan  <morgan@kernel.org>

GETPCAPS                                      09/23/2011                                   GETPCAPS(1)
