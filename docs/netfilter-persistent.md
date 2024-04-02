netfilter-persistent(8)                                       System Manager's Manual                                      netfilter-persistent(8)

NAME
       netfilter-persistent - load, flush and save netfilter rule sets

SYNOPSIS
       netfilter-persistent start

       netfilter-persistent stop

       netfilter-persistent flush

       netfilter-persistent save

DESCRIPTION
       netfilter-persistent  uses  a  set of plugins to load, flush and save netfilter rules at boot and halt time.  Plugins can be written in any
       suitable language and stored in /usr/share/netfilter-persistent/plugins.d

OPTIONS
       start  Calls all plugins with the start argument, causing them to load their rules into netfilter.

       stop   If the configuration FLUSH_ON_STOP is enabled, calls all plugins with the flush argument, causing them to remove  their  rules  from
              netfilter.  Otherwise, emits a warning only.

       flush  Calls all plugins with the flush argument, causing them to remove their rules from netfilter.

       save   Calls all plugins with the save argument, causing them to save the currently-loaded rules to persistent storage.

PLUGINS
       Plugins  can  be written in any language and are merely executed by netfilter-persistent with a single argument.  All plugins are stored in
       /usr/share/netfilter-persistent/plugins.d

       Plugins must implement the start flush and save arguments and must not rely on additional arguments for other functionality.
       Plugins must return 0 on success and any other code on failure.

       Plugins are free to use and extend the configuration in /etc/default/netfilter-persistent and to implement their own configuration files.

FILES
       /etc/default/netfilter-persistent
              Main configuration file

       /usr/share/netfilter-persistent/plugins.d
              Plugin directory

COPYRIGHT
       Copyright (C) 2009 Simon Richter <sjr@debian.org>
       Copyright (C) 2010, 2014 Jonathan Wiltshire <jmw@debian.org>

       This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as  published  by
       the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

AUTHORS
       Jonathan Wiltshire <jmw@debian.org>

                                                                                                                           netfilter-persistent(8)
