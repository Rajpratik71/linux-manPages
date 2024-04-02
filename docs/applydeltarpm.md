APPLYDELTARPM(8)                                                                           System Manager's Manual                                                                           APPLYDELTARPM(8)



NAME
       applydeltarpm - reconstruct an rpm from a deltarpm


SYNOPSIS
       applydeltarpm [-v] [-p] [-r oldrpm] deltarpm newrpm
       applydeltarpm -c|-C deltarpm
       applydeltarpm [-c|-C] -s sequence
       applydeltarpm -i deltarpm


DESCRIPTION
       applydeltarpm applies a binary delta to either an old rpm or to on-disk data to re-create a new rpm. The old rpm can be specified with the -r option, if no rpm name is provided on-disk data is used.
       You can use -p to make applydeltarpm print the percentage of completion, or -v to make it more verbose about its operation.

       The second an third form can be used to check if the reconstruction is possible. It may fail if the on-disk data got changed (deltarpms are created in a way that config file changes do  not  matter)
       or the deltarpm does not match the rpm the delta was generated with. The -c option selects full (i.e. slow) on-disk checking, whereas -C only checks if the filesizes have not changed.

       Instead of a full deltarpm a sequence id can be given with the -s sequence option. Such an id contains all the information that is needed to do reconstruction checking.

       Finally information about a deltarpm can be printed with the -i option.


MEMORY CONSIDERATIONS
       applydeltarpm was written to work on systems with limited memory.  It uses a paging algorithm to keep the size of in-core data low and not bring the system in an out-of-memory situation.


EXIT STATUS
       applydeltarpm returns 0 if the rpm could be recreated or the checking succeeded, it returns 1 and prints an error message to stderr if something failed.


SEE ALSO
       makedeltarpm(8), rpm(8)


AUTHOR
       Michael Schroeder <mls@suse.de>



                                                                                                   Feb 2005                                                                                  APPLYDELTARPM(8)
