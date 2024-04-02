setfdprm(1)                                                                              General Commands Manual                                                                              setfdprm(1)

Name
       setfdprm - sets user-provided floppy disk parameters

Note
       This  manpage has been automatically generated from fdutils's texinfo documentation.  However, this process is only approximative, and some items, such as cross-references, footnotes and indices
       are lost in this translation process.  Indeed, these items have no appropriate representation in the manpage format.  Moreover, only the items specific to each command have been translated,  and
       the general information about fdutils has been dropped in the manpage version.  Thus I strongly advise you to use the original texinfo doc.

       *      To generate a printable copy from the texinfo doc, run the following commands:

                     ./configure; make dvi; dvips fdutils.dvi

       *      To generate a HTML copy,  run:

                     ./configure; make html

              A pre-made HTML can be found at: `http://www.tux.org/pub/knaff/fdutils'

       *      To generate an info copy (browsable using emacs' info mode), run:

                     ./configure; make info

       The texinfo doc looks most pretty when printed or as HTML.  Indeed, in the info version certain examples are difficult to read due to the quoting conventions used in info.

Description
          setfdprm [-p] device media-description

          setfdprm [-c | -y | -n] device

       setfdprm  is  a utility that can be used to load disk parameters into the auto-detecting floppy devices and "fixed parameter" floppy devices, to clear old parameter sets and to disable or enable
       diagnostic messages.  These parameters are derived from a media-description, see section  Media description for more details.

       Without any options, setfdprm loads the device (for example `/dev/fd0' or `/dev/fd1') with a new parameter set with the name entry found in `/etc/mediaprm' (usually named  360/360,  etc.).   For
       autodetecting floppy devices, these parameters stay in effect until the media is changed. For "fixed parameter" devices, they stay in effect until they are changed again.

       Setfdprm can also be used by the superuser to redefine the default formats.

Options
       -p device name
              Permanently  loads  a  new  parameter  set  for the specified auto-configuring floppy device for the configuration with name in `/etc/mediaprm'. Alternatively, the parameters can be given
              directly from the command line.

       -c device
              Clears the parameter set of the specified auto-configuring floppy device.

       -y device
              Enables format detection messages for the specified auto-configuring floppy device.

       -n device
              Disables format detection messages for the specified auto-configuring floppy device.

Media description
       Please see the Media description section in the full fdutils documentation:
       - Texinfo documentation (info fdutils)
       - HTML documentation in /usr/share/doc/fdutils/Fdutils.html
       - or DVI documentation in /usr/share/doc/fdutils/Fdutils.dvi.gz

Bugs
       This documentation is grossly incomplete.

See Also
       Fdutils' texinfo doc

fdutils-5.5                                                                                      03Mar05                                                                                      setfdprm(1)
