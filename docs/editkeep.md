editkeep(8)                                                                                                                                                                                editkeep(8)

NAME
       editkeep - frontend for deborphan

SYNOPSIS
       editkeep [options]

DESCRIPTION
       editkeep is a frontend for deborphan displaying a list of orphaned packages (-a for all-sections is implied) and packages which are tagged to never been shown using dialog or whiptail.

       Packages may be selected to be added or removed from deborphans keep list, i.e. the list of files it never proposes for removal.

OPTIONS
       -n Turn off nice-mode.  See the deborphan manpage for description.

SEE ALSO
       deborphan(1), orphaner(8), apt-get(8)

April 2004                                                                                                                                                                                 editkeep(8)
