tracker-search(1)                                                                             User Commands                                                                             tracker-search(1)

NAME
       tracker-search - Search for content by type or across all types

SYNOPSIS
       tracker search [options...] [[expression1] ...]

DESCRIPTION
       tracker  search searches all indexed content for expression. The resource in which expression matches must exist (see --all for more information). All results are returned in ascending order. In
       all cases, if no expression is given for an argument (like --folders for example) then ALL items in that category are returned instead.

       expression
              One or more terms to search. The default operation is a logical AND.  For logical OR operations, see -r.

OPTIONS
       -f, --files
              Search for files of any type matching expression (optional).

       -s, --folders
              Search for folders matching expression (optional).

       -m, --music
              Search for music files matching expression (optional).

       --music-albums
              Search for music albums matching expression (optional).

       --music-artists
              Search for music artists matching expression (optional).

       -i, --images
              Search for images matching expression (optional).

       -v, --videos
              Search for videos matching expression (optional).

       -t, --documents
              Search for documents matching expression (optional).

       -e, --emails
              Search for emails matching expression (optional). Returns a list of subjects for emails found.

       -c, --contacts
              Search for contacts matching expression (optional). Returns a list of names and email addresses found.

       --software
              Search for software installed matching expression (optional). Returns a list of desktop files and application titles found.

       --software-categories
              Search for software categories matching expression (optional). Returns a list of urns and their categories (e.g. Settings, Video, Utility, etc).

       --feeds
              Search through RSS feed information matching expression (optional). Returns a list of those found.

       -b, --bookmarks
              Search through bookmarks matching expression (optional). Returns a list titles and links for each bookmark found.

       -l, --limit=<limit>
              Limit search to limit results. The default is 10 or 512 with --disable-snippets.

       -o, --offset=<offset>
              Offset the search results by offset. For example, start at item number 10 in the results. The default is 0.

       -r, --or-operator
              Use OR for search terms instead of AND (the default)

       -d, --detailed
              Show the unique URN associated with each search result. This does not apply to --music-albums and --music-artists.

       -a, --all
              Show results which might not be available. This might bebecause a removable media is not mounted for example. Without this option, resources are only shown  if  they  exist.  This  option
              applies to all command line switches except

       --disable-snippets
              Results  are  shown  with snippets. Snippets are context around the word that was searched for in the first place. This gives some idea of if the resource found is the right one. Snippets
              require Full Text Search to be compile time enabled AND to not be disabled with --disable-fts. Using --disable-snippets only shows the resources which  matched,  no  context  is  provided
              about where the match occurred.

       --disable-fts
              If  Full  Text  Search  (FTS)  is available, this option allows it to be disabled for one off searches. This returns results slightly using particular properties to match the search terms
              (like "nie:title") instead of looking for the search terms amongst ALL properties. It is more limiting to do this, but sometimes searching without FTS can yield better results if the  FTS
              ranking is off.

       --disable-color
              This disables any ANSI color use on the command line. By default this is enabled to make it easier to see results.

ENVIRONMENT
       TRACKER_SPARQL_BACKEND
              This option allows you to choose which backend you use for connecting to the database. This choice can limit your functionality. There are three settings.

              With "direct" the connection to the database is made directly to the file itself on the disk, there is no intermediary daemon or process. The "direct" approach is purely read-only.

              With  "bus"  the  tracker-store process is used to liase with the database queuing all requests and managing the connections via an IPC / D-Bus. This adds a small overhead BUT this is the
              only approach you can use if you want to write to the database.

              With "auto" the backend is decided for you, much like it would be if this environment variable was undefined.

       TRACKER_PRAGMAS_FILE
              Tracker has a fixed set of PRAGMA settings for creating its SQLite connection.  With this environment variable pointing to a text file you can override these settings. The file  is  a  \n
              separated list of SQLite queries to execute on any newly created SQLite connection in tracker-store.

SEE ALSO
       tracker-store(1), tracker-stats(1), tracker-tag(1), tracker-info(1).

GNU                                                                                             July 2009                                                                               tracker-search(1)
