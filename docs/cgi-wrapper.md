CGI-WRAPPER(1)                                                General Commands Manual                                               CGI-WRAPPER(1)

NAME
       cgi-wrapper - run CGI programs in a secured environment

DESCRIPTION
       The CGI-wrapper can be used to run certain CGI programs with a different userid then the webserver's userid. To function properly, the CGI-
       wrapper binary needs the su-bit. To prevent abuse, it has the necessary security checks. The  CGI-wrapper  can  only  be  executed  by  the
       Hiawatha webserver. It uses the Hiawatha PID-file for this verification.

CONFIGURATION
       The CGI-wrapper can be configured via the configuration file /etc/hiawatha/cgi-wrapper.conf. The following options are available:

       CGIhandler = <CGI handler>[, <CGI handler>, ...]
              Normally, only files inside the WebsiteRoot will be executed. CGI-handlers are usually not inside this directory. Use this option to
              specify binaries that are outside the WebsiteRoot and the CGI-wrapper is still allowed to execute.
              Example: CGIhandler = /usr/bin/php4-cgi

       Wrap = <wrap_id>;<path>|~<username>;<userid>[:<groupid>[, <groupid>, ...]]
              Via a Wrap-entry, you can control the CGI-wrapper. The <wrap_id> is  used  to  'bind'  it  to  a  virtual  host.  See  CGIwrapId  in
              hiawatha(1) for more information.
              The  second  option  specifies  the  rootdirectory  of the CGI program: it must be located with in this directory or a subdirectory.
              Specifiy a complete path or use the homedirectory of a user + "/public_html/" by specifing it's username preceded by a '~'. In  case
              of  a complete path, it's advisable to use the WebsiteRoot of the associated virtual host. When you specify a complete path, you can
              replace one slash by a pipe-sign. The part before the pipe-sign will be used for chroot. Be carefull with using  chrooted  CGI's  in
              combination with UserWebsite and Alias (see hiawatha(1) for more information about these options).
              The  last  options  are  userid  and  groupid of the CGI process. If the groupid is omitted, it will be looked up in /etc/passwd and
              /etc/group. The userid and groupid 'root' are not allowed here.
              Example: Wrap = test;/var/www/testsite;testuser
                       Wrap = jail;/usr/jail|sites/public;1001:101

              The CGI-wrapper needs Hiawatha's pidfile to work.

              Using "CGIwrapId = some_id" and "Wrap = some_id;~hugo;hugo" is the same as using "CGIwrapId = ~hugo".

       Most of the parameters in cgi-wrapper.conf are already present in hiawatha.conf. The reason why they have to be  specified  again  and  why
       they  are not being passed on by Hiawatha, is that when Hiawatha has a vulnerability, because of a bug in an external library of course :),
       the CGI-wrapper can't be used to execute every program on the disk. So it is done for a security reason.

SEE ALSO
       The CGI-wrapper is part of the Hiawatha webserver. See hiawatha(1) for more information about Hiawatha.

AUTHOR
       Hugo Leisink <hugo@hiawatha-webserver.org> - http://www.hiawatha-webserver.org/

                                                                                                                                    CGI-WRAPPER(1)
