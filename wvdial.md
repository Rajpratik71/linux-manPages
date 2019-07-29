WVDIAL(1)                                                     General Commands Manual                                                    WVDIAL(1)

NAME
       wvdial - PPP dialer with built-in intelligence.

SYNOPSIS
       wvdial [ OPTIONS ] [ SECTION ] ...

DESCRIPTION
       wvdial is an intelligent PPP dialer, which means that it dials a modem and starts PPP in order to connect to the Internet.  It is something
       like the chat(8) program, except that it uses heuristics to guess how to dial and log into your server rather than forcing you to  write  a
       login script.

       When wvdial starts, it first loads its configuration from /etc/wvdial.conf and ~/.wvdialrc which contains basic information about the modem
       port, speed, and init string, along with information about your Internet Service Provider (ISP), such as the phone number,  your  username,
       and your password.

       Then  it  initializes  your  modem  and  dials the server and waits for a connection (a CONNECT string from the modem).  It understands and
       responds to typical connection problems (like BUSY and NO DIALTONE).

       Any time after connecting, wvdial will start PPP if it sees a PPP sequence from the server.  Otherwise, it tries to convince the server  to
       start PPP by doing the following:

       ·   responding to any login/password prompts it sees;

       ·   interpreting “choose one of the following”-style menus;

       ·   eventually, sending the word “ppp” (a common terminal server command).

       If  all of this fails, wvdial just runs pppd(8) and hopes for the best. It will bring up the connection, and then wait patiently for you to
       drop the link by pressing CTRL-C.

OPTIONS
       Several options are recognized by wvdial.

       -c, --chat
              Run wvdial as a chat replacement from within pppd, instead of the more normal method of having wvdial negotiate the  connection  and
              then call pppd.

       -C, --config=CONFIGFILE
              Run  wvdial  with CONFIGFILE as the configuration file, instead of /etc/wvdial.conf.  This is mainly useful only if you want to have
              per-user configurations, or you want to avoid having dial-up information (usernames, passwords, calling card  numbers,  etc.)  in  a
              system wide configuration file.

       -n, --no-syslog
              Don't output debug information to the syslog daemon (only useful together with --chat).

       wvdial  is  normally  run  without  command  line  options,  in which case it reads its configuration from the [Dialer Defaults] section of
       /etc/wvdial.conf.  (The configuration file is described in more detail in wvdial.conf(5) manual page.)

       One or more SECTIONs of /etc/wvdial.conf may be specified on the command line.  Settings  in  these  sections  will  override  settings  in
       [Dialer Defaults].

       For example, the command:
              wvdial phone2
       will  read  default  options  from  the  [Dialer Defaults] section, then override any or all of the options with those found in the [Dialer
       phone2] section.

       If more than one section is specified, they are processed in the order they are given.  Each section will override all  the  sections  that
       came before it.

       For example, the command:
              wvdial phone2 pulse shh
       will  read  default  options  from  the  [Dialer Defaults] section, then override any or all of the options with those found in the [Dialer
       phone2] section, followed by the [Dialer pulse] section, and lastly the [Dialer shh] section.

       Using this method, it is possible to easily configure wvdial to switch between different internet providers, modem  init  strings,  account
       names, and so on without specifying the same configuration information over and over.

BUGS
       “Intelligent”  programs are frustrating when they don't work right.  This version of wvdial has only minimal support for disabling or over‐
       riding its “intelligence”, with the “Stupid Mode”, “Login Prompt”, and “Password Prompt” options.  So, in general if you have a  nice  ISP,
       it will probably work, and if you have a weird ISP, it might not.

       Still,  it's  not much good if it doesn't work for you, right?  Don't be fooled by the fact that wvdial finally made it to version 1.00; it
       could well contain many bugs and misfeatures.  Let us know if you have problems by sending e-mail to <wvdial-list@lists.nit.ca>.

       You may encounter some error messages if you don't have write access to  /etc/ppp/pap-secrets  and  /etc/ppp/chap-secrets.   Unfortunately,
       there's really no nice way around this yet.

FILES
       /etc/wvdial.conf
              Configuration file which contains modem, dialing, and login information. See wvdial.conf(5).

       /dev/ttyS*
              Serial port devices.

       /etc/ppp/peers/wvdial
              Required for correct authentication in pppd version 2.3.0 or newer.

       /etc/ppp/{pap,chap}-secrets
              Contains a list of usernames and passwords used by pppd for authentication.  wvdial maintains this list automatically.

AUTHORS
       Dave  Coombs and Avery Pennarun for Net Integration Technologies.  We would also like to thank SuSE and RedHat for adding a number of vari‐
       ous cool features to wvdial.  Thanks guys!

SEE ALSO
       wvdial.conf(5), wvdialconf(1), pppd(8), chat(8).

WvDial                                                             December 2005                                                         WVDIAL(1)
