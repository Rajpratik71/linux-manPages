DEBCHECKOUT(1)                                                                                                                                                                             DEBCHECKOUT(1)

NAME
       debcheckout - checkout the development repository of a Debian package

SYNOPSIS
       debcheckout [OPTIONS] PACKAGE [DESTDIR]
       debcheckout [OPTIONS] REPOSITORY_URL [DESTDIR]
       debcheckout --help

DESCRIPTION
       debcheckout retrieves the information about the Version Control System used to maintain a given Debian package (the PACKAGE argument), and then checks out the latest (potentially unreleased)
       version of the package from its repository.  By default the repository is checked out to the PACKAGE directory; this can be overridden by providing the DESTDIR argument.

       The information about where the repository is available is expected to be found in Vcs-* fields available in the source package record. For example, the vim package exposes such information with
       a field like Vcs-Hg: http://hg.debian.org/hg/pkg-vim/vim, you can see it by grepping through apt-cache showsrc vim.

       If more than one source package record containing Vcs-* fields is available, debcheckout will select the record with the highest version number.  Alternatively, a particular version may be
       selected from those available by specifying the package name as PACKAGE=VERSION.

       If you already know the URL of a given repository you can invoke debcheckout directly on it, but you will probably need to pass the appropriate -t flag. That is, some heuristics are in use to
       guess the repository type from the URL; if they fail, you might want to override the guessed type using -t.

       The currently supported version control systems are: Arch (arch), Bazaar (bzr), CVS (cvs), Darcs (darcs), Git (git), Mercurial (hg) and Subversion (svn).

OPTIONS
       GENERAL OPTIONS

       -a, --auth
           Work in authenticated mode; this means that for known repositories (mainly those hosted on https://alioth.debian.org) URL rewriting is attempted before checking out, to ensure that the
           repository can be committed to. For example, for Subversion repositories hosted on alioth this means that svn+ssh://svn.debian.org/... will be used instead of svn://svn.debian.org/....

           There are built-in rules for alioth.debian.org and github.com. Other hosts can be configured using DEBCHECKOUT_AUTH_URLS.

       -d, --details
           Only print a list of detailed information about the package repository, without checking it out; the output format is a list of fields, each field being a pair of TAB-separated field name
           and field value. The actual fields depend on the repository type. This action might require a network connection to the remote repository.

           Also see -p. This option and -p are mutually exclusive.

       -h, --help
           Print a detailed help message and exit.

       -p, --print
           Only print a summary about package repository information, without checking it out; the output format is TAB-separated with two fields: repository type, repository URL. This action works
           offline, it only uses "static" information as known by APT's cache.

           Also see -d. This option and -d are mutually exclusive.

       -P package, --package package
           When checking out a repository URL, instead of trying to guess the package name from the URL, use this package name.

       -t TYPE, --type TYPE
           Override the repository type (which defaults to some heuristics based on the URL or, in case of heuristic failure, the fallback "svn"); should be one of the currently supported repository
           types.

       -u USERNAME, --user USERNAME
           Specify the login name to be used in authenticated mode (see -a). This option implies -a: you don't need to specify both.

       -f FILE, --file FILE
           Specify that the named file should be extracted from the repository and placed in the destination directory. May be used more than once to extract multiple files.

       --source=never|auto|download-only|always
           Some packages only place the debian directory in version control.  debcheckout can retrieve the remaining parts of the source using apt-get source and move the files into the checkout.

           never
               Only use the repository.

           auto (default)
               If the repository only contains the debian directory, retrieve the source package, unpack it, and also place the .orig.tar.gz file into the current directory. Else, do nothing.

           download-only
               Always retrieve the .orig.tar.gz file, but do not unpack it.

           always
               Always retrieve the .orig.tar.gz file, and if the repository only contains the debian directory, unpack it.

       VCS-SPECIFIC OPTIONS

       GIT-SPECIFIC OPTIONS

       --git-track BRANCHES
           Specify a list of remote branches which will be set up for tracking (as in git branch --track, see git-branch(1)) after the remote Git repository has been cloned. The list should be given as
           a space-separated list of branch names.

           As a shorthand, the string "*" can be given to require tracking of all remote branches.

CONFIGURATION VARIABLES
       The two configuration files /etc/devscripts.conf and ~/.devscripts are sourced by a shell in that order to set configuration variables. Command line options can be used to override configuration
       file settings. Environment variable settings are ignored for this purpose. The currently recognised variables are:

       DEBCHECKOUT_AUTH_URLS
           This variable should be a space separated list of Perl regular expressions and replacement texts, which must come in pairs: REGEXP TEXT REGEXP TEXT ... and so on. Each pair denotes a
           substitution which is applied to repository URLs if other built-in means of building URLs for authenticated mode (see -a) have failed.

           References to matching substrings in the replacement texts are allowed as usual in Perl by the means of $1, $2, ... and so on.

           This setting can be used to enable authenticated mode for most repositories out there.  Note that the Debian repositories on alioth.debian.org ($vcs.debian.org) are implicitly defined.

           Here is a sample snippet suitable for the configuration files:

            DEBCHECKOUT_AUTH_URLS='
             ^\w+://(svn\.example\.com)/(.*)    svn+ssh://$1/srv/svn/$2
             ^\w+://(git\.example\.com)/(.*)    git+ssh://$1/home/git/$2
            '

           Note that whitespace is not allowed in either regexps or replacement texts. Also, given that configuration files are sourced by a shell, you probably want to use single quotes around the
           value of this variable.

       DEBCHECKOUT_SOURCE
           This variable determines under what scenarios the associated orig.tar.gz for a package will be downloaded.  See the --source option for a description of the values.

       DEBCHECKOUT_USER
           This variable sets the username for authenticated mode. It can be overridden with the --user option. Setting this variable does not imply the use of authenticated mode, it still has to be
           activated with --auth.

SEE ALSO
       apt-cache(8), Section 6.2.5 of the Debian Developer's Reference (for more information about Vcs-* fields): https://www.debian.org/doc/developers-reference/best-pkging-practices.html#bpp-vcs.

AUTHOR
       debcheckout and this manpage have been written by Stefano Zacchiroli <zack@debian.org>.

Debian Utilities                                                                                2016-03-23                                                                                 DEBCHECKOUT(1)
