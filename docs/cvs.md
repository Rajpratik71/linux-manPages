CVS(1)                                                                                     General Commands Manual                                                                                     CVS(1)



NAME
       cvs - Concurrent Versions System

SYNOPSIS
       cvs [ cvs_options ]
              cvs_command [ command_options ] [ command_args ]

NOTE
       This  manpage  is  a summary of some of the features of cvs.  It is auto-generated from an appendix of the CVS manual.  For more in-depth documentation, please consult the Cederqvist manual (via the
       info CVS command or otherwise, as described in the SEE ALSO section of this manpage).  Cross-references in this man page refer to nodes in the same.

CVS commands
   Guide to CVS commands
       This appendix describes the overall structure of cvs commands, and describes some commands in detail (others are described elsewhere; for a quick reference to cvs commands, see node  `Invoking  CVS'
       in the CVS manual).


Structure
   Overall structure of CVS commands
       The overall format of all cvs commands is:


         cvs [ cvs_options ] cvs_command [ command_options ] [ command_args ]






       cvs

         The name of the cvs program.



       cvs_options

         Some options that affect all sub-commands of cvs.  These are described below.



       cvs_command

         One of several different sub-commands.  Some of the commands have aliases that can be used instead; those aliases are noted in the reference manual for that command.  There are only two situations
         where you may omit cvs_command: cvs -H elicits a list of available commands, and cvs -v displays version information on cvs itself.



       command_options

         Options that are specific for the command.



       command_args

         Arguments to the commands.

         There is unfortunately some confusion between cvs_options and command_options.  When given as a cvs_option, some options only affect some of the commands.  When given as a  command_option  it  may
         have a different meaning, and be accepted by more commands.  In other words, do not take the above categorization too seriously.  Look at the documentation instead.


Exit status
   CVS's exit status
       cvs  can indicate to the calling environment whether it succeeded or failed by setting its exit status.  The exact way of testing the exit status will vary from one operating system to another.  For
       example in a unix shell script the $? variable will be 0 if the last command returned a successful exit status, or greater than 0 if the exit status indicated failure.

       If cvs is successful, it returns a successful status; if there is an error, it prints an error message and returns a failure status.  The one exception to this is the  cvs  diff  command.   It  will
       return  a  successful  status if it found no differences, or a failure status if there were differences or if there was an error.  Because this behavior provides no good way to detect errors, in the
       future it is possible that cvs diff will be changed to behave like the other cvs commands.


~/.cvsrc
   Default options and the ~/.cvsrc file
       There are some command_options that are used so often that you might have set up an alias or some other means to make sure you always specify that option.  One example (the one that drove the imple-
       mentation  of  the  .cvsrc  support,  actually)  is that many people find the default output of the diff command to be very hard to read, and that either context diffs or unidiffs are much easier to
       understand.

       The ~/.cvsrc file is a way that you can add default options to cvs_commands within cvs, instead of relying on aliases or other shell scripts.

       The format of the ~/.cvsrc file is simple.  The file is searched for a line that begins with the same name as the cvs_command being executed.  If a match is found, then the remainder of the line  is
       split up (at whitespace characters) into separate options and added to the command arguments before any options from the command line.

       If  a  command  has two names (e.g., checkout and co), the official name, not necessarily the one used on the command line, will be used to match against the file.  So if this is the contents of the
       user's ~/.cvsrc file:


         log -N
         diff -uN
         rdiff -u
         update -Pd
         checkout -P
         release -d




       the command cvs checkout foo would have the -P option added to the arguments, as well as cvs co foo.

       With the example file above, the output from cvs diff foobar will be in unidiff format.  cvs diff -c foobar will provide context diffs, as usual.  Getting "old" format diffs would be  slightly  more
       complicated, because diff doesn't have an option to specify use of the "old" format, so you would need cvs -f diff foobar.

       In place of the command name you can use cvs to specify global options (see node `Global options' in the CVS manual).  For example the following line in .cvsrc


         cvs -z6




       causes cvs to use compression level 6.


Global options
       The available cvs_options (that are given to the left of cvs_command) are:



       --allow-root=rootdir

         May  be  invoked  multiple  times to specify one legal cvsroot directory with each invocation.  Also causes CVS to preparse the configuration file for each specified root, which can be useful when
         configuring write proxies,  See see node `Password authentication server' in the CVS manual & see node `Write proxies' in the CVS manual.



       -a

         Authenticate all communication between the client and the server.  Only has an effect on the cvs client.  As of this writing, this is only implemented when using  a  GSSAPI  connection  (see  node
         `GSSAPI authenticated' in the CVS manual).  Authentication prevents certain sorts of attacks involving hijacking the active tcp connection.  Enabling authentication does not enable encryption.



       -b bindir

         In  cvs  1.9.18  and  older,  this specified that rcs programs are in the bindir directory.  Current versions of cvs do not run rcs programs; for compatibility this option is accepted, but it does
         nothing.



       -T tempdir

         Use tempdir as the directory where temporary files are located.  Overrides the setting of the $TMPDIR environment variable and any precompiled directory.  This parameter should be specified as  an
         absolute pathname.  (When running client/server, -T affects only the local process; specifying -T for the client has no effect on the server and vice versa.)



       -d cvs_root_directory

         Use cvs_root_directory as the root directory pathname of the repository.  Overrides the setting of the $CVSROOT environment variable.  see node `Repository' in the CVS manual.



       -e editor

         Use  editor  to enter revision log information.  Overrides the setting of the $CVSEDITOR and $EDITOR environment variables.  For more information, see see node `Committing your changes' in the CVS
         manual.



       -f

         Do not read the ~/.cvsrc file.  This option is most often used because of the non-orthogonality of the cvs option set.  For example, the cvs log option -N (turn off display of tag names) does  not
         have a corresponding option to turn the display on.  So if you have -N in the ~/.cvsrc entry for log, you may need to use -f to show the tag names.



       -H




       --help

         Display usage information about the specified cvs_command (but do not actually execute the command).  If you don't specify a command name, cvs -H displays overall help for cvs, including a list of
         other help options.



       -R

         Turns on read-only repository mode.  This allows one to check out from a read-only repository, such as within an anoncvs server, or from a cd-rom repository.

         Same effect as if the CVSREADONLYFS environment variable is set. Using -R can also considerably speed up checkouts over NFS.



       -n

         Do not change any files.  Attempt to execute the cvs_command, but only to issue reports; do not remove, update, or merge any existing files, or create any new files.

         Note that cvs will not necessarily produce exactly the same output as without -n.  In some cases the output will be the same, but in other cases cvs will skip some of  the  processing  that  would
         have been required to produce the exact same output.



       -Q

         Cause the command to be really quiet; the command will only generate output for serious problems.



       -q

         Cause the command to be somewhat quiet; informational messages, such as reports of recursion through subdirectories, are suppressed.



       -r

         Make  new working files read-only.  Same effect as if the $CVSREAD environment variable is set (see node `Environment variables' in the CVS manual).  The default is to make working files writable,
         unless watches are on (see node `Watches' in the CVS manual).



       -s variable=value

         Set a user variable (see node `Variables' in the CVS manual).



       -t

         Trace program execution; display messages showing the steps of cvs activity.  Particularly useful with -n to explore the potential impact of an unfamiliar command.



       -v




       --version

         Display version and copyright information for cvs.



       -w

         Make new working files read-write.  Overrides the setting of the $CVSREAD environment variable.  Files are created read-write by default, unless $CVSREAD is set or -r is given.



       -x

         Encrypt all communication between the client and the server.  Only has an effect on the cvs client.  As of this writing, this is only implemented when using a GSSAPI connection (see  node  `GSSAPI
         authenticated'  in the CVS manual) or a Kerberos connection (see node `Kerberos authenticated' in the CVS manual).  Enabling encryption implies that message traffic is also authenticated.  Encryp-
         tion support is not available by default; it must be enabled using a special configure option, --enable-encryption, when you build cvs.



       -z gzip-level

         Set the compression level.  Valid levels are 1 (high speed, low compression) to 9 (low speed, high compression), or 0 to disable compression (the default).  Only has an effect on the cvs client.



Common options
   Common command options
       This section describes the command_options that are available across several cvs commands.  These options are always given to the right of cvs_command. Not all commands support all of these options;
       each  option  is  only  supported for commands where it makes sense.  However, when a command has one of these options you can almost always count on the same behavior of the option as in other com-
       mands.  (Other command options, which are listed with the individual commands, may have different behavior from one cvs command to the other).

       Note: the history command is an exception; it supports many options that conflict even with these standard options.



       -D date_spec

         Use the most recent revision no later than date_spec.  date_spec is a single argument, a date description specifying a date in the past.

         The specification is sticky when you use it to make a private copy of a source file; that is, when you get a working file using -D, cvs records the date you specified, so that further  updates  in
         the same directory will use the same date (for more information on sticky tags/dates, see node `Sticky tags' in the CVS manual).

         -D  is  available  with  the annotate, checkout, diff, export, history, ls, rdiff, rls, rtag, tag, and update commands.  (The history command uses this option in a slightly different way; see node
         `history options' in the CVS manual).

         For a complete description of the date formats accepted by cvs, see node `Date input formats' in the CVS manual.

         Remember to quote the argument to the -D flag so that your shell doesn't interpret spaces as argument separators.  A command using the -D flag can look like this:


           $ cvs diff -D "1 hour ago" cvs.texinfo






       -f

         When you specify a particular date or tag to cvs commands, they normally ignore files that do not contain the tag (or did not exist prior to the date) that you specified.  Use the -f option if you
         want files retrieved even when there is no match for the tag or date.  (The most recent revision of the file will be used).

         Note that even with -f, a tag that you specify must exist (that is, in some file, not necessary in every file).  This is so that cvs will continue to give an error if you mistype a tag name.

         -f is available with these commands: annotate, checkout, export, rdiff, rtag, and update.

         WARNING:   The commit and remove commands also have a -f option, but it has a different behavior for those commands.  See see node `commit options' in the CVS manual, and see node `Removing files'
         in the CVS manual.



       -k kflag

         Override the default processing of RCS keywords other than -kb.  see node `Keyword substitution' in the CVS manual, for the meaning of kflag.  Used with the  checkout  and  update  commands,  your
         kflag  specification  is  sticky;  that  is, when you use this option with a checkout or update command, cvs associates your selected kflag with any files it operates on, and continues to use that
         kflag with future commands on the same files until you specify otherwise.

         The -k option is available with the add, checkout, diff, export, import and update commands.

         WARNING: Prior to CVS version 1.12.2, the -k flag overrode the -kb indication for a binary file.  This could sometimes corrupt binary files.  see node `Merging and keywords' in the CVS manual, for
         more.



       -l

         Local; run only in current working directory, rather than recursing through subdirectories.

         Available with the following commands: annotate, checkout, commit, diff, edit, editors, export, log, rdiff, remove, rtag, status, tag, unedit, update, watch, and watchers.



       -m message

         Use message as log information, instead of invoking an editor.

         Available with the following commands: add, commit and import.



       -n

         Do not run any tag program.  (A program can be specified to run in the modules database (see node `modules' in the CVS manual); this option bypasses it).

         Note: this is not the same as the cvs -n program option, which you can specify to the left of a cvs command!

         Available with the checkout, commit, export, and rtag commands.



       -P

         Prune empty directories.  See see node `Removing directories' in the CVS manual.



       -p

         Pipe the files retrieved from the repository to standard output, rather than writing them in the current directory.  Available with the checkout and update commands.



       -R

         Process directories recursively.  This is the default for all cvs commands, with the exception of ls & rls.

         Available with the following commands: annotate, checkout, commit, diff, edit, editors, export, ls, rdiff, remove, rls, rtag, status, tag, unedit, update, watch, and watchers.



       -r tag




       -r tag[:date]

         Use  the  revision  specified  by the tag argument (and the date argument for the commands which accept it) instead of the default head revision.  As well as arbitrary tags defined with the tag or
         rtag command, two special tags are always available: HEAD refers to the most recent version available in the repository, and BASE refers to the revision you last checked out into the current work-
         ing directory.

         The  tag specification is sticky when you use this with checkout or update to make your own copy of a file: cvs remembers the tag and continues to use it on future update commands, until you spec-
         ify otherwise (for more information on sticky tags/dates, see node `Sticky tags' in the CVS manual).

         The tag can be either a symbolic or numeric tag, as described in see node `Tags' in the CVS manual, or the name of a branch, as described in see node `Branching and merging'  in  the  CVS  manual.
         When tag is the name of a branch, some commands accept the optional date argument to specify the revisions as of the given date on the branch.

         Specifying the -q global option along with the -r command option is often useful, to suppress the warning messages when the rcs file does not contain the specified tag.

         Note: this is not the same as the overall cvs -r option, which you can specify to the left of a cvs command!

         -r tag is available with the commit and history commands.

         -r tag[:date] is available with the annotate, checkout, diff, export, rdiff, rtag, and update commands.



       -W

         Specify  file  names  that  should be filtered.  You can use this option repeatedly.  The spec can be a file name pattern of the same type that you can specify in the .cvswrappers file.  Available
         with the following commands: import, and update.



admin
   Administration
       · Requires: repository, working directory.

       · Changes: repository.

       · Synonym: rcs

         This is the cvs interface to assorted administrative facilities.  Some of them have questionable usefulness for cvs but exist for historical purposes.  Some of the questionable options are  likely
         to disappear in the future.  This command does work recursively, so extreme care should be used.

         On unix, if there is a group named cvsadmin, only members of that group can run cvs admin commands, except for those specified using the UserAdminOptions configuration option in the CVSROOT/config
         file.  Options specified using UserAdminOptions can be run by any user.  See see node `config' in the CVS manual for more on UserAdminOptions.

         The cvsadmin group should exist on the server, or any system running the non-client/server cvs.  To disallow cvs admin for all users, create a group with no users in it.  On NT, the cvsadmin  fea-
         ture does not exist and all users can run cvs admin.


admin options
       Some of these options have questionable usefulness for cvs but exist for historical purposes.  Some even make it impossible to use cvs until you undo the effect!



       -Aoldfile

         Might not work together with cvs.  Append the access list of oldfile to the access list of the rcs file.



       -alogins

         Might not work together with cvs.  Append the login names appearing in the comma-separated list logins to the access list of the rcs file.



       -b[rev]

         Set  the default branch to rev.  In cvs, you normally do not manipulate default branches; sticky tags (see node `Sticky tags' in the CVS manual) are a better way to decide which branch you want to
         work on.  There is one reason to run cvs admin -b: to revert to the vendor's version when using vendor branches (see node `Reverting local changes' in the CVS  manual).   There  can  be  no  space
         between -b and its argument.



       -cstring

         Sets  the comment leader to string.  The comment leader is not used by current versions of cvs or rcs 5.7.  Therefore, you can almost surely not worry about it.  see node `Keyword substitution' in
         the CVS manual.



       -e[logins]

         Might not work together with cvs.  Erase the login names appearing in the comma-separated list logins from the access list of the RCS file.  If logins is omitted, erase  the  entire  access  list.
         There can be no space between -e and its argument.



       -I

         Run interactively, even if the standard input is not a terminal.  This option does not work with the client/server cvs and is likely to disappear in a future release of cvs.



       -i

         Useless with cvs.  This creates and initializes a new rcs file, without depositing a revision.  With cvs, add files with the cvs add command (see node `Adding files' in the CVS manual).



       -ksubst

         Set the default keyword substitution to subst.  see node `Keyword substitution' in the CVS manual.  Giving an explicit -k option to cvs update, cvs export, or cvs checkout overrides this default.



       -l[rev]

         Lock  the  revision  with  number  rev.   If  a branch is given, lock the latest revision on that branch.  If rev is omitted, lock the latest revision on the default branch.  There can be no space
         between -l and its argument.

         This can be used in conjunction with the rcslock.pl script in the contrib directory of the cvs source distribution to provide reserved checkouts (where only one user can be editing a given file at
         a  time).  See the comments in that file for details (and see the README file in that directory for disclaimers about the unsupported nature of contrib).  According to comments in that file, lock-
         ing must set to strict (which is the default).



       -L

         Set locking to strict.  Strict locking means that the owner of an RCS file is not exempt from locking for checkin.  For use with cvs, strict locking must be set; see the discussion  under  the  -l
         option above.



       -mrev:msg

         Replace the log message of revision rev with msg.



       -Nname[:[rev]]

         Act like -n, except override any previous assignment of name.  For use with magic branches, see see node `Magic branch numbers' in the CVS manual.



       -nname[:[rev]]

         Associate  the  symbolic  name  name with the branch or revision rev.  It is normally better to use cvs tag or cvs rtag instead.  Delete the symbolic name if both : and rev are omitted; otherwise,
         print an error message if name is already associated with another number.  If rev is symbolic, it is expanded before association.  A rev consisting of a branch number followed by a  .  stands  for
         the  current latest revision in the branch.  A : with an empty rev stands for the current latest revision on the default branch, normally the trunk.  For example, cvs admin -nname: associates name
         with the current latest revision of all the RCS files; this contrasts with cvs admin -nname:$ which associates name with the revision numbers extracted from keyword strings  in  the  corresponding
         working files.



       -orange

         Deletes (outdates) the revisions given by range.

         Note that this command can be quite dangerous unless you know exactly what you are doing (for example see the warnings below about how the rev1:rev2 syntax is confusing).

         If  you are short on disc this option might help you.  But think twice before using it—there is no way short of restoring the latest backup to undo this command!  If you delete different revisions
         than you planned, either due to carelessness or (heaven forbid) a cvs bug, there is no opportunity to correct the error before the revisions are deleted.  It probably  would  be  a  good  idea  to
         experiment on a copy of the repository first.

         Specify range in one of the following ways:


         rev1::rev2

           Collapse  all  revisions  between  rev1 and rev2, so that cvs only stores the differences associated with going from rev1 to rev2, not intermediate steps.  For example, after -o 1.3::1.5 one can
           retrieve revision 1.3, revision 1.5, or the differences to get from 1.3 to 1.5, but not the revision 1.4, or the differences between 1.3 and 1.4.  Other examples: -o  1.3::1.4  and  -o  1.3::1.3
           have no effect, because there are no intermediate revisions to remove.


         ::rev

           Collapse  revisions  between  the  beginning  of the branch containing rev and rev itself.  The branchpoint and rev are left intact.  For example, -o ::1.3.2.6 deletes revision 1.3.2.1, revision
           1.3.2.5, and everything in between, but leaves 1.3 and 1.3.2.6 intact.


         rev::

           Collapse revisions between rev and the end of the branch containing rev.  Revision rev is left intact but the head revision is deleted.


         rev

           Delete the revision rev.  For example, -o 1.3 is equivalent to -o 1.2::1.4.


         rev1:rev2

           Delete the revisions from rev1 to rev2, inclusive, on the same branch.  One will not be able to retrieve rev1 or rev2 or any of the revisions in between.  For  example,  the  command  cvs  admin
           -oR_1_01:R_1_02  . is rarely useful.  It means to delete revisions up to, and including, the tag R_1_02.  But beware!  If there are files that have not changed between R_1_02 and R_1_03 the file
           will have the same numerical revision number assigned to the tags R_1_02 and R_1_03.  So not only will it be impossible to retrieve R_1_02; R_1_03 will also have to be restored from  the  tapes!
           In most cases you want to specify rev1::rev2 instead.


         :rev

           Delete revisions from the beginning of the branch containing rev up to and including rev.


         rev:

           Delete revisions from revision rev, including rev itself, to the end of the branch containing rev.

           None of the revisions to be deleted may have branches or locks.

           If  any of the revisions to be deleted have symbolic names, and one specifies one of the :: syntaxes, then cvs will give an error and not delete any revisions.  If you really want to delete both
           the symbolic names and the revisions, first delete the symbolic names with cvs tag -d, then run cvs admin -o.  If one specifies the non-:: syntaxes, then cvs will delete the revisions but  leave
           the  symbolic  names pointing to nonexistent revisions.  This behavior is preserved for compatibility with previous versions of cvs, but because it isn't very useful, in the future it may change
           to be like the :: case.

           Due to the way cvs handles branches rev cannot be specified symbolically if it is a branch.  see node `Magic branch numbers' in the CVS manual, for an explanation.

           Make sure that no-one has checked out a copy of the revision you outdate.  Strange things will happen if he starts to edit it and tries to check it back in.  For this reason, this option is  not
           a good way to take back a bogus commit; commit a new revision undoing the bogus change instead (see node `Merging two revisions' in the CVS manual).



       -q

         Run quietly; do not print diagnostics.



       -sstate[:rev]

         Useful with cvs.  Set the state attribute of the revision rev to state.  If rev is a branch number, assume the latest revision on that branch.  If rev is omitted, assume the latest revision on the
         default branch.  Any identifier is acceptable for state.  A useful set of states is Exp (for experimental), Stab (for stable), and Rel (for released).  By default, the state of a new  revision  is
         set  to  Exp  when it is created.  The state is visible in the output from cvs log (see node `log' in the CVS manual), and in the $Log$ and $State$ keywords (see node `Keyword substitution' in the
         CVS manual).  Note that cvs uses the dead state for its own purposes; to take a file to or from the dead state use commands like cvs remove and cvs add, not cvs admin -s.



       -t[file]

         Useful with cvs.  Write descriptive text from the contents of the named file into the RCS file, deleting the existing text.  The file pathname may not begin with -.  The descriptive  text  can  be
         seen in the output from cvs log (see node `log' in the CVS manual).  There can be no space between -t and its argument.

         If file is omitted, obtain the text from standard input, terminated by end-of-file or by a line containing . by itself.  Prompt for the text if interaction is possible; see -I.



       -t-string

         Similar to -tfile. Write descriptive text from the string into the rcs file, deleting the existing text.  There can be no space between -t and its argument.



       -U

         Set  locking  to non-strict.  Non-strict locking means that the owner of a file need not lock a revision for checkin.  For use with cvs, strict locking must be set; see the discussion under the -l
         option above.



       -u[rev]

         See the option -l above, for a discussion of using this option with cvs.  Unlock the revision with number rev.  If a branch is given, unlock the latest revision on that branch.  If rev is omitted,
         remove the latest lock held by the caller.  Normally, only the locker of a revision may unlock it; somebody else unlocking a revision breaks the lock.  This causes the original locker to be sent a
         commit notification (see node `Getting Notified' in the CVS manual).  There can be no space between -u and its argument.



       -Vn

         In previous versions of cvs, this option meant to write an rcs file which would be acceptable to rcs version n, but it is now obsolete and specifying it will produce an error.



       -xsuffixes

         In previous versions of cvs, this was documented as a way of specifying the names of the rcs files.  However, cvs has always required that the rcs files used by cvs end in ,v, so this  option  has
         never done anything useful.



annotate
   What revision modified each line of a file?
       · Synopsis: annotate [options] files...

       · Requires: repository.

       · Changes: nothing.

         For each file in files, print the head revision of the trunk, together with information on the last modification for each line.


annotate options
       These standard options are supported by annotate (see node `Common options' in the CVS manual, for a complete description of them):



       -l

         Local directory only, no recursion.



       -R

         Process directories recursively.



       -f

         Use head revision if tag/date not found.



       -F

         Annotate binary files.



       -r tag[:date]

         Annotate file as of specified revision/tag or, when date is specified and tag is a branch tag, the version from the branch tag as it existed on date.  See see node `Common options' in the CVS man-
         ual.



       -D date

         Annotate file as of specified date.


annotate example
       For example:


         $ cvs annotate ssfile
         Annotations for ssfile
         ***************
         1.1          (mary     27-Mar-96): ssfile line 1
         1.2          (joe      28-Mar-96): ssfile line 2




       The file ssfile currently contains two lines.  The ssfile line 1 line was checked in by mary on March 27.  Then, on March 28, joe added a line ssfile line 2, without  modifying  the  ssfile  line  1
       line.  This report doesn't tell you anything about lines which have been deleted or replaced; you need to use cvs diff for that (see node `diff' in the CVS manual).

       The  options  to  cvs annotate are listed in see node `Invoking CVS' in the CVS manual, and can be used to select the files and revisions to annotate.  The options are described in more detail there
       and in see node `Common options' in the CVS manual.


checkout
   Check out sources for editing
       · Synopsis: checkout [options] modules...

       · Requires: repository.

       · Changes: working directory.

       · Synonyms: co, get

         Create or update a working directory containing copies of the source files specified by modules.  You must execute checkout before using most of the other cvs commands, since most of them  operate
         on your working directory.

         The  modules are either symbolic names for some collection of source directories and files, or paths to directories or files in the repository.  The symbolic names are defined in the modules file.
         see node `modules' in the CVS manual.

         Depending on the modules you specify, checkout may recursively create directories and populate them with the appropriate source files.  You can then edit these source files at any time (regardless
         of whether other software developers are editing their own copies of the sources); update them to include new changes applied by others to the source repository; or commit your work as a permanent
         change to the source repository.

         Note that checkout is used to create directories.  The top-level directory created is always added to the directory where checkout is invoked, and usually has the same name as the  specified  mod-
         ule.  In the case of a module alias, the created sub-directory may have a different name, but you can be sure that it will be a sub-directory, and that checkout will show the relative path leading
         to each file as it is extracted into your private work area (unless you specify the -Q global option).

         The files created by checkout are created read-write, unless the -r option to cvs (see node `Global options' in the CVS manual) is specified, the CVSREAD environment  variable  is  specified  (see
         node `Environment variables' in the CVS manual), or a watch is in effect for that file (see node `Watches' in the CVS manual).

         Note  that  running  checkout  on a directory that was already built by a prior checkout is also permitted.  This is similar to specifying the -d option to the update command in the sense that new
         directories that have been created in the repository will appear in your work area.  However, checkout takes a module name whereas update takes a directory name.  Also to use checkout this way  it
         must  be  run  from  the  top level directory (where you originally ran checkout from), so before you run checkout to update an existing directory, don't forget to change your directory to the top
         level directory.

         For the output produced by the checkout command see see node `update output' in the CVS manual.


checkout options
       These standard options are supported by checkout (see node `Common options' in the CVS manual, for a complete description of them):



       -D date

         Use the most recent revision no later than date.  This option is sticky, and implies -P.  See see node `Sticky tags' in the CVS manual, for more information on sticky tags/dates.



       -f

         Only useful with the -D or -r flags.  If no matching revision is found, retrieve the most recent revision (instead of ignoring the file).



       -k kflag

         Process keywords according to kflag.  See see node `Keyword substitution' in the CVS manual.  This option is sticky; future updates of this file in this working directory will use the same  kflag.
         The status command can be viewed to see the sticky options.  See see node `Invoking CVS' in the CVS manual, for more information on the status command.



       -l

         Local; run only in current working directory.



       -n

         Do not run any checkout program (as specified with the -o option in the modules file; see node `modules' in the CVS manual).



       -P

         Prune empty directories.  See see node `Moving directories' in the CVS manual.



       -p

         Pipe files to the standard output.



       -R

         Checkout directories recursively.  This option is on by default.



       -r tag[:date]

         Checkout  the  revision specified by tag or, when date is specified and tag is a branch tag, the version from the branch tag as it existed on date.  This option is sticky, and implies -P.  See see
         node `Sticky tags' in the CVS manual, for more information on sticky tags/dates.  Also, see see node `Common options' in the CVS manual.

         In addition to those, you can use these special command options with checkout:



       -A

         Reset any sticky tags, dates, or -k options.  See see node `Sticky tags' in the CVS manual, for more information on sticky tags/dates.



       -c

         Copy the module file, sorted, to the standard output, instead of creating or modifying any files or directories in your working directory.



       -d dir

         Create a directory called dir for the working files, instead of using the module name.  In general, using this flag is equivalent to using mkdir dir; cd dir followed by the checkout command  with-
         out the -d flag.

         There  is  an important exception, however.  It is very convenient when checking out a single item to have the output appear in a directory that doesn't contain empty intermediate directories.  In
         this case only, cvs tries to ``shorten'' pathnames to avoid those empty directories.

         For example, given a module foo that contains the file bar.c, the command cvs co -d dir foo will create directory dir and place bar.c inside.  Similarly, given a module bar which has  subdirectory
         baz wherein there is a file quux.c, the command cvs co -d dir bar/baz will create directory dir and place quux.c inside.

         Using  the  -N flag will defeat this behavior.  Given the same module definitions above, cvs co -N -d dir foo will create directories dir/foo and place bar.c inside, while cvs co -N -d dir bar/baz
         will create directories dir/bar/baz and place quux.c inside.



       -j tag

         With two -j options, merge changes from the revision specified with the first -j option to the revision specified with the second j option, into the working directory.

         With one -j option, merge changes from the ancestor revision to the revision specified with the -j option, into the working directory.  The ancestor revision is the common ancestor of the revision
         which the working directory is based on, and the revision specified in the -j option.

         In  addition,  each -j option can contain an optional date specification which, when used with branches, can limit the chosen revision to one within a specific date.  An optional date is specified
         by adding a colon (:) to the tag: -jSymbolic_Tag:Date_Specifier.

         see node `Branching and merging' in the CVS manual.



       -N

         Only useful together with -d dir.  With this option, cvs will not ``shorten'' module paths in your working directory when you check out a single module.  See the -d flag for examples and a discus-
         sion.



       -s

         Like  -c,  but  include the status of all modules, and sort it by the status string.  see node `modules' in the CVS manual, for info about the -s option that is used inside the modules file to set
         the module status.


checkout examples
       Get a copy of the module tc:


         $ cvs checkout tc




       Get a copy of the module tc as it looked one day ago:


         $ cvs checkout -D yesterday tc





commit
   Check files into the repository
       · Synopsis: commit [-lnRf] [-m 'log_message' | -F file] [-r revision] [files...]

       · Requires: working directory, repository.

       · Changes: repository.

       · Synonym: ci

         Use commit when you want to incorporate changes from your working source files into the source repository.

         If you don't specify particular files to commit, all of the files in your working current directory are examined.  commit is careful to change in the repository only  those  files  that  you  have
         really changed.  By default (or if you explicitly specify the -R option), files in subdirectories are also examined and committed if they have changed; you can use the -l option to limit commit to
         the current directory only.

         commit verifies that the selected files are up to date with the current revisions in the source repository; it will notify you, and exit without committing, if any of the specified files  must  be
         made current first with update (see node `update' in the CVS manual).  commit does not call the update command for you, but rather leaves that for you to do when the time is right.

         When all is well, an editor is invoked to allow you to enter a log message that will be written to one or more logging programs (see node `modules' in the CVS manual, and see node `loginfo' in the
         CVS manual) and placed in the rcs file inside the repository.  This log message can be retrieved with the log command; see see node `log' in the CVS manual.  You can specify the log message on the
         command line with the -m message option, and thus avoid the editor invocation, or use the -F file option to specify that the argument file contains the log message.

         At  commit, a unique commitid is placed in the rcs file inside the repository. All files committed at once get the same commitid. The commitid can be retrieved with the log and status command; see
         see node `log' in the CVS manual, see node `File status' in the CVS manual.


commit options
       These standard options are supported by commit (see node `Common options' in the CVS manual, for a complete description of them):



       -l

         Local; run only in current working directory.



       -R

         Commit directories recursively.  This is on by default.



       -r revision

         Commit to revision.  revision must be either a branch, or a revision on the main trunk that is higher than any existing revision number (see node `Assigning revisions' in  the  CVS  manual).   You
         cannot commit to a specific revision on a branch.

         commit also supports these options:



       -c

         Refuse  to commit files unless the user has registered a valid edit on the file via cvs edit.  This is most useful when commit -c and edit -c have been placed in all .cvsrc files.  A commit can be
         forced anyways by either regestering an edit retroactively via cvs edit (no changes to the file will be lost) or using the -f option to commit.  Support for commit -c requires both  client  and  a
         server versions 1.12.10 or greater.



       -F file

         Read the log message from file, instead of invoking an editor.



       -f

         Note that this is not the standard behavior of the -f option as defined in see node `Common options' in the CVS manual.

         Force  cvs  to  commit  a new revision even if you haven't made any changes to the file.  As of cvs version 1.12.10, it also causes the -c option to be ignored.  If the current revision of file is
         1.7, then the following two commands are equivalent:


           $ cvs commit -f file
           $ cvs commit -r 1.8 file




         The -f option disables recursion (i.e., it implies -l).  To force cvs to commit a new revision for all files in all subdirectories, you must use -f -R.



       -m message

         Use message as the log message, instead of invoking an editor.


commit examples
   Committing to a branch
       You can commit to a branch revision (one that has an even number of dots) with the -r option.  To create a branch revision, use the -b option of the rtag or tag commands  (see  node  `Branching  and
       merging'  in the CVS manual).  Then, either checkout or update can be used to base your sources on the newly created branch.  From that point on, all commit changes made within these working sources
       will be automatically added to a branch revision, thereby not disturbing main-line development in any way.  For example, if you had to create a patch to the 1.2 version of the product,  even  though
       the 2.0 version is already under development, you might do:


         $ cvs rtag -b -r FCS1_2 FCS1_2_Patch product_module
         $ cvs checkout -r FCS1_2_Patch product_module
         $ cd product_module
         [[ hack away ]]
         $ cvs commit




       This works automatically since the -r option is sticky.


   Creating the branch after editing
       Say  you  have  been working on some extremely experimental software, based on whatever revision you happened to checkout last week.  If others in your group would like to work on this software with
       you, but without disturbing main-line development, you could commit your change to a new branch.  Others can then checkout your experimental stuff and utilize the full benefit of cvs conflict  reso-
       lution.  The scenario might look like:


         [[ hacked sources are present ]]
         $ cvs tag -b EXPR1
         $ cvs update -r EXPR1
         $ cvs commit




       The  update  command will make the -r EXPR1 option sticky on all files.  Note that your changes to the files will never be removed by the update command.  The commit will automatically commit to the
       correct branch, because the -r is sticky.  You could also do like this:


         [[ hacked sources are present ]]
         $ cvs tag -b EXPR1
         $ cvs commit -r EXPR1




       but then, only those files that were changed by you will have the -r EXPR1 sticky flag.  If you hack away, and commit without specifying the -r EXPR1 flag, some files may accidentally end up on  the
       main trunk.

       To work with you on the experimental change, others would simply do


         $ cvs checkout -r EXPR1 whatever_module





diff
   Show differences between revisions
       · Synopsis: diff [-lR] [-k kflag] [format_options] [(-r rev1[:date1] | -D date1) [-r rev2[:date2] | -D date2]] [files...]

       · Requires: working directory, repository.

       · Changes: nothing.

         The  diff  command  is used to compare different revisions of files.  The default action is to compare your working files with the revisions they were based on, and report any differences that are
         found.

         If any file names are given, only those files are compared.  If any directories are given, all files under them will be compared.

         The exit status for diff is different than for other cvs commands; for details see node `Exit status' in the CVS manual.


diff options
       These standard options are supported by diff (see node `Common options' in the CVS manual, for a complete description of them):



       -D date

         Use the most recent revision no later than date.  See -r for how this affects the comparison.



       -k kflag

         Process keywords according to kflag.  See see node `Keyword substitution' in the CVS manual.



       -l

         Local; run only in current working directory.



       -R

         Examine directories recursively.  This option is on by default.



       -r tag[:date]

         Compare with revision specified by tag or, when date is specified and tag is a branch tag, the version from the branch tag as it existed on date.  Zero, one or two -r options can be present.  With
         no  -r  option, the working file will be compared with the revision it was based on.  With one -r, that revision will be compared to your current working file.  With two -r options those two revi-
         sions will be compared (and your working file will not affect the outcome in any way).

         One or both -r options can be replaced by a -D date option, described above.

         The following options specify the format of the output.  They have the same meaning as in GNU diff.  Most options have two equivalent names, one of which is a single letter preceded by -, and  the
         other of which is a long name preceded by --.



       -lines

         Show  lines  (an  integer)  lines  of context.  This option does not specify an output format by itself; it has no effect unless it is combined with -c or -u.  This option is obsolete.  For proper
         operation, patch typically needs at least two lines of context.



       -a

         Treat all files as text and compare them line-by-line, even if they do not seem to be text.



       -b

         Ignore trailing white space and consider all other sequences of one or more white space characters to be equivalent.



       -B

         Ignore changes that just insert or delete blank lines.



       --binary

         Read and write data in binary mode.



       --brief

         Report only whether the files differ, not the details of the differences.



       -c

         Use the context output format.



       -C lines




       --context[=lines]

         Use the context output format, showing lines (an integer) lines of context, or three if lines is not given.  For proper operation, patch typically needs at least two lines of context.



       --changed-group-format=format

         Use format to output a line group containing differing lines from both files in if-then-else format.  see node `Line group formats' in the CVS manual.



       -d

         Change the algorithm to perhaps find a smaller set of changes.  This makes diff slower (sometimes much slower).



       -e




       --ed

         Make output that is a valid ed script.



       --expand-tabs

         Expand tabs to spaces in the output, to preserve the alignment of tabs in the input files.



       -f

         Make output that looks vaguely like an ed script but has changes in the order they appear in the file.



       -F regexp

         In context and unified format, for each hunk of differences, show some of the last preceding line that matches regexp.



       --forward-ed

         Make output that looks vaguely like an ed script but has changes in the order they appear in the file.



       -H

         Use heuristics to speed handling of large files that have numerous scattered small changes.



       --horizon-lines=lines

         Do not discard the last lines lines of the common prefix and the first lines lines of the common suffix.



       -i

         Ignore changes in case; consider upper- and lower-case letters equivalent.



       -I regexp

         Ignore changes that just insert or delete lines that match regexp.



       --ifdef=name

         Make merged if-then-else output using name.



       --ignore-all-space

         Ignore white space when comparing lines.



       --ignore-blank-lines

         Ignore changes that just insert or delete blank lines.



       --ignore-case

         Ignore changes in case; consider upper- and lower-case to be the same.



       --ignore-matching-lines=regexp

         Ignore changes that just insert or delete lines that match regexp.



       --ignore-space-change

         Ignore trailing white space and consider all other sequences of one or more white space characters to be equivalent.



       --initial-tab

         Output a tab rather than a space before the text of a line in normal or context format.  This causes the alignment of tabs in the line to look normal.



       -L label

         Use label instead of the file name in the context format and unified format headers.



       --label=label

         Use label instead of the file name in the context format and unified format headers.



       --left-column

         Print only the left column of two common lines in side by side format.



       --line-format=format

         Use format to output all input lines in if-then-else format.  see node `Line formats' in the CVS manual.



       --minimal

         Change the algorithm to perhaps find a smaller set of changes.  This makes diff slower (sometimes much slower).



       -n

         Output RCS-format diffs; like -f except that each command specifies the number of lines affected.



       -N




       --new-file

         In directory comparison, if a file is found in only one directory, treat it as present but empty in the other directory.



       --new-group-format=format

         Use format to output a group of lines taken from just the second file in if-then-else format.  see node `Line group formats' in the CVS manual.



       --new-line-format=format

         Use format to output a line taken from just the second file in if-then-else format.  see node `Line formats' in the CVS manual.



       --old-group-format=format

         Use format to output a group of lines taken from just the first file in if-then-else format.  see node `Line group formats' in the CVS manual.



       --old-line-format=format

         Use format to output a line taken from just the first file in if-then-else format.  see node `Line formats' in the CVS manual.



       -p

         Show which C function each change is in.



       --rcs

         Output RCS-format diffs; like -f except that each command specifies the number of lines affected.



       --report-identical-files




       -s

         Report when two files are the same.



       --show-c-function

         Show which C function each change is in.



       --show-function-line=regexp

         In context and unified format, for each hunk of differences, show some of the last preceding line that matches regexp.



       --side-by-side

         Use the side by side output format.



       --speed-large-files

         Use heuristics to speed handling of large files that have numerous scattered small changes.



       --suppress-common-lines

         Do not print common lines in side by side format.



       -t

         Expand tabs to spaces in the output, to preserve the alignment of tabs in the input files.



       -T

         Output a tab rather than a space before the text of a line in normal or context format.  This causes the alignment of tabs in the line to look normal.



       --text

         Treat all files as text and compare them line-by-line, even if they do not appear to be text.



       -u

         Use the unified output format.



       --unchanged-group-format=format

         Use format to output a group of common lines taken from both files in if-then-else format.  see node `Line group formats' in the CVS manual.



       --unchanged-line-format=format

         Use format to output a line common to both files in if-then-else format.  see node `Line formats' in the CVS manual.



       -U lines




       --unified[=lines]

         Use the unified output format, showing lines (an integer) lines of context, or three if lines is not given.  For proper operation, patch typically needs at least two lines of context.



       -w

         Ignore white space when comparing lines.



       -W columns




       --width=columns

         Use an output width of columns in side by side format.



       -y

         Use the side by side output format.


Line group formats
       Line group formats let you specify formats suitable for many applications that allow if-then-else input, including programming languages and text formatting languages.  A line group format specifies
       the output format for a contiguous group of similar lines.

       For  example,  the  following command compares the TeX file myfile with the original version from the repository, and outputs a merged file in which old regions are surrounded by \begin{em}-\end{em}
       lines, and new regions are surrounded by \begin{bf}-\end{bf} lines.


         cvs diff \

            --old-group-format='\begin{em}
         %<\end{em}
         ' \

            --new-group-format='\begin{bf}
         %>\end{bf}
         ' \

            myfile




       The following command is equivalent to the above example, but it is a little more verbose, because it spells out the default line group formats.


         cvs diff \

            --old-group-format='\begin{em}
         %<\end{em}
         ' \

            --new-group-format='\begin{bf}
         %>\end{bf}
         ' \

            --unchanged-group-format='%=' \

            --changed-group-format='\begin{em}
         %<\end{em}
         \begin{bf}
         %>\end{bf}
         ' \

            myfile




       Here is a more advanced example, which outputs a diff listing with headers containing line numbers in a ``plain English'' style.


         cvs diff \

            --unchanged-group-format='' \

            --old-group-format='-------- %dn line%(n=1?:s) deleted at %df:
         %<' \

            --new-group-format='-------- %dN line%(N=1?:s) added after %de:
         %>' \

            --changed-group-format='-------- %dn line%(n=1?:s) changed at %df:
         %<-------- to:
         %>' \

            myfile




       To specify a line group format, use one of the options listed below.  You can specify up to four line group formats, one for each kind of line group.  You should quote format, because  it  typically
       contains shell metacharacters.



       --old-group-format=format

         These  line groups are hunks containing only lines from the first file.  The default old group format is the same as the changed group format if it is specified; otherwise it is a format that out-
         puts the line group as-is.



       --new-group-format=format

         These line groups are hunks containing only lines from the second file.  The default new group format is same as the changed group format if it is specified; otherwise it is a format that  outputs
         the line group as-is.



       --changed-group-format=format

         These line groups are hunks containing lines from both files.  The default changed group format is the concatenation of the old and new group formats.



       --unchanged-group-format=format

         These line groups contain lines common to both files.  The default unchanged group format is a format that outputs the line group as-is.

         In a line group format, ordinary characters represent themselves; conversion specifications start with % and have one of the following forms.



       %<

         stands for the lines from the first file, including the trailing newline.  Each line is formatted according to the old line format (see node `Line formats' in the CVS manual).



       %>

         stands for the lines from the second file, including the trailing newline.  Each line is formatted according to the new line format.



       %=

         stands for the lines common to both files, including the trailing newline.  Each line is formatted according to the unchanged line format.



       %%

         stands for %.



       %c'C'

         where  C is a single character, stands for C.  C may not be a backslash or an apostrophe.  For example, %c':' stands for a colon, even inside the then-part of an if-then-else format, which a colon
         would normally terminate.



       %c'\O'

         where O is a string of 1, 2, or 3 octal digits, stands for the character with octal code O.  For example, %c'\0' stands for a null character.



       Fn

         where F is a printf conversion specification and n is one of the following letters, stands for n's value formatted with F.


         e

           The line number of the line just before the group in the old file.


         f

           The line number of the first line in the group in the old file; equals e + 1.


         l

           The line number of the last line in the group in the old file.


         m

           The line number of the line just after the group in the old file; equals l + 1.


         n

           The number of lines in the group in the old file; equals l - f + 1.


         E, F, L, M, N

           Likewise, for lines in the new file.


           The printf conversion specification can be %d, %o, %x, or %X, specifying decimal, octal, lower case hexadecimal, or upper case hexadecimal output respectively.  After the % the following options
           can  appear  in  sequence: a - specifying left-justification; an integer specifying the minimum field width; and a period followed by an optional integer specifying the minimum number of digits.
           For example, %5dN prints the number of new lines in the group in a field of width 5 characters, using the printf format "%5d".



       (A=B?T:E)

         If A equals B then T else E.  A and B are each either a decimal constant or a single letter interpreted as above.  This format spec is equivalent to T if A's value  equals  B's;  otherwise  it  is
         equivalent to E.

         For example, %(N=0?no:%dN) line%(N=1?:s) is equivalent to no lines if N (the number of lines in the group in the new file) is 0, to 1 line if N is 1, and to %dN lines otherwise.


Line formats
       Line formats control how each line taken from an input file is output as part of a line group in if-then-else format.

       For  example,  the  following  command outputs text with a one-column change indicator to the left of the text.  The first column of output is - for deleted lines, | for added lines, and a space for
       unchanged lines.  The formats contain newline characters where newlines are desired on output.


         cvs diff \

            --old-line-format='-%l
         ' \

            --new-line-format='|%l
         ' \

            --unchanged-line-format=' %l
         ' \

            myfile




       To specify a line format, use one of the following options.  You should quote format, since it often contains shell metacharacters.



       --old-line-format=format

         formats lines just from the first file.



       --new-line-format=format

         formats lines just from the second file.



       --unchanged-line-format=format

         formats lines common to both files.



       --line-format=format

         formats all lines; in effect, it sets all three above options simultaneously.

         In a line format, ordinary characters represent themselves; conversion specifications start with % and have one of the following forms.



       %l

         stands for the contents of the line, not counting its trailing newline (if any).  This format ignores whether the line is incomplete.



       %L

         stands for the contents of the line, including its trailing newline (if any).  If a line is incomplete, this format preserves its incompleteness.



       %%

         stands for %.



       %c'C'

         where C is a single character, stands for C.  C may not be a backslash or an apostrophe.  For example, %c':' stands for a colon.



       %c'\O'

         where O is a string of 1, 2, or 3 octal digits, stands for the character with octal code O.  For example, %c'\0' stands for a null character.



       Fn

         where F is a printf conversion specification, stands for the line number formatted with F.  For example, %.5dn prints the line number using the printf format "%.5d".  see node `Line group formats'
         in the CVS manual, for more about printf conversion specifications.


         The default line format is %l followed by a newline character.

         If  the  input contains tab characters and it is important that they line up on output, you should ensure that %l or %L in a line format is just after a tab stop (e.g. by preceding %l or %L with a
         tab character), or you should use the -t or --expand-tabs option.

         Taken together, the line and line group formats let you specify many different formats.  For example, the following command uses a format similar to diff's normal format.  You can tailor this com-
         mand to get fine control over diff's output.


         cvs diff \

            --old-line-format='< %l
         ' \

            --new-line-format='> %l
         ' \

            --old-group-format='%df%(f=l?:,%dl)d%dE
         %<' \

            --new-group-format='%dea%dF%(F=L?:,%dL)
         %>' \

            --changed-group-format='%df%(f=l?:,%dl)c%dF%(F=L?:,%dL)
         %<—
         %>' \

            --unchanged-group-format='' \

            myfile





diff examples
       The following line produces a Unidiff (-u flag) between revision 1.14 and 1.19 of backend.c.  Due to the -kk flag no keywords are substituted, so differences that only depend on keyword substitution
       are ignored.


         $ cvs diff -kk -u -r 1.14 -r 1.19 backend.c




       Suppose the experimental branch EXPR1 was based on a set of files tagged RELEASE_1_0.  To see what has happened on that branch, the following can be used:


         $ cvs diff -r RELEASE_1_0 -r EXPR1




       A command like this can be used to produce a context diff between two releases:


         $ cvs diff -c -r RELEASE_1_0 -r RELEASE_1_1 > diffs




       If you are maintaining ChangeLogs, a command like the following just before you commit your changes may help you write the ChangeLog entry.  All local modifications that have not yet been  committed
       will be printed.


         $ cvs diff -u | less





export
   Export sources from CVS, similar to checkout
       · Synopsis: export [-flNnR] (-r rev[:date] | -D date) [-k subst] [-d dir] module...

       · Requires: repository.

       · Changes: current directory.

         This  command  is  a  variant of checkout; use it when you want a copy of the source for module without the cvs administrative directories.  For example, you might use export to prepare source for
         shipment off-site.  This command requires that you specify a date or tag (with -D or -r), so that you can count on reproducing the source you ship to others (and thus it always prunes empty direc-
         tories).

         One  often would like to use -kv with cvs export.  This causes any keywords to be expanded such that an import done at some other site will not lose the keyword revision information.  But be aware
         that doesn't handle an export containing binary files correctly.  Also be aware that after having used -kv, one can no longer use the ident command (which is part of the  rcs  suite—see  ident(1))
         which looks for keyword strings.  If you want to be able to use ident you must not use -kv.


export options
       These standard options are supported by export (see node `Common options' in the CVS manual, for a complete description of them):



       -D date

         Use the most recent revision no later than date.



       -f

         If no matching revision is found, retrieve the most recent revision (instead of ignoring the file).



       -l

         Local; run only in current working directory.



       -n

         Do not run any checkout program.



       -R

         Export directories recursively.  This is on by default.



       -r tag[:date]

         Export the revision specified by tag or, when date is specified and tag is a branch tag, the version from the branch tag as it existed on date.  See see node `Common options' in the CVS manual.

         In addition, these options (that are common to checkout and export) are also supported:



       -d dir

         Create a directory called dir for the working files, instead of using the module name.  see node `checkout options' in the CVS manual, for complete details on how cvs handles this flag.



       -k subst

         Set keyword expansion mode (see node `Substitution modes' in the CVS manual).



       -N

         Only useful together with -d dir.  see node `checkout options' in the CVS manual, for complete details on how cvs handles this flag.


history
   Show status of files and users
       · Synopsis:     history [-report] [-flags] [-options args] [files...]

       · Requires: the file $CVSROOT/CVSROOT/history

       · Changes: nothing.

         cvs can keep a history file that tracks each use of the checkout, commit, rtag, update, and release commands.  You can use history to display this information in various formats.

         Logging must be enabled by creating the file $CVSROOT/CVSROOT/history.

         Note: history uses -f, -l, -n, and -p in ways that conflict with the normal use inside cvs (see node `Common options' in the CVS manual).


history options
       Several options (shown above as -report)  control  what kind of report is generated:



       -c

         Report on each time commit was used (i.e., each time the repository was modified).



       -e

         Everything  (all  record  types).  Equivalent to specifying -x with all record types.  Of course, -e will also include record types which are added in a future version of cvs; if you are writing a
         script which can only handle certain record types, you'll want to specify -x.



       -m module

         Report on a particular module.  (You can meaningfully use -m more than once on the command line.)



       -o

         Report on checked-out modules.  This is the default report type.



       -T

         Report on all tags.



       -x type

         Extract a particular set of record types type from the cvs history.  The types are indicated by single letters, which you may specify in combination.

         Certain commands have a single record type:


         F

           release

         O

           checkout

         E

           export

         T

           rtag

           One of five record types may result from an update:


         C

           A merge was necessary but collisions were detected (requiring manual merging).

         G

           A merge was necessary and it succeeded.

         U

           A working file was copied from the repository.

         P

           A working file was patched to match the repository.

         W

           The working copy of a file was deleted during update (because it was gone from the repository).

           One of three record types results from commit:


         A

           A file was added for the first time.

         M

           A file was modified.

         R

           A file was removed.

           The options shown as -flags constrain or expand the report without requiring option arguments:



       -a

         Show data for all users (the default is to show data only for the user executing history).



       -l

         Show last modification only.



       -w

         Show only the records for modifications done from the same working directory where history is executing.

         The options shown as -options args constrain the report based on an argument:



       -b str

         Show data back to a record containing  the  string str  in  either the module name, the file name, or the repository path.



       -D date

         Show data since date.  This is slightly different from the normal use of -D date, which selects the newest revision older than date.



       -f file

         Show data for a particular file (you can specify several -f options on the same command line).  This is equivalent to specifying the file on the command line.



       -n module

         Show data for a particular module (you can specify several -n options on the same command line).



       -p repository

         Show data for a particular source repository  (you can specify several -p options on the same command line).



       -r rev

         Show records referring to revisions since the revision or tag named rev appears in individual rcs files.  Each rcs file is searched for the revision or tag.



       -t tag

         Show records since tag tag was last added to the history file.  This differs from the -r flag above in that it reads only the history file, not the rcs files, and is much faster.



       -u name

         Show records for user name.



       -z timezone

         Show times in the selected records using the specified time zone instead of UTC.


import
   Import sources into CVS, using vendor branches
       · Synopsis: import [-options] repository vendortag releasetag...

       · Requires: Repository, source distribution directory.

       · Changes: repository.

         Use import to incorporate an entire source distribution from an outside source (e.g., a source vendor) into your source repository directory.  You can use this command both for initial creation of
         a repository, and for wholesale updates to the module from the outside source.  see node `Tracking sources' in the CVS manual, for a discussion on this subject.

         The repository argument gives a directory name (or a path to a directory) under the cvs root directory for repositories; if the directory did not exist, import creates it.

         When you use import for updates to source that has been modified in your source repository (since a prior import), it will notify you of any files that conflict in the two branches of development;
         use checkout -j to reconcile the differences, as import instructs you to do.

         If cvs decides a file should be ignored (see node `cvsignore' in the CVS manual), it does not import it and prints I  followed by the filename (see node `import output' in the CVS  manual,  for  a
         complete description of the output).

         If  the  file  $CVSROOT/CVSROOT/cvswrappers  exists,  any  file whose names match the specifications in that file will be treated as packages and the appropriate filtering will be performed on the
         file/directory before being imported.  see node `Wrappers' in the CVS manual.

         The outside source is saved in a first-level branch, by default 1.1.1.  Updates are leaves of this branch; for example, files from the first imported collection of source will be revision 1.1.1.1,
         then files from the first imported update will be revision 1.1.1.2, and so on.

         At  least three arguments are required.  repository is needed to identify the collection of source.  vendortag is a tag for the entire branch (e.g., for 1.1.1).  You must also specify at least one
         releasetag to uniquely identify the files at the leaves created each time you execute import.  The releasetag should be new, not previously existing in the repository file, and  uniquely  identify
         the imported release,

         Note  that  import  does  not change the directory in which you invoke it.  In particular, it does not set up that directory as a cvs working directory; if you want to work with the sources import
         them first and then check them out into a different directory (see node `Getting the source' in the CVS manual).


import options
       This standard option is supported by import (see node `Common options' in the CVS manual, for a complete description):



       -m message

         Use message as log information, instead of invoking an editor.

         There are the following additional special options.



       -b branch

         See see node `Multiple vendor branches' in the CVS manual.



       -k subst

         Indicate the keyword expansion mode desired.  This setting will apply to all files created during the import, but not to any files that previously existed in the repository.  See see node `Substi-
         tution modes' in the CVS manual, for a list of valid -k settings.



       -I name

         Specify file names that should be ignored during import.  You can use this option repeatedly.  To avoid ignoring any files at all (even those ignored by default), specify `-I !'.

         name can be a file name pattern of the same type that you can specify in the .cvsignore file.  see node `cvsignore' in the CVS manual.



       -W spec

         Specify file names that should be filtered during import.  You can use this option repeatedly.

         spec can be a file name pattern of the same type that you can specify in the .cvswrappers file. see node `Wrappers' in the CVS manual.



       -X

         Modify the algorithm used by cvs when importing new files so that new files do not immediately appear on the main trunk.

         Specifically,  this flag causes cvs to mark new files as if they were deleted on the main trunk, by taking the following steps for each file in addition to those normally taken on import: creating
         a new revision on the main trunk indicating that the new file is dead, resetting the new file's default branch, and placing the file in the Attic (see node `Attic' in the CVS manual) directory.

         Use of this option can be forced on a repository-wide basis by setting the ImportNewFilesToVendorBranchOnly option in CVSROOT/config (see node `config' in the CVS manual).


import output
       import keeps you informed of its progress by printing a line for each file, preceded by one character indicating the status of the file:



       U file

         The file already exists in the repository and has not been locally modified; a new revision has been created (if necessary).



       N file

         The file is a new file which has been added to the repository.



       C file

         The file already exists in the repository but has been locally modified; you will have to merge the changes.



       I file

         The file is being ignored (see node `cvsignore' in the CVS manual).



       L file

         The file is a symbolic link; cvs import ignores symbolic links.  People periodically suggest that this behavior should be changed, but if there is a consensus on what it should be changed  to,  it
         is not apparent.  (Various options in the modules file can be used to recreate symbolic links on checkout, update, etc.; see node `modules' in the CVS manual.)


import examples
       See see node `Tracking sources' in the CVS manual, and see node `From files' in the CVS manual.


log
   Print out log information for files
       · Synopsis: log [options] [files...]

       · Requires: repository, working directory.

       · Changes: nothing.

         Display  log  information  for  files.   log  used  to  call the rcs utility rlog.  Although this is no longer true in the current sources, this history determines the format of the output and the
         options, which are not quite in the style of the other cvs commands.

         The output includes the location of the rcs file, the head revision (the latest revision on the trunk), all symbolic names (tags) and some other things.  For each revision,  the  revision  number,
         the  date, the author, the number of lines added/deleted, the commitid and the log message are printed.  All dates are displayed in local time at the client. This is typically specified in the $TZ
         environment variable, which can be set to govern how log displays dates.

         Note: log uses -R in a way that conflicts with the normal use inside cvs (see node `Common options' in the CVS manual).


log options
       By default, log prints all information that is available.  All other options restrict the output.  Note that the revision selection options (-d, -r, -s, and -w) have no effect, other  than  possibly
       causing a search for files in Attic directories, when used in conjunction with the options that restrict the output to only log header fields (-b, -h, -R, and -t) unless the -S option is also speci-
       fied.



       -b

         Print information about the revisions on the default branch, normally the highest branch on the trunk.



       -d dates

         Print information about revisions with a checkin date/time in the range given by the semicolon-separated list of dates.  The date formats accepted are those accepted by the -D option to many other
         cvs commands (see node `Common options' in the CVS manual).  Dates can be combined into ranges as follows:


         d1<d2



         d2>d1

           Select the revisions that were deposited between d1 and d2.


         <d



         d>

           Select all revisions dated d or earlier.


         d<



         >d

           Select all revisions dated d or later.


         d

           Select the single, latest revision dated d or earlier.

           The > or < characters may be followed by = to indicate an inclusive range rather than an exclusive one.

           Note that the separator is a semicolon (;).



       -h

         Print only the name of the rcs file, name of the file in the working directory, head, default branch, access list, locks, symbolic names, and suffix.



       -l

         Local; run only in current working directory.  (Default is to run recursively).



       -N

         Do  not  print  the list of tags for this file.  This option can be very useful when your site uses a lot of tags, so rather than "more"'ing over 3 pages of tag information, the log information is
         presented without tags at all.



       -R

         Print only the name of the rcs file.



       -rrevisions

         Print information about revisions given in the comma-separated list revisions of revisions and ranges.  The following table explains the available range formats:


         rev1:rev2

           Revisions rev1 to rev2 (which must be on the same branch).


         rev1::rev2

           The same, but excluding rev1.


         :rev



         ::rev

           Revisions from the beginning of the branch up to and including rev.


         rev:

           Revisions starting with rev to the end of the branch containing rev.


         rev::

           Revisions starting just after rev to the end of the branch containing rev.


         branch

           An argument that is a branch means all revisions on that branch.


         branch1:branch2



         branch1::branch2

           A range of branches means all revisions on the branches in that range.


         branch.

           The latest revision in branch.

           A bare -r with no revisions means the latest revision on the default branch, normally the trunk.  There can be no space between the -r option and its argument.



       -S

         Suppress the header if no revisions are selected.



       -s states

         Print information about revisions whose state attributes match one of the states given in the comma-separated list states.



       -t

         Print the same as -h, plus the descriptive text.



       -wlogins

         Print information about revisions checked in by users with login names appearing in the comma-separated list logins.  If logins is omitted, the user's login is assumed.   There  can  be  no  space
         between the -w option and its argument.

         log prints the intersection of the revisions selected with the options -d, -s, and -w, intersected with the union of the revisions selected by -b and -r.


log examples
       Since log shows dates in local time, you might want to see them in Coordinated Universal Time (UTC) or some other timezone.  To do this you can set your $TZ environment variable before invoking cvs:


         $ TZ=UTC cvs log foo.c
         $ TZ=EST cvs log bar.c




       (If you are using a csh-style shell, like tcsh, you would need to prefix the examples above with env.)


ls & rls
       · ls [-e | -l] [-RP] [-r tag[:date]] [-D date] [path...]

       · Requires: repository for rls, repository & working directory for ls.

       · Changes: nothing.

       · Synonym: dir & list are synonyms for ls and rdir & rlist are synonyms for rls.

         The ls and rls commands are used to list files and directories in the repository.

         By default ls lists the files and directories that belong in your working directory, what would be there after an update.

         By default rls lists the files and directories on the tip of the trunk in the topmost directory of the repository.

         Both commands accept an optional list of file and directory names, relative to the working directory for ls and the topmost directory of the repository for rls.  Neither is recursive by default.


ls & rls options
       These standard options are supported by ls & rls:



       -d

         Show dead revisions (with tag when specified).



       -e

         Display in CVS/Entries format.  This format is meant to remain easily parsable by automation.



       -l

         Display all details.



       -P

         Don't list contents of empty directories when recursing.



       -R

         List recursively.



       -r tag[:date]

         Show files specified by tag or, when date is specified and tag is a branch tag, the version from the branch tag as it existed on date.  See see node `Common options' in the CVS manual.



       -D date

         Show files from date.


rls examples
         $ cvs rls
         cvs rls: Listing module: `.'
         CVSROOT
         first-dir





         $ cvs rls CVSROOT
         cvs rls: Listing module: `CVSROOT'
         checkoutlist
         commitinfo
         config
         cvswrappers
         loginfo
         modules
         notify
         rcsinfo
         taginfo
         verifymsg






rdiff
   'patch' format diffs between releases
       · rdiff [-flags] [-V vn] (-r tag1[:date1] | -D date1) [-r tag2[:date2] | -D date2] modules...

       · Requires: repository.

       · Changes: nothing.

       · Synonym: patch

         Builds a Larry Wall format patch(1) file between two releases, that can be fed directly into the patch program to bring an old release up-to-date with the new release.  (This is one of the few cvs
         commands that operates directly from the repository, and doesn't require a prior checkout.) The diff output is sent to the standard output device.

         You can specify (using the standard -r and -D options) any combination of one or two revisions or dates.  If only one revision or date is specified, the patch  file  reflects  differences  between
         that revision or date and the current head revisions in the rcs file.

         Note  that  if  the software release affected is contained in more than one directory, then it may be necessary to specify the -p option to the patch command when patching the old sources, so that
         patch is able to find the files that are located in other directories.


rdiff options
       These standard options are supported by rdiff (see node `Common options' in the CVS manual, for a complete description of them):



       -D date

         Use the most recent revision no later than date.



       -f

         If no matching revision is found, retrieve the most recent revision (instead of ignoring the file).



       -l

         Local; don't descend subdirectories.



       -R

         Examine directories recursively.  This option is on by default.



       -r tag

         Use the revision specified by tag, or when date is specified and tag is a branch tag, the version from the branch tag as it existed on date.  See see node `Common options' in the CVS manual.

         In addition to the above, these options are available:



       -c

         Use the context diff format.  This is the default format.



       -s

         Create a summary change report instead of a patch.  The summary includes information about files that were changed or added between the releases.  It is sent to the standard output  device.   This
         is useful for finding out, for example, which files have changed between two dates or revisions.



       -t

         A diff of the top two revisions is sent to the standard output device.  This is most useful for seeing what the last change to a file was.



       -u

         Use the unidiff format for the context diffs.  Remember that old versions of the patch program can't handle the unidiff format, so if you plan to post this patch to the net you should probably not
         use -u.



       -V vn

         Expand keywords according to the rules current in rcs version vn (the expansion format changed with rcs version 5).  Note that this option is no longer accepted.  cvs will always  expand  keywords
         the way that rcs version 5 does.


rdiff examples
       Suppose you receive mail from foo@example.net asking for an update from release 1.2 to 1.4 of the tc compiler.  You have no such patches on hand, but with cvs that can easily be fixed with a command
       such as this:


         $ cvs rdiff -c -r FOO1_2 -r FOO1_4 tc | \
         $$ Mail -s 'The patches you asked for' foo@example.net




       Suppose you have made release 1.3, and forked a branch called R_1_3fix for bug fixes.  R_1_3_1 corresponds to release 1.3.1, which was made some time ago.  Now, you want to see how much  development
       has been done on the branch.  This command can be used:


         $ cvs patch -s -r R_1_3_1 -r R_1_3fix module-name
         cvs rdiff: Diffing module-name
         File ChangeLog,v changed from revision 1.52.2.5 to 1.52.2.6
         File foo.c,v changed from revision 1.52.2.3 to 1.52.2.4
         File bar.h,v changed from revision 1.29.2.1 to 1.2





release
   Indicate that a Module is no longer in use
       · release [-d] directories...

       · Requires: Working directory.

       · Changes: Working directory, history log.

         This command is meant to safely cancel the effect of cvs checkout.  Since cvs doesn't lock files, it isn't strictly necessary to use this command.  You can always simply delete your working direc-
         tory, if you like; but you risk losing changes you may have forgotten, and you leave no trace in the cvs history file (see node `history file' in the CVS manual) that you've abandoned your  check-
         out.

         Use cvs release to avoid these problems.  This command checks that no uncommitted changes are present; that you are executing it from immediately above a cvs working directory; and that the repos-
         itory recorded for your files is the same as the repository defined in the module database.

         If all these conditions are true, cvs release leaves a record of its execution (attesting to your intentionally abandoning your checkout) in the cvs history log.


release options
       The release command supports one command option:



       -d

         Delete your working copy of the file if the release succeeds.  If this flag is not given your files will remain in your working directory.

         WARNING:  The release command deletes all directories and files recursively.  This has the very serious side-effect that any directory that you have created inside your  checked-out  sources,  and
         not added to the repository (using the add command; see node `Adding files' in the CVS manual) will be silently deleted—even if it is non-empty!


release output
       Before release releases your sources it will print a one-line message for any file that is not up-to-date.



       U file




       P file

         There exists a newer revision of this file in the repository, and you have not modified your local copy of the file (U and P mean the same thing).



       A file

         The file has been added to your private copy of the sources, but has not yet been committed to the repository.  If you delete your copy of the sources this file will be lost.



       R file

         The  file has been removed from your private copy of the sources, but has not yet been removed from the repository, since you have not yet committed the removal.  see node `commit' in the CVS man-
         ual.



       M file

         The file is modified in your working directory.  There might also be a newer revision inside the repository.



       ? file

         file is in your working directory, but does not correspond to anything in the source repository, and is not in the list of files for cvs to ignore (see the description of the -I  option,  and  see
         node `cvsignore' in the CVS manual).  If you remove your working sources, this file will be lost.


release examples
       Release the tc directory, and delete your local working copy of the files.


         $ cd ..         # You must stand immediately above the

                         # sources when you issue cvs release.
         $ cvs release -d tc
         You have [0] altered files in this repository.
         Are you sure you want to release (and delete) directory `tc': y
         $





update
   Bring work tree in sync with repository
       · update [-ACdflPpR] [-I name] [-j rev [-j rev]] [-k kflag] [-r tag[:date] | -D date] [-W spec] files...

       · Requires: repository, working directory.

       · Changes: working directory.

         After you've run checkout to create your private copy of source from the common repository, other developers will continue changing the central source.  From time to time, when it is convenient in
         your development process, you can use the update command from within your working directory to reconcile your work with any revisions applied to the source repository since your last  checkout  or
         update.  Without the -C option, update will also merge any differences between the local copy of files and their base revisions into any destination revisions specified with -r, -D, or -A.


update options
       These standard options are available with update (see node `Common options' in the CVS manual, for a complete description of them):



       -D date

         Use the most recent revision no later than date.  This option is sticky, and implies -P.  See see node `Sticky tags' in the CVS manual, for more information on sticky tags/dates.



       -f

         Only useful with the -D or -r flags.  If no matching revision is found, retrieve the most recent revision (instead of ignoring the file).



       -k kflag

         Process  keywords according to kflag.  See see node `Keyword substitution' in the CVS manual.  This option is sticky; future updates of this file in this working directory will use the same kflag.
         The status command can be viewed to see the sticky options.  See see node `Invoking CVS' in the CVS manual, for more information on the status command.



       -l

         Local; run only in current working directory.  see node `Recursive behavior' in the CVS manual.



       -P

         Prune empty directories.  See see node `Moving directories' in the CVS manual.



       -p

         Pipe files to the standard output.



       -R

         Update directories recursively (default).  see node `Recursive behavior' in the CVS manual.



       -r tag[:date]

         Retrieve the revisions specified by tag or, when date is specified and tag is a branch tag, the version from the branch tag as it existed on date.  This option is sticky, and implies -P.  See  see
         node `Sticky tags' in the CVS manual, for more information on sticky tags/dates. Also see see node `Common options' in the CVS manual.

         These special options are also available with update.



       -A

         Reset any sticky tags, dates, or -k options.  See see node `Sticky tags' in the CVS manual, for more information on sticky tags/dates.



       -C

         Overwrite locally modified files with clean copies from the repository (the modified file is saved in .#file.revision, however).



       -d

         Create  any  directories that exist in the repository if they're missing from the working directory.  Normally, update acts only on directories and files that were already enrolled in your working
         directory.

         This is useful for updating directories that were created in the repository since the initial checkout; but it has an unfortunate side effect.  If you deliberately avoided certain  directories  in
         the  repository  when you created your working directory (either through use of a module name or by listing explicitly the files and directories you wanted on the command line), then updating with
         -d will create those directories, which may not be what you want.



       -I name

         Ignore files whose names match name (in your working directory) during the update.  You can specify -I more than once on the command line to specify several files to ignore.  Use  -I  !  to  avoid
         ignoring any files at all.  see node `cvsignore' in the CVS manual, for other ways to make cvs ignore some files.



       -Wspec

         Specify file names that should be filtered during update.  You can use this option repeatedly.

         spec can be a file name pattern of the same type that you can specify in the .cvswrappers file. see node `Wrappers' in the CVS manual.



       -jrevision

         With two -j options, merge changes from the revision specified with the first -j option to the revision specified with the second j option, into the working directory.

         With one -j option, merge changes from the ancestor revision to the revision specified with the -j option, into the working directory.  The ancestor revision is the common ancestor of the revision
         which the working directory is based on, and the revision specified in the -j option.

         Note that using a single -j tagname option rather than -j branchname to merge changes from a branch will often not remove files which were removed on  the  branch.   see  node  `Merging  adds  and
         removals' in the CVS manual, for more.

         In  addition,  each -j option can contain an optional date specification which, when used with branches, can limit the chosen revision to one within a specific date.  An optional date is specified
         by adding a colon (:) to the tag: -jSymbolic_Tag:Date_Specifier.

         see node `Branching and merging' in the CVS manual.



update output
       update and checkout keep you informed of their progress by printing a line for each file, preceded by one character indicating the status of the file:



       U file

         The file was brought up to date with respect to the repository.  This is done for any file that exists in the repository but not in your source, and for files that you haven't changed but are  not
         the most recent versions available in the repository.



       P file

         Like U, but the cvs server sends a patch instead of an entire file.  This accomplishes the same thing as U using less bandwidth.



       A file

         The  file  has been added to your private copy of the sources, and will be added to the source repository when you run commit on the file.  This is a reminder to you that the file needs to be com-
         mitted.



       R file

         The file has been removed from your private copy of the sources, and will be removed from the source repository when you run commit on the file.  This is a reminder to you that the file  needs  to
         be committed.



       M file

         The file is modified in  your  working  directory.

         M  can  indicate  one of two states for a file you're working on: either there were no modifications to the same file in the repository, so that your file remains as you last saw it; or there were
         modifications in the repository as well as in your copy, but they were merged successfully, without conflict, in your working directory.

         cvs will print some messages if it merges your work, and a backup copy of your working file (as it looked before you ran update) will be made.  The exact name of that file is printed while  update
         runs.



       C file

         A  conflict was detected while trying to merge your changes to file with changes from the source repository.  file (the copy in your working directory) is now the result of attempting to merge the
         two revisions; an unmodified copy of your file is also in your working directory, with the name .#file.revision where revision is the revision that your modified file started  from.   Resolve  the
         conflict  as  described  in see node `Conflicts example' in the CVS manual.  (Note that some systems automatically purge files that begin with .# if they have not been accessed for a few days.  If
         you intend to keep a copy of your original file, it is a very good idea to rename it.)  Under vms, the file name starts with __ rather than .#.



       ? file

         file is in your working directory, but does not correspond to anything in the source repository, and is not in the list of files for cvs to ignore (see the description of the -I  option,  and  see
         node `cvsignore' in the CVS manual).

AUTHORS
       Dick Grune
              Original author of the cvs shell script version posted to comp.sources.unix in the volume6 release of December, 1986.  Credited with much of the cvs conflict resolution algorithms.

       Brian Berliner
              Coder and designer of the cvs program itself in April, 1989, based on the original work done by Dick.

       Jeff Polk
              Helped Brian with the design of the cvs module and vendor branch support and author of the checkin(1) shell script (the ancestor of cvs import).

       Larry Jones, Derek R. Price, and Mark D. Baushke
              Have helped maintain cvs for many years.

       And many others too numerous to mention here.

SEE ALSO
       The most comprehensive manual for CVS is Version Management with CVS by Per Cederqvist et al.  Depending on your system, you may be able to get it with the info CVS command or it may be available as
       cvs.pdf (Portable Document Format), cvs.ps (PostScript), cvs.texinfo (Texinfo source), or cvs.html.

       For CVS updates, more information on documentation, software related to CVS, development of CVS, and more, see:

           http://cvshome.org

 ci(1), co(1), cvs(5), cvsbug(8), diff(1), grep(1), patch(1), rcs(1), rcsdiff(1), rcsmerge(1), rlog(1).



                                                                                                                                                                                                       CVS(1)
