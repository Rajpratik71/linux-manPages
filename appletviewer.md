appletviewer(1)                               Basic Tools                              appletviewer(1)

NAME
       appletviewer - Runs applets outside of a web browser.

SYNOPSIS
       appletviewer [options] url...

       options
              The command-line options separated by spaces. See Options.

       url    The location of the documents or resources to be displayed. You can specify multiple
              URLs separated by spaces.

DESCRIPTION
       The appletviewer command connects to the documents or resources designated by urls and displays
       each applet referenced by the documents in its own window. If the documents referred to by urls
       do not reference any applets with the OBJECT, EMBED, or APPLET tag, then the appletviewer
       command does nothing. For details about the HTML tags that the appletviewer command supports,
       see AppletViewer Tags at
       http://docs.oracle.com/javase/8/docs/technotes/tools/appletviewertags.html

       The appletviewer command requires encoded URLs according to the escaping mechanism defined in
       RFC2396. Only encoded URLs are supported. However, file names must be unencoded, as specified
       in RFC2396.

       Note: The appletviewer command is intended for development purposes only. For more information,
       see About Sample/Test Applications and Code at
       http://docs.oracle.com/javase/8/docs/technotes/samples/aboutCodeSamples.html

OPTIONS
       -debug
              Starts the Applet Viewer in the Java debugger with the jdb command to debug the applets
              in the document.

       -encoding encoding-name
              Specifies the input HTML file encoding name.

       -Jjavaoption
              Passes the string javaoption as a single argument to the Java interpreter, which runs
              the Applet Viewer. The argument should not contain spaces. Multiple argument words must
              all begin with the prefix -J. This is useful for adjusting the compiler's execution
              environment or memory usage.

JDK 8                                      21 November 2013                            appletviewer(1)
