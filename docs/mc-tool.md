MC-TOOL(1)                                                           Utilities                                                          MC-TOOL(1)

NAME
       mc-tool - manipulate Mission Control accounts from the command line

SYNOPSIS
       mc-tool list

       mc-tool add PROFILE DISPLAY-NAME [PARAMETER-SETTINGS...]

       mc-tool add MANAGER/PROTOCOL [PARAMETER-SETTINGS...]

       mc-tool update ACCOUNT [PARAMETER-SETTINGS...]

       mc-tool display ACCOUNT DISPLAY-NAME

       mc-tool nick ACCOUNT NICKNAME

       mc-tool service ACCOUNT SERVICE-NAME

       mc-tool icon ACCOUNT ICON

       mc-tool show ACCOUNT

       mc-tool get ACCOUNT PARAMETER [PARAMETER...]

       mc-tool auto-presence ACCOUNT STATUS [MESSAGE]

       mc-tool request ACCOUNT STATUS [MESSAGE]

       mc-tool auto-connect ACCOUNT on|off

       mc-tool remove ACCOUNT

DESCRIPTION
       mc-tool's usage depends on its first argument (the "command")

   SPECIFYING ACCOUNTS
       Where an account name is needed, it may be given as a full object path (e.g.  /org/freedesktop/Telepathy/Account/gabble/jabber/example), or
       as the unique account-specific suffix (e.g.  gabble/jabber/example).

   SPECIFYING PARAMETER SETTINGS
       Many commands take arguments that represent Telepathy connection manager parameters (see the Telepathy Specification for details of these).
       Each argument has the following form:

       TYPE:NAME=VALUE

       where  TYPE  is either int, uint, bool, or string (other parameter types exist, but are currently unsupported by mc-tool), NAME is the name
       of the connection manager parameter (e.g.  account or password), and VALUE is the parameter's value (with integers in decimal, and booleans
       as 0 or 1).

       The update command also accepts arguments of the form clear:NAME which delete the named parameter from the account configuration.

   LIST
       mc-tool list lists the available accounts.

   ADD
       mc-tool  add  adds  an  account.  The  connection  manager and protocol can either be given as the name of a Mission Control profile, (e.g.
       gtalk), or as a slash-separated connection manager name and protocol (e.g.  gabble/jabber).

   DISPLAY
       mc-tool display ACCOUNT DISPLAY-NAME sets the DisplayName property of ACCOUNT to DISPLAY-NAME.

   NICK
       mc-tool nick ACCOUNT NICKNAME sets the Nickname property of ACCOUNT to NICKNAME.

   SERVICE
       mc-tool service ACCOUNT SERVICE-NAME sets the Service property of ACCOUNT to SERVICE-NAME.

   ICON
       mc-tool icon ACCOUNT ICON sets the Icon property of ACCOUNT to ICON.

   SHOW
       mc-tool show ACCOUNT shows information about ACCOUNT.

   GET
       mc-tool get ACCOUNT PARAMETER [PARAMETER...]  shows the values of the given parameters of ACCOUNT.

   ENABLE
       mc-tool enable ACCOUNT sets the Enabled property of ACCOUNT to True.

   DISABLE
       mc-tool disable ACCOUNT sets the Enabled property of ACCOUNT to False.

   AUTO-PRESENCE
       mc-tool auto-presence ACCOUNT STATUS [MESSAGE] sets the AutomaticPresence property of ACCOUNT to STATUS with optional message MESSAGE.

   REQUEST
       mc-tool request ACCOUNT STATUS [MESSAGE] sets the RequestedPresence property of ACCOUNT to STATUS with optional message  MESSAGE;  this  is
       how you tell an account to connect or go offline, for example.

   AUTO-CONNECT
       mc-tool  auto-connect  ACCOUNT  on  sets the ConnectAutomatically property of ACCOUNT to True.  mc-tool auto-connect ACCOUNT off sets it to
       False.

Telepathy                                                            July 2009                                                          MC-TOOL(1)
