HOSTNAME(7)                Linux Programmer's Manual               HOSTNAME(7)



NNAAMMEE
       hostname - hostname resolution description

DDEESSCCRRIIPPTTIIOONN
       Hostnames are domains, where a domain is a hierarchical, dot-separated
       list of subdomains; for example, the machine "monet", in the "example"
       subdomain of the "com" domain would be represented as
       "monet.example.com".

       Each element of the hostname must be from 1 to 63 characters long and
       the entire hostname, including the dots, can be at most 253 characters
       long.  Valid characters for hostnames are AASSCCIIII(7) letters from _a to _z,
       the digits from _0 to _9, and the hyphen (-).  A hostname may not start
       with a hyphen.

       Hostnames are often used with network client and server programs, which
       must generally translate the name to an address for use.  (This task is
       generally performed by either ggeettaaddddrriinnffoo(3) or the obsolete
       ggeetthhoossttbbyynnaammee(3).)  Hostnames are resolved by the Internet name
       resolver in the following fashion.

       If the name consists of a single component, that is, contains no dot,
       and if the environment variable HHOOSSTTAALLIIAASSEESS is set to the name of a
       file, that file is searched for any string matching the input hostname.
       The file should consist of lines made up of two white-space separated
       strings, the first of which is the hostname alias, and the second of
       which is the complete hostname to be substituted for that alias.  If a
       case-insensitive match is found between the hostname to be resolved and
       the first field of a line in the file, the substituted name is looked
       up with no further processing.

       If the input name ends with a trailing dot, the trailing dot is
       removed, and the remaining name is looked up with no further
       processing.

       If the input name does not end with a trailing dot, it is looked up by
       searching through a list of domains until a match is found.  The
       default search list includes first the local domain, then its parent
       domains with at least 2 name components (longest first).  For example,
       in the domain cs.example.com, the name lithium.cchem will be checked
       first as lithium.cchem.cs.example and then as
       lithium.cchem.example.com.  lithium.cchem.com will not be tried, as
       there is only one component remaining from the local domain.  The
       search path can be changed from the default by a system-wide
       configuration file (see rreessoollvveerr(5)).

SSEEEE AALLSSOO
       ggeettaaddddrriinnffoo(3), ggeetthhoossttbbyynnaammee(3), rreessoollvveerr(5), mmaaiillaaddddrr(7), nnaammeedd(8)
       IETF RFC 1123 <http://www.ietf.org/rfc/rfc1123.txt> IETF RFC 1178
       <http://www.ietf.org/rfc/rfc1178.txt>

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



Linux                             2017-05-03                       HOSTNAME(7)
