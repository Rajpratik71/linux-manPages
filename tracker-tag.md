tracker-tag(1)                                                                                User Commands                                                                                tracker-tag(1)

NAME
       tracker-tag - Add, remove and list tags.

SYNOPSIS
       tracker tag FILE1 [FILE2 ...] [-l <limit>] [-o <offset>] [-r]
       tracker tag -t [[TAG1] [TAG2] ...] [-s] [-r]
       tracker tag -a <TAG> [-e <description>]
       tracker tag -d <TAG>

DESCRIPTION
       List tags for local files or by the tag labels themselves if -t is used.

       It's also possible to manage tags with the -a and and -d options.

       The FILE argument can be either a local path or a URI. It also does not have to be an absolute path.

OPTIONS
       -t, --list
              List all tags. Results include the number of files associated with that tag and the tag's unique identifier. You can show the files associated with each tag by using --show-files.

              The TAG arguments are optional. If no TAG argument is specified, all tags are listed. If one or more TAGs are given, either matching tags are listed (OR condition). For example, this will
              match any tags named either foo, bar or baz:

              $ tracker-tag -t foo bar baz

       -s, --show-files
              Show the files associated with each tag. This option is ONLY available WITH the --list option.

       -a, --add=TAG
              Add a tag with the name TAG. If no FILE arguments are specified, the tag is simply created (if it didn'talready exist) and no files are associated with it. Multiple FILE arguments can  be
              specified.

       -d, --delete=TAG
              Delete a tag with the name TAG. If no FILE arguments are specified, the tag is deleted for ALL files. If FILE arguments are specified, only those files have the TAG deleted.

       -e, --description=STRING
              This option ONLY applies when using --add and provides a description to go with the tag label according to STRING.

       -l, --limit=N
              Limit search to N results. The default is 512.

       -o, --offset=N
              Offset the search results by N. For example, start at item number 10 in the results. The default is 0.

       -r, --and-operator
              Use AND operator for search terms instead of OR (the default). For example:

              $ tracker-tag -s -t sliff sloff

              Should show files in the database that have both the sliff and sloff tags.

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
       tracker-store(1), tracker-sparql(1), tracker-search(1), tracker-info(1).

GNU                                                                                             July 2009                                                                                  tracker-tag(1)
