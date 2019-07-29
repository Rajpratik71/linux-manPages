aa-clickquery:(1)                                                   March 2014                                                   aa-clickquery:(1)

NAME
       aa-clickquery - program for querying click-apparmor

DESCRIPTION
       This program is used to query click-apparmor for information.

USAGE
       aa-clickquery --click-framework=FRAMEWORK --query=QUERY

OPTIONS
       -h     show program's help

       -q QUERY | --query=QUERY
              The string to query. Specify 'help' for available query strings.

       --click-framework=FRAMEWORK
              Specify the click framework to query.

EXAMPLES
       Determine the policy version of a particular framework.

        $ aa-clickquery --click-framework=ubuntu-sdk-13.10 -q policy_version
        1.0

        $ aa-clickquery --click-framework=ubuntu-sdk-14.04-qml -q policy_version
        1.1

SEE ALSO
       apparmor(7) click(1)

March 2014                                                                                                                       aa-clickquery:(1)
