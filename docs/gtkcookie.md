gtkcookie(1)                                                  General Commands Manual                                                 gtkcookie(1)

NAME
       gtkcookie - edit Netscape cookie file

SYNOPSIS
       gtkcookie [ Gtk options ]

DESCRIPTION
   Options
       gtkcookie supports the command flags common to all Gtk applications.  There are no gtkcookie-specific flags.

   What happens at startup
       On  startup, gtkcookie will try to find your Netscape cookie file by looking for ~/.netscape/cookies. If ~/.netscape/cookies is found, gtk‐
       cookie will load the file and show it in a multi-column list.

   Opening a cookie file
       Regardless of whether gtkcookie finds your cookie file, or you have to open it manually, when you open the file, all of your Netscape cook‐
       ies are displayed in whatever order Netscape wrote them into the file.

   Sorting a cookie file
       You can sort the cookies by any column by clicking on the heading for that column.

   Human-readable dates
       The final column is actually not stored in your cookie file, but is a translation of Netscape's native date field. Netscape stores the date
       as the number of seconds since 1 Jan 1970 (familiar to anyone who's spent any time on Unix), but  gtkcookie  translates  those  dates  into
       human-readable expiry dates in the final column.

   Editing cookies
       To  edit  a  cookie,  double-click on the cookie, and a cookie edit dialogue will pop up. You'll notice that the date, in seconds since the
       epoch (the epoch is 1 Jan 1970), is not an editable field, whereas the human-readable date is. Follow the format presented in the edit dia‐
       logue box, and as you edit the human-readable date, the expiry date in seconds since the epoch will update itself. Please note (as repeated
       in the bugs section below) that although dates later than 2038 are supposed to present problems, (you'll see the date in seconds since  the
       epoch become -1) dates on or after 2036 seem to present problems. I'm still looking into this.

   Searching for text strings
       Under  the  Edit  menu, select Find. Type in a string or substring that you wish to find, and press the Find button.  If the string or sub‐
       string is found anywhere in a cookie, that cookie will become selected, and the view will scroll to that cookie,  if  necessary.   Pressing
       Find again will search for the next instance, or pop up a "not found" dialogue box if the string wasn't found. In its current version, gtk‐
       cookie isn't yet smart enough to re-start a search from the top of the cookie list, so if you need to search from the top,  hightlight  the
       first cookie, and then do your search.

   Deleting cookies
       Right click on a cookie, and select "Delete" from the popup menu, or click on the cookie and press "Del" on your keyboard.

   Creating cookies
       Press  the "Create Cookie" button. A cookie with dummy values will be added to the cookie list, and the "Edit Cookie" dialogue box will pop
       up so that you can edit the new cookie to your liking.  Note that even if you press "Cancel" immediately after creating a new  cookie,  the
       new cookie, with its dummy values, will still be in the list.  You'll have to delete the cookie manually.

FILES
       ~/.netscape/cookies
              The Netscape cookie file in your home directory

SEE ALSO
       None

NOTES
       None

AUTHOR
       Manni Wood: mwood@sig.bsh.com or pq1036@110.net

BUGS
       1.  The "Edit Cookie" dialogue has problems with on-the-fly conversion of human-readable dates to the number of seconds since the epoch for
       dates later than 2036. For some reason, despite the fact that the date is supposed to overflow in 2038, the C function  strptime  flubs  up
       the conversion for dates larger than 1036.

       Unfortunately,  this  means  that when you edit a cookie whose expiry date is after 2036, the edit dialogue box shows the number of seconds
       since the epoch as -1. There is currently no workaround to this problem, besides moving the date back 2 years.

       2. Although the "find" feature is supposed to always highlight and scroll to any found item, sometimes, the item becomes  highlighted,  but
       is outside the current view.

       3.  The file open and save dialogues don't show directories beginning with a dot (such as .netscape!) but typing such directory names manu‐
       ally will work.

       4. Double-clicking in the scroll bar will pop up the "Edit Cookie" dialogue box for the currently highlighted cookie.

       5. Editing the cookie file while Netscape is running is futile, because Netscape will re-write the cookie  file  when  you  exit  Netscape,
       based on what's in its memory, not what's in the cookie file. A popup menu in my programme warns you of a running netscape... unless you're
       running Netscape 4.5. Netscape 4.5 doesn't seem to create the same lock file that earlier Netscapes used to.

                                                                   October 1998                                                       gtkcookie(1)
