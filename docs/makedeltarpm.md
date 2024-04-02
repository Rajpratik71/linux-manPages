MAKEDELTARPM(8)                                                                            System Manager's Manual                                                                            MAKEDELTARPM(8)



NAME
       makedeltarpm - create a deltarpm from two rpms


SYNOPSIS
       makedeltarpm [-v] [-V version] [-z compression] [-m mbytes] [-s seqfile] [-r] [-u] oldrpm newrpm deltarpm
       makedeltarpm [-v] [-V version] [-z compression] [-s seqfile] [-u] -p oldrpmprint oldpatchrpm oldrpm newrpm deltarpm


DESCRIPTION
       makedeltarpm  creates a deltarpm from two rpms. The deltarpm can later be used to recreate the new rpm from either filesystem data or the old rpm. Use the -v option to make makedeltarpm more verbose
       about its work (use it twice to make it even more verbose).

       If you want to create a smaller and faster to combine "rpm-only" deltarpm which does not work with filesystem data, specify the -r option.

       makedeltarpm normally produces a V3 format deltarpm, use the -V option to specify a different version if desired. The -z option can be used to specify a different compression method, the default  is
       to use the same compression method as used in the new rpm.

       The -s option makes makedeltarpm write out the sequence id to the specified file seqfile.

       If  you  also  use patch rpms you should use the -p option to specify the rpm-print of oldrpm and the created patch rpm. This option tells makedeltarpm to exclude the files that were not included in
       the patch rpm but are not byteswise identical to the ones in oldrpm.

       makedeltarpm can also create an "identity" deltarpm by adding the -u switch. In this case only one rpm has to be specified. An identity deltarpm can be useful to just replace the signature header of
       a rpm or to reconstruct a rpm from the filesystem.


MEMORY CONSIDERATIONS
       makedeltarpm normally needs about three to four times the size of the rpm's uncompressed payload. You can use the -m option to enable a sliding block algorithm that needs mbytes megabytes of memory.
       This trades memory usage with the size of the created deltarpm. Furthermore, the uncompressed deltarpm payload is currently also stored in memory when this option is used, but it tends to  be  small
       in most cases.


SEE ALSO
       applydeltarpm(8) combinedeltarpm(8)


AUTHOR
       Michael Schroeder <mls@suse.de>



                                                                                                   Jul 2010                                                                                   MAKEDELTARPM(8)
