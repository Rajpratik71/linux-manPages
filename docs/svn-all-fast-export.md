SVN-ALL-FAST-EXPORT(1)                                        General Commands Manual                                       SVN-ALL-FAST-EXPORT(1)

NAME
       svn-all-fast-export - tool to convert svn repositories into git

SYNOPSIS
       svn-all-fast-export [options] [Path to subversion repository]

DESCRIPTION
       svn-all-fast-export is a tool to convert your svn repositories to git.

       You  will  need to have a copy of your svn repository and to write some rules to specify how the conversion will be done, for instance, you
       can manage how the tags and branches will be managed writing the appropriate  rules.  You  have  examples  in  /usr/share/doc/svn-all-fast-
       export/examples

       Path  to  subversion  repository is a backup copy of the subversion repository. Note that an svn url will not work due to the undistributed
       nature of svn.

OPTIONS
       --identity-map
              Provide map between svn username and email. You can provide a file mapping the old svn accounts to the authors names. This file must
              have a line per each svn account, you can use either the svn-all-fast-export native format:
              janesvnaccountname Jane Doe <jane.doe@example.com>
              or the git-svn format:
              janesvnaccountname = Jane Doe <jane.doe@example.com>

       --revisions-file
              Provide a file with revisions numbers that should be processed. This file should have one revision number per line.

       --rules
              The rules file that determines what goes where. See /usr/share/doc/svn-all-fast-export/examples for further details.

       --add-metadata
              If passed, each git commit will have svn commit info.

       --resume-from
              Start importing at svn revision number.

       --max-rev
              Stop importing at svn revision number.

       --dry-run
              Don't actually write anything.

       --debug-rules
              Print what rule is being used for each file.

       --commit-interval number
              If passed the cache will be flushed to git every number of commits.

       --stats
              After a run, print some statistics.

       --svn-branches
              Use the content of SVN when creating branches, Note: SVN tags are branches as well.

       -h, --help
              Show summary of options.

       -v, --version
              Show version of program.

RETURN VALUES
       This program returns 0 on success, on error something else (numbers in base 10):
       10 unrecognized option or missing argument
       11 no rules file specified

BUGS
       All  matching  rules  need  to  end with a '/', else the tool will crash at some point. The only exception are the rules using the recurse-
       action.

HOMEPAGE
       http://gitorious.org/svn2git

SEE ALSO
       http://techbase.kde.org/Projects/MoveToGit/UsingSvn2Git

AUTHORS
       svn-all-fast-export was written by Thiago Macieira and Thomas Zander.

                                                                  April 25, 2010                                            SVN-ALL-FAST-EXPORT(1)
