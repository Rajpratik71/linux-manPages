NETWOX(1)                                                     General Commands Manual                                                    NETWOX(1)

NAME
       netwox - examples/tools of the network library netwib

VERSION
       The version installed on this system is 5.39.0.

IMPORTANT
       Manpage do not contain a lot of information. Rather read netwox-5.39.0-doc_html.tgz.

SYNOPSIS
       netwox number [ parameters... ]
       netwox number --help
       netwox number --help2
       netwox

PRESENTATION
       Toolbox netwox helps to find and solve network problems.

       It provides 223 tools :
        - udp/tcp clients/servers
        - spoofing
        - sniffing
        - address conversion
        - etc.

       Netwox is mainly oriented towards network administrators and security auditors.

       Some tools are only a simplified implementation, while others are very sophisticated.

       Netwox is available under the GNU GPL license.

DESCRIPTION
       number number of the tool to use

       parameters
              parameters for the chosen tool number.  Parameter --help shows help.  Parameter --help2 shows description.

       When using netwox without number and parameters, it enters interactive help mode. In this mode, the user has to select a category by press‐
       ing a key. Then by choosing a tool number, its corresponding usage is displayed. Note: netwag is easier than interactive help mode.

EXAMPLES
       netwox 23 --help
              display simple help for tool number 23

       netwox 23 --help2
              display full description of tool 23. It also display its description.

       netwox 23
              run tool 23

       netwox 23 --extended
              run tool 23 with --extended parameter

       netwox 23 -e
              run tool 23 with -e parameter (synonym for --extended)

       All the tools are not described in this manpage.  Reading netwox-5.39.0-doc_html.tgz is recommended.

SEE ALSO
       netwib(3) netwag(1)

                                                                    08/07/2012                                                           NETWOX(1)
