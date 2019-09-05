RPMDB2SOLV(1)                                                                                      LIBSOLV                                                                                      RPMDB2SOLV(1)



NAME
       rpmdb2solv - convert the rpm database into a solv file

SYNOPSIS
       rpmdb2solv [OPTIONS] [REFFILE.solv]

DESCRIPTION
       The rpmdb2solv tool reads rpm’s installed packages database and writes it in solv file format to standard output. You can make use of an old version of the database by specifying a REFFILE.solv
       file.

       -o OUTFILE
           Write the generated solv to OUTFILE instead of standard output.

       -P
           Print percentages as packages are being read in. The output format is like rpm’s --percent option.

       -r ROOTDIR
           Use ROOTDIR as root directory.

       -k
           Read pubkeys from the rpm database instead of installed packages. Note that many distributions stopped storing pubkeys in the database but use a directory like /var/lib/rpm/pubkeys instead.

       -A
           Also scan the /usr/share/appdata for installed appdata files and create pseudo packages for each file.

       -p PRODDIR
           Also read SUSE product files from directory PRODDIR. The standard directory is /etc/products.d.

       -n
           Do not read any packages from the rpm database. This is useful together with -p to only convert SUSE products.

       -X
           Autoexpand SUSE pattern and product provides into packages.

SEE ALSO
       rpms2solv(1)

AUTHOR
       Michael Schroeder <mls@suse.de>



libsolv                                                                                           08/26/2015                                                                                    RPMDB2SOLV(1)
