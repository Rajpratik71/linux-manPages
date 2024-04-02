SECRET-TOOL(1)                                                                                  User Commands                                                                                  SECRET-TOOL(1)



NAME
       secret-tool - Store and retrieve passwords

SYNOPSIS
       secret-tool store --label='Label' {attribute} {value} ...

       secret-tool lookup {attribute} {value} ...

       secret-tool clear {attribute} {value} ...

       secret-tool search [--all]{attribute} {value} ...

DESCRIPTION
       secret-tool is a command line tool that can be used to store and retrieve passwords.

       Each password is stored in an item. Items are uniquely identified by a set of attribute keys and values. When storing a password you must specify unique pairs of attributes names and values, and
       when looking up a password you provide the same attribute name and value pairs.

STORE
       To store a password run secret-tool with the store argument. You must also specify a label for the password with the --label argument. This label will be displayed in the password manager.

       Make sure to pass a unique set of attributes names and values when storing a password. If the attributes match an already existing item, it will be updated instead of creating a new item.

       If invoked from a terminal or tty, then the password to store will be prompted for and only one line will be accepted.

       A password to store can also be piped in via stdin. The password will be the contents of stdin until EOF. If you provide a newline via stdin it will be stored as part of the password.

LOOKUP
       To lookup a password run secret-tool with the lookup argument. Specify the same same attribute names and value pairs that you passed when storing the password.

       If multiple items match the attribute provided, then the first password that is already unlocked will be returned. If necessary an item will be unlocked.

       When printing the password to a terminal or tty, an extra newline will be added after the password.

CLEAR
       To remove a password run secret-tool with the clear argument. Specify the same attribute name and value pairs that you passed when storing the password.

       All unlocked items that match the attributes will be removed.

SEARCH
       This command searches for and prints details on matching items in secret service. Specify the same attribute and value pairs that you passed in when storing the password. You can use the following
       options:

       --all
           Return all matching results, rather than just the one of the matches. Without this option, the first unlocked match returned from the service will be printed.

       --unlock
           Unlock items that are locked and then print out their details. Without this option, locked items are skipped.

EXIT STATUS
       On success 0 is returned, a non-zero failure code otherwise.

EXAMPLES
       Example 1. Storing, retrieving, and clearing a password

           $ secret-tool store --label='My password' key1 value1 key2 value2
           Password: My password

           $ secret-tool lookup key1 value1 key2 value2
           My password

           $ secret-tool clear key1 value1 key2 value2




XDG                                                                                                                                                                                            SECRET-TOOL(1)
