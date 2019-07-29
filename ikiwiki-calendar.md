ikiwiki-calendar(1)                                           General Commands Manual                                          ikiwiki-calendar(1)

NAME
       ikiwiki-calendar - create calendar archive pages

SYNOPSIS
       ikiwiki-calendar [-f] your.setup [pagespec] [startyear [endyear]]

DESCRIPTION
       ikiwiki-calendar  creates pages that use the ikiwiki/directive/calendar directive, allowing the archives to be browsed one month at a time,
       with calendar-based navigation.

       You must specify the setup file for your wiki. The pages will be created inside its srcdir, beneath the archivebase directory used  by  the
       calendar plugin (default "archives").

       To control which pages are included on the calendars, a ikiwiki/PageSpec can be specified. The default is all pages, or the pages specified
       by the comments_pagespec setting in the config file. A pagespec can also be specified on the command line. To limit it to only posts  in  a
       blog, use something like "posts/* and !*/Discussion".

       It  defaults  to creating calendar pages for the current year. If you specify a year, it will create pages for that year.  Specify a second
       year to create pages for a span of years.

       Existing pages will not be overwritten by this command by default.  Use the -f switch to force it to overwrite any existing pages.

CRONTAB
       While this command only needs to be run once a year to update the archive pages for each new year, you are recommended to set up a cron job
       to run it daily, at midnight. Then it will also update the calendars to highlight the current day.

       An example crontab:

        0 0 * * * ikiwiki-calendar ~/ikiwiki.setup 'posts/* and !*/Discussion'

TEMPLATES
       This command uses two templates to generate the pages, calendarmonth.tmpl and calendaryear.tmpl.

plugins/calendar setup option
       Most  of the goals of this command can be replaced by setting up calendar_autocreate setup option (of plugin plugins/calendar), and running
       ikiwiki --setup you.setup. The only thing that ikiwiki-calendar can do and that  ikiwiki  cannot  is  forcing  page  generation  (using  -f
       switch).

AUTHOR
       Joey Hess <joey@ikiwiki.info>

                                                                                                                               ikiwiki-calendar(1)
