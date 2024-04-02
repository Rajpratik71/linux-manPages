INSTALL-CATALOG(8)                                                                                                                                                                         INSTALL-CATALOG(8)



NAME
       install-catalog - Manage a SGML or XML centralized catalog

SYNOPSIS
       install-catalog [ option ]  action  ... [  [ -d]  [ --delegate] ]  [  [ -a centralized ordinary]  [ --add centralized ordinary]

        [ -r centralized ordinary]  [ --remove centralized ordinary]

        [ -h]  [ --help]

        [ -v]  [ --version] ]


DESCRIPTION
       This shell script allows to handle a centralized catalog referencing other "ordinary" SGML or XML Open Catalogs.

       An  Open  Catalog  contains  a  set  of  directives  defined  by  OASIS,  mostly  used  for  defining  equivalences  between  FPIs (Formal Public Identifiers) and real file names (see TR9401:1997 on
       http://www.oasis-open.org <URL:http://www.oasis-open.org>).  The Open Catalogs usually reside in /usr/share/sgml.

       A centralized catalog is a special Open Catalog that includes only comments and CATALOG directives pointing to other catalogs (or DELEGATE directives if supported). The centralized  catalog  can  be
       the key to all other SGML resources. It usually resides in /etc/sgml.

       The  centralized catalog can be edited manually or through the install-catalog script to add or remove references to other ordinary catalogs. This script is mainly destined to software package post-
       installation scripts.

       An example of a typical call to install-catalog is:

             install-catalog --add \
               /usr/share/sgml/docbook/dsssl-stylesheets-1.54/catalog \
               /etc/sgml/sgml-docbook-4.0.cat


       This call will install in /etc/sgml/sgml-docbook-4.0.cat a reference to /usr/share/sgml/docbook/dsssl-stylesheets-1.54/catalog.

OPTIONS
       Here is the list of options that can influence the way install-catalog works:

        [  [ -d]  [ --delegate] ]


       Use DELEGATE instead of CATALOG directives to specify a pointer

ACTIONS
       Here is the list of actions that can be requested to install-catalog:

        [  [ -a centralized ordinary]  [ --add centralized ordinary] ]


       Declare a new SGML package.

        [  [ -r centralized ordinary]  [ --remove centralized ordinary] ]


       Remove a previously installed SGML package.

        [  [ -h]  [ --help] ]


       Print a short help message and exit

        [  [ -v]  [ --version] ]


       Print the version identifier and exit

FILES
       /etc/sgml/*

       The SGML centralized catalogs

AUTHORS
       Eric Bischoff <ebisch@cybercable.tm.fr>

       Developper of install-catalog.

SEE ALSO
       jw(1)

       conversion from DocBook to other file formats



       nsgmls(1)

       a base component of Jade DSSSL engine



       http://sourceware.cygnus.com/docbook-tools/ <URL:http://sourceware.cygnus.com/docbook-tools/>

       the home page of the DocBook tools, a compendium of all tools necessary to process DocBook files, including the SGML-common stuff.



                                                                                                04 August 2000                                                                             INSTALL-CATALOG(8)
