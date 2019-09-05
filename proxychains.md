proxychains(1)                                                                                                                      proxychains(1)

NAME
       ProxyChains - redirect connections through proxy servers

SYNTAX
       proxychains <program>

DESCRIPTION
       This program forces any tcp connection made by any given tcp client to follow through proxy (or proxy chain). It is a kind of proxifier.

       It acts like sockscap / premeo / eborder driver (intercepts TCP calls).

       This version (2.0) supports SOCKS4, SOCKS5 and HTTP CONNECT proxy servers.  Auth-types: socks - "user/pass" , http - "basic".

       When to use it ?

       1) When the only way to get "outside" from your LAN is through proxy server.

       2) When you are behind restrictive firewall which filters outgoing connections to some ports.

       3) When you want to use two (or more) proxies in chain:
       like: your_host <--> proxy1 <--> proxy2 <--> target_host

       4) When you want to "proxify" some programs with no proxy support built-in (like telnet).

       5) When you don't want to pay for eBorder / premeo socks driver :)

       Some cool features:
       * This program can mix different proxy types in the same chain

       like: your_host <-->socks5 <--> http <--> socks4 <--> http <--> target_host

       *  Different  chaining  options  supported      like:  take random proxy from the list.       or :   chain proxies in exact order      or :
       chain proxies in dynamic order (smart exclude dead proxies from chain)

       *You can use it with any TCP client application, even network scanners. yes, yes - you can make portscan via proxy (or chained proxies) for
       example with Nmap scanner by fyodor (www.insecure.org/nmap).

       proxychains nmap -sT -PO -p 80 -iR  (find some webservers through proxy)

       NOTE: to run suid/sgid programs(like ssh) through proxychains you have to be root

FILES
       proxychains looks for config file in following order:

        ./proxychains.conf

        $(HOME)/.proxychains/proxychains.conf

        /etc/proxychains.conf

       see more in /etc/proxychains.conf

EXAMPLES
       To run this program the standard way type:

       proxychains telnet targethost.com

       in this example it will run telnet through proxy(or chained proxies) specified by proxychains.conf

COPYING
       proxychains is distributed under the GNU General Public License.  (GPL 2.0 or greater).

AUTHORS
       Net Creature, Proxy Labs
       <http://proxychains.sourceforge.net>

<Net Creature>                                                          2.0                                                         proxychains(1)
