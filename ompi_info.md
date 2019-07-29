OMPI_INFO(1)                                                         Open MPI                                                         OMPI_INFO(1)

NAME
       ompi_info - Display information about the Open MPI installation

SYNOPSIS
       ompi_info [options]

DESCRIPTION
       ompi_info provides detailed information about the Open MPI installation.  It can be useful for at least three common scenarios:

       1. Checking local configuration and seeing how Open MPI was installed.

       2. Submitting bug reports / help requests to the Open MPI community (see http://www.open-mpi.org/community/help/)

       3. Seeing a list of installed Open MPI plugins and querying what MCA parameters they support.

       NOTE:  ompi_info  defaults  to  only  showing a few MCA parameters by default (i.e., level 1 parameters).  Use the --level option to enable
       showing more options (see the LEVELS section for more information).

OPTIONS
       ompi_info accepts the following options:

       -a|--all
               Show all configuration options and MCA parameters.  Also changes the default MCA parameter level to 9, unless --level is also spec‐
               ified.

       --arch  Show architecture on which Open MPI was compiled.

       -c|--config
               Show configuration options

       -gmca|--gmca <param> <value>
               Pass global MCA parameters that are applicable to all contexts.

       -h|--help
               Shows help / usage message.

       --hostname
               Show the hostname on which Open MPI was configured and built.

       --internal
               Show internal MCA parameters (not meant to be modified by users).

       --level <level>
               Show  only  variables  with at most this level (1-9). The default is 1 unless --all is specified without --level, in which case the
               default is 9. See the LEVELS section for more information.

       -mca|--mca <param> <value>
               Pass context-specific MCA parameters; they are considered global if --gmca is not used and only one context is specified.

       --param <type> <component>
               Show MCA parameters.  The first parameter is the type of the component to display; the second parameter is the  specific  component
               to display (or the keyword "all", meaning "display all components of this type").

       --parsable
               When  used  in  conjunction  with  other  parameters,  the output is displayed in a machine-parsable format --parseable Synonym for
               --parsable

       --path <type>
               Show paths that Open MPI was configured with.  Accepts  the  following  parameters:  prefix,  bindir,  libdir,  incdir,  pkglibdir,
               sysconfdir.

       --pretty
               When used in conjunction with other parameters, the output is displayed in 'prettyprint' format (default)

       --selected-only
               Show only variables from selected components.

       -V|--version
               Show version of Open MPI.

LEVELS
       Open  MPI  has  many, many run-time tunable parameters (called "MCA parameters"), and usually only a handfull of them are useful to a given
       user.

       As such, Open MPI has divided these parameters up into nine distinct levels, broken down into three categories, each with  three  sub-cate‐
       gories.

       Note  that since each MCA parameter is accessible through the MPI_T control variable API (introduced in MPI-3.0), these levels exactly cor‐
       respond to the nine MPI_T cvar levels.

       The three categories are:

       End user
           Generally, these are parameters that are required for correctness, meaning that a user may need to set these  just  to  get  their  MPI
           application to run correctly. For example, BTL "if_include" and "if_exclude" parameters fit into this category.

       Application tuner
           Generally,  these  are  parameters  that  can  be used to tweak MPI application performance. This even includes parameters that control
           resource exhaustion levels (e.g., number of free list entries, size of buffers, etc.), and could be considered "correctness" parameters
           if they're set too low. But, really -- they're tuning parameters.

       Open MPI developer
           Parameters  in  this  category  either don't fit in the other two, or are specifically intended for debugging / development of Open MPI
           itself.

       And within each category, there are three sub-categories:

       Basic
           This sub-category is for parameters that everyone in this category will want to  see  --  even  less-advanced  end  users,  application
           tuners, and new OMPI developers.

       Detailed
           This sub-category is for parameters that are generally useful, but users probably won't need to change them often.

       All This sub-category is for all other parameters. Such parameters are likely fairly esoteric.

       Combining the categories and sub-categories, here's how Open MPI defines all nine levels:

       1   Basic information of interest to end users.

       2   Detailed information of interest to end users.

       3   All remaining information of interest to end users.

       4   Basic information required for application tuners.

       5   Detailed information required for application tuners.

       6   All remaining information required for application tuners.

       7   Basic information for Open MPI implementors.

       8   Detailed information for Open MPI implementors.

       9   All remaining information for Open MPI implementors.

       By default, ompi_info only shows level 1 MCA parameters.  To see more MCA parameters, use the --level command line option.

EXAMPLES
       ompi_info
           Show the default output of options and listing of installed components in a human-readable / prettyprint format.

       ompi_info --parsable
           Show the default output of options and listing of installed components in a machine-parsable format.

       ompi_info --param btl tcp
           Show the level 1 MCA parameters of the "tcp" BTL component in a human-readable / prettyprint format.

       ompi_info --param btl tcp --level 6
           Show the level 1 through level 6 MCA parameters of the "tcp" BTL component in a human-readable / prettyprint format.

       ompi_info --param btl tcp --parsable
           Show the level 1 MCA parameters of the "tcp" BTL component in a machine-parsable format.

       ompi_info --path bindir
           Show the "bindir" that Open MPI was configured with.

       ompi_info --version
           Show the version of Open MPI version numbers in a prettyprint format.

       ompi_info --all
           Show all information about the Open MPI installation, including all components that can be found, all the MCA parameters that they sup‐
           port (i.e., levels 1 through 9), versions of Open MPI and the components, etc.

AUTHORS
       The Open MPI maintainers -- see http://www.openmpi.org/ or the file AUTHORS.

       This manual page was originally contributed by Dirk Eddelbuettel <edd@debian.org>, one of the Debian GNU/Linux maintainers  for  Open  MPI,
       and may be used by others.

1.10.2                                                             Jan 21, 2016                                                       OMPI_INFO(1)
