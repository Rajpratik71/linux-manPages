gufw(8)                                                       System Manager's Manual                                                      gufw(8)

NAME
       Gufw - Graphic user interface for managing ufw

DESCRIPTION
       Gufw is an easy to use Ubuntu / Linux firewall, powered by ufw.

       Gufw  is an easy, intuitive, way to manage your Ubuntu firewall. It supports common tasks such as allowing or blocking pre-configured, com‐
       mon p2p, or individual ports port(s), and many others! Gufw is powered by ufw.  Introduction iptables is already a very  powerful  tool  by
       itself,  but  it's  syntax  can  get awkward at times and hard to figure out, so Ubuntu developers decided to make ufw ("The reason ufw was
       developed is that we wanted to create a server-level firewalling utility that was a little bit more for `human beings`"), which was  to  be
       simpler.  Now,  on  the graphical side of things, Firestarer already existed. But why not make an even easier to use GUI for desktop `human
       beings`, powered by ufw? This is where Gufw comes in.

USAGE
BASIC SETTINGS
       Gufw has two states: Enabled and disabled.  When Gufw is enabled, you can allow/reject/deny all incoming and outgoing connections.

ADD PRECONFIGURED RULE(S)
       You can select between more Programs and Services preconfigured.  Once Program/Service can have multiples rules.

REMOVE ONE RULE
       Steps:
          1. Select a rule in the list.
          2. Click in Remove button.  You can delete more rules if you select it.

RESET CONFIGURATION
       You will remove all rules and reset the ufw configuration to initial status (disable)!

EDIT PREFERENCES
       You can edit your preferences in /Edit/Preferences menu.

IP/PORTS FORWARD
       To routing policy and rules, you must setup IP forwarding:
          Close Gufw
          Uncomment the following lines in /etc/ufw/sysctl.conf:
             net/ipv4/ip_forward=1
             net/ipv6/conf/default/forwarding=1
             net/ipv6/conf/all/forwarding=1
          Restart firewall:
             ufw reload
          Open Gufw again: You'll see a new "Routed" option (with an arrow around the shield) and you can forward any rule from the Update  window
       or Advanced Tab in Add window.

USE GUFW WITHOUT GRAPHICAL ENVIRONMENT OR REMOTE COMPUTER
       You  can  use  Gufw  in  a Linux without Graphical Environment (for example an Ubuntu Server) or from a remote computer. You will need Gufw
       13.10.2 or higher. Just export your X Display. All the operations in Gufw will be apply in the remote computer.  Important: If  you  enable
       the firewall under ssh without the ssh rule, you'll close the ssh connection, then before to enable Gufw under a ssh connection, append the
       ssh rule using ufw with this command:
           sudo ufw enable ssh Linux, for example:
           Remote computer without graphic environment (IP = 192.168.1.102, Gufw installed and ssh server).
           Local Linux. In this local computer, open a Terminal and run this command:
             ssh user_remote@192.168.1.102 -X
             sudo /usr/bin/gufw-pkexec -ssh Windows (For example, Windows IP = 192.168.1.101; Linux IP = 192.168.1.100):
           Install Putty & Xming.
           In Windows: Run XLaunch from the Start Menu and check "No Access Control" in the last step.
           Connect to your Linux with Putty and run:
             export DISPLAY=192.168.1.101:0.0
             sudo /usr/bin/gufw-pkexec -ssh

SEE ALSO
       ufw(8) Official Documentation: https://help.ubuntu.com/community/Gufw

AUTHOR
       Gufw is (C) 2008-2015, Marcos Alvarez Costales <https://launchpad.net/~costales>.

       This manual page was originally written by Marcos Alvarez Costales <https://launchpad.net/~costales>.

                                                                 14 November 2014                                                          gufw(8)
