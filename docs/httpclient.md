httpclient(1)                                                 General Commands Manual                                                httpclient(1)

NAME
       httpclient - Shell command for performing HTTP requests using Ruby httpclient

SYNOPSIS
       httpclient <method> <uri> [params]

       httpclient

DESCRIPTION
       This program is an example/companion to the Ruby httpclient module, but can be used as a complete standalone HTTP client.

       If  invoked  with  a  method  and an URI, the specified URI will be requested via the method given from its server. The allowed methods are
       head, get, post, put, delete, options, propfind, proppatch and trace.

       Parameters can be specified as a third parameter and will be delivered accordingly (i.e. appended to the URI after a ? sign if  the  method
       is get, but as the posted body if the method is post)

       Please note that no checks are done as to whether the requested parameters make sense in the context they are specified, they are just sent
       as-is.

       $ httpclient get https://www.google.co.jp/ q=ruby

       Starting from version 2.6.0 httpclient supports command download.

       $ httpclient download http://host/path > file

       If no parameters are specified, an interactive Ruby (irb) session will be opened, binding an HTTPClient object as 'self'. You can then call
       HTTPClient instance methods like:

       $ httpclient
              >> get "https://www.google.co.jp/", :q => :ruby

       Httpclient  will  print the `wiredump' of your request (that is, the commands sent to the server via HTTP), then the request's headers, and
       finally the result.

OPTIONS
AUTHOR
       Gunnar Wolf <gwolf@debian.org>

NOTES
       This manual page was written by Gunnar Wolf <gwolf@debian.org> for the Debian project, but can be freely used by others.

       This is free documentation; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by  the
       Free Software Foundation; either version 2 of the License, or (at your option) any later version.

                                                                    2013-06-10                                                       httpclient(1)
