DEBCONF-MERGETEMPLATE(1)                                              Debconf                                             DEBCONF-MERGETEMPLATE(1)

NAME
       debconf-mergetemplate - merge together multiple debconf template files

SYNOPSIS
        debconf-mergetemplate [options] [templates.ll ...] templates

DESCRIPTION
       Note: This utility is deprecated. You should switch to using po-debconf's po2debconf program.

       This program is useful if you have multiple debconf templates files which you want to merge together into one big file. All the specified
       files will be read in, merged, and output to standard output.

       This can be especially useful if you are dealing with translated template files. In this case, you might have your main template file, plus
       several other files provided by the translators. These files will have translated fields in them, and maybe the translators left in the
       english versions of the fields they translated, for their reference.

       So, you want to merge together all the translated templates files with your main templates file. Any fields that are unique to the
       translated files need to be added in to the correct templates, but any fields they have in common should be superseded by the fields in the
       main file (which might be more up-to-date).

       This program handles that case properly, just list each of the translated templates files, and then your main templates file last.

OPTIONS
       --outdated
           Merge in even outdated translations. The default is to drop them with a warning message.

       --drop-old-templates
           If a translation has an entire template that is not in the master file (and thus is probably an old template), drop that entire
           template.

SEE ALSO
       debconf-getlang(1)

AUTHOR
       Joey Hess <joeyh@debian.org>

                                                                    2019-05-06                                            DEBCONF-MERGETEMPLATE(1)
