mouse-test(1)                                                                              General Commands Manual                                                                              mouse-test(1)



NAME
       mouse-test - a tool for determining mouse type and device it's attached to.

SYNTAX
       mouse-test [ device ... ]

DESCRIPTION
       This experimental and incomplete application tries to help in detecting which protocol does your mouse speak. It is able to detect MouseMan devices, and to choose between -t ms (three-buttons aware)
       and -t bare old two-buttons-only serial mice.


BUGS
       I know the application is buggy, but I only own one mouse device.  If you are interested in this application, just call me and awake me from my laziness.


   OPTIONS
       device [ device ... ]

       Check this device for a mouse.  If no devices are listed, mouse-test will try all possible devices.


AUTHOR
       Alessandro Rubini <rubini@linux.it>


FILES
       /dev/*              The devices used to search for a mouse


SEE ALSO
       gpm(8)




                                                                                                March 26, 1998                                                                                  mouse-test(1)
