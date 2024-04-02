NODE(1)                BSD General Commands Manual               NODE(1)

NAME
     node — server-side JavaScript runtime

SYNOPSIS
     node [options] [v8-options] [-e string | script.js | -] [--]
          [arguments ...]
     node inspect [-e string | script.js | - | <host>:<port>] ...
     node [--v8-options]

DESCRIPTION
     Node.js is a set of libraries for JavaScript which allows it to be
     used outside of the browser.  It is primarily focused on creating
     simple, easy-to-build network clients and servers.

     Execute node without arguments to start a REPL.

OPTIONS
     -       Alias for stdin, analogous to the use of - in other com‐
             mand-line utilities.  The executed script is read from
             stdin, and remaining arguments are passed to the script.

     --      Indicate the end of command-line options.  Pass the rest of
             the arguments to the script.

             If no script filename or eval/print script is supplied
             prior to this, then the next argument will be used as a
             script filename.

     --abort-on-uncaught-exception
             Aborting instead of exiting causes a core file to be gener‐
             ated for analysis.

     --completion-bash
             Print source-able bash completion script for Node.js.

     --enable-fips
             Enable FIPS-compliant crypto at startup.  Requires Node.js
             to be built with ./configure --openssl-fips.

     --experimental-modules
             Enable experimental ES module support and caching modules.

     --experimental-repl-await
             Enable experimental top-level await keyword support in
             REPL.

     --experimental-vm-modules
             Enable experimental ES module support in VM module.

     --experimental-worker
             Enable experimental worker threads using worker_threads
             module.

     --force-fips
             Force FIPS-compliant crypto on startup (Cannot be disabled
             from script code).  Same requirements as --enable-fips.

     --icu-data-dir=file
             Specify ICU data load path.  Overrides NODE_ICU_DATA.

     --inspect-brk=[host:]port
             Activate inspector on host:port and break at start of user
             script.

     --inspect-port=[host:]port
             Set the host:port to be used when the inspector is acti‐
             vated.

     --inspect=[host:]port
             Activate inspector on host:port.  Default is
             127.0.0.1:9229.

             V8 Inspector integration allows attaching Chrome DevTools
             and IDEs to Node.js instances for debugging and profiling.
             It uses the Chrome DevTools Protocol.

     --loader=file
             Specify the file as a custom loader, to load
             --experimental-modules.

     --max-http-header-size=size
             Specify the maximum size of HTTP headers in bytes. Defaults
             to 8KB.

     --napi-modules
             This option is a no-op.  It is kept for compatibility.

     --no-deprecation
             Silence deprecation warnings.

     --no-force-async-hooks-checks
             Disable runtime checks for `async_hooks`.  These will still
             be enabled dynamically when `async_hooks` is enabled.

     --no-warnings
             Silence all process warnings (including deprecations).

     --openssl-config=file
             Load an OpenSSL configuration file on startup.  Among other
             uses, this can be used to enable FIPS-compliant crypto if
             Node.js is built with ./configure --openssl-fips.

     --pending-deprecation
             Emit pending deprecation warnings.

     --preserve-symlinks
             Instructs the module loader to preserve symbolic links when
             resolving and caching modules other than the main module.

     --preserve-symlinks-main
             Instructs the module loader to preserve symbolic links when
             resolving and caching the main module.

     --prof  Generate V8 profiler output.

     --prof-process
             Process V8 profiler output generated using the V8 option
             --prof.

     --redirect-warnings=file
             Write process warnings to the given file instead of print‐
             ing to stderr.

     --throw-deprecation
             Throw errors for deprecations.

     --title=title
             Specify process.title on startup.

     --tls-cipher-list=list
             Specify an alternative default TLS cipher list.  Requires
             Node.js to be built with crypto support. (Default)

     --trace-deprecation
             Print stack traces for deprecations.

     --trace-event-categories categories
             A comma-separated list of categories that should be traced
             when trace event tracing is enabled using
             --trace-events-enabled.

     --trace-event-file-pattern pattern
             Template string specifying the filepath for the trace event
             data, it supports ${rotation} and ${pid}.

     --trace-events-enabled
             Enable the collection of trace event tracing information.

     --trace-sync-io
             Print a stack trace whenever synchronous I/O is detected
             after the first turn of the event loop.

     --trace-warnings
             Print stack traces for process warnings (including depreca‐
             tions).

     --track-heap-objects
             Track heap object allocations for heap snapshots.

     --use-bundled-ca, --use-openssl-ca
             Use bundled Mozilla CA store as supplied by current Node.js
             version or use OpenSSL's default CA store.  The default
             store is selectable at build-time.

             The bundled CA store, as supplied by Node.js, is a snapshot
             of Mozilla CA store that is fixed at release time.  It is
             identical on all supported platforms.

             Using OpenSSL store allows for external modifications of
             the store.  For most Linux and BSD distributions, this
             store is maintained by the distribution maintainers and
             system administrators.  OpenSSL CA store location is depen‐
             dent on configuration of the OpenSSL library but this can
             be altered at runtime using environment variables.

             See SSL_CERT_DIR and SSL_CERT_FILE.

     --v8-options
             Print V8 command-line options.

     --v8-pool-size=num
             Set V8's thread pool size which will be used to allocate
             background jobs.  If set to 0 then V8 will choose an appro‐
             priate size of the thread pool based on the number of
             online processors.  If the value provided is larger than
             V8's maximum, then the largest value will be chosen.

     --zero-fill-buffers
             Automatically zero-fills all newly allocated Buffer and
             SlowBuffer instances.

     -c, --check
             Check the script's syntax without executing it.  Exits with
             an error code if script is invalid.

     -e, --eval string
             Evaluate string as JavaScript.

     -h, --help
             Print command-line options.  The output of this option is
             less detailed than this document.

     -i, --interactive
             Open the REPL even if stdin does not appear to be a termi‐
             nal.

     -p, --print string
             Identical to -e, but prints the result.

     -r, --require module
             Preload the specified module at startup.  Follows
             `require()`'s module resolution rules.  module may be
             either a path to a file, or a Node.js module name.

     -v, --version
             Print node's version.

ENVIRONMENT
     NODE_DEBUG modules...
             Comma-separated list of core modules that should print
             debug information.

     NODE_DISABLE_COLORS
             When set to 1, colors will not be used in the REPL.

     NODE_EXTRA_CA_CERTS file
             When set, the well-known “root” CAs (like VeriSign) will be
             extended with the extra certificates in file.  The file
             should consist of one or more trusted certificates in PEM
             format.

             If file is missing or misformatted, a message will be emit‐
             ted once using process.emitWarning(), but any errors are
             otherwise ignored.

             This environment variable is ignored when `node` runs as
             setuid root or has Linux file capabilities set.

     NODE_ICU_DATA file
             Data path for ICU (Intl object) data.  Will extend linked-
             in data when compiled with small-icu support.

     NODE_NO_WARNINGS
             When set to 1, process warnings are silenced.

     NODE_OPTIONS options...
             A space-separated list of command-line options, which are
             interpreted as if they had been specified on the command-
             line before the actual command (so they can be overridden).
             Node.js will exit with an error if an option that is not
             allowed in the environment is used, such as --print or a
             script file.

     NODE_PATH directories...
             A colon-separated list of directories prefixed to the mod‐
             ule search path.

     NODE_PENDING_DEPRECATION
             When set to 1, emit pending deprecation warnings.

     NODE_REDIRECT_WARNINGS file
             Write process warnings to the given file instead of print‐
             ing to stderr.  Equivalent to passing --redirect-warnings
             file on command-line.

     NODE_REPL_HISTORY file
             Path to the file used to store persistent REPL history.
             The default path is ~/.node_repl_history, which is overrid‐
             den by this variable.  Setting the value to an empty string
             ("" or " ") will disable persistent REPL history.

     OPENSSL_CONF file
             Load an OpenSSL configuration file on startup.  Among other
             uses, this can be used to enable FIPS-compliant crypto if
             Node.js is built with ./configure --openssl-fips.

             If the --openssl-config command-line option is used, this
             environment variable is ignored.

     SSL_CERT_DIR dir
             If --use-openssl-ca is enabled, this overrides and sets
             OpenSSL's directory containing trusted certificates.

     SSL_CERT_FILE file
             If --use-openssl-ca is enabled, this overrides and sets
             OpenSSL's file containing trusted certificates.

BUGS
     Bugs are tracked in GitHub Issues:
     https://github.com/nodejs/node/issues

COPYRIGHT
     Copyright Node.js contributors.  Node.js is available under the MIT
     license.

     Node.js also includes external libraries that are available under a
     variety of licenses.  See
     https://github.com/nodejs/node/blob/master/LICENSE for the full
     license text.

SEE ALSO
     Website: https://nodejs.org/

     Documentation: https://nodejs.org/api/

     GitHub repository & Issue Tracker: https://github.com/nodejs/node

     IRC (general questions): chat.freenode.net #node.js (unofficial)

     IRC (Node.js core development): chat.freenode.net #node-dev

AUTHORS
     Written and maintained by 1000+ contributors:
     https://github.com/nodejs/node/blob/master/AUTHORS

                            February 18, 2020
