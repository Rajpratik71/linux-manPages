XMLTO(1)                                                                                          Reference                                                                                          XMLTO(1)



NAME
       xmlto - apply an XSL stylesheet to an XML document

SYNOPSIS
       xmlto [-o output_dir] [-x custom_xsl] [-m xsl_fragment] [-v] [-p postprocessor_opts] [--extensions] [--searchpath path] [--skip-validation] [--stringparam paramname=paramvalue] [--noclean]
             [--noautosize] [--noextensions] [--with-fop] [--with-dblatex] {format} {file}

       xmlto {[--help] | [--version]}

DESCRIPTION
       The purpose of xmlto is to convert an XML file to the desired format using whatever means necessary. This may involve two steps:

        1. The application of an appropriate XSL stylesheet using an XSL-T processor.

        2. Further processing with other tools. This step may not be necessary.

       To decide which stylesheet to use and what, if any, needs to be done to post-process the output, xmlto makes use of format scripts, which are simple shell scripts that xmlto calls during the
       conversion.

       The appropriate format script is selected based on the type of XML file and the desired output format.  xmlto comes with some format scripts for converting DocBook XML files to a variety of formats.
       You may specify your own format script by using an absolute filename for format on the command line.

       Firstly, if xmlto has not been told explicitly which stylesheet to use (with the -x option), the format script will be called with $1 set to stylesheet. The environment variable XSLT_PROCESSOR
       contains the base name of the executable that will be used to perform the XSL-T transformation (for example xsltproc). The format script should write the name of the stylesheet to use to standard
       output and exit successfully, or exit with a non-zero return code if there is no appropriate stylesheet to use (for example, if the only available stylesheet is known not to work with the XSL-T
       processor that will be used). If nothing is written to standard output but the script exits successfully, no XSL-T transformation will be performed.

       Secondly, after an XSL-T processor has been run using the stylesheet, the format script will be called again, this time with $1 set to post-process. The format script should perform any necessary
       steps to translate the XSL-T processed output into the desired output format, including copying the output to the desired output directory. For post-processing, the format script is run in a
       temporary directory containing just the processed output (whose name is stored in XSLT_PROCESSED and whose basename is that of the original XML file with any filename extension replaced with .proc).
       INPUT_FILE is set to the name of the original XML file, OUTPUT_DIR is set to the name of the directory that the output (and only the output) must end up in, and SEARCHPATH is set to a colon-separate
       list of fallback directories in which to look for input (for images, for example). If this step is unsuccessful the format script should exit with a non-zero return code.

OPTIONS
       -v
           Be verbose (-vv for very verbose).

       -x stylesheet
           Use stylesheet instead of asking the format script to choose one.

       -m fragment
           Use the provided XSL fragment to modify the stylesheet.

       -o directory
           Put output in the specified directory instead of the current working directory.

       -p postprocessor_opts
           Pass postprocessor_opts to processing stages after stylesheet application (e.g.  lynx or links when going through HTML to text, or xmltex when going from through TeX to DVI). If -p is specified
           a second time, the options specified will be passed to second-stage postprocessing; presently this is only applicable when going through xmltex and dvips to PostScript.

       --extensions
           Turn on stylesheet extensions for the tool chain in use (use.extensions is turned on). The variables turned on are the ones used by Norman Walsh's DocBook XSL stylesheets.

       --searchpath path
           Add the colon-separated list of directories in path as fallback directories for including input.

       --skip-validation
           Skip the validation step that is normally performed.

       --stringparam paramname=paramvalue
           Pass a named parameter paramname with value paramvalue to stylesheet from the command line.

       --noclean
           Temporary files are not deleted(their names are shown and kept in tmp directory). It could help with analyzing problems.

       --noautosize
           By default, some XSL variables are overriden by autodetection (page.width and page.height for paperconf (libpaper) use, paper.type for locale-based (LC_PAPER) selection). With this option, xmlto
           doesn’t use this autodetection and user is able to modify defaults himself (either via default param.xsl modification or by user-defined XSL fragment).

       --noextensions
           By default, xmlto enables XSL params passivetex.extensions for passivetex backend and fop.extensions and fop1.extensions for fop backend. This usually produces better results. If you for some
           reason don't want to use these parameters, just disable them using this option.

       --with-fop
           Use fop for formatting. It is an experimental option, expects fop in specific location(detected at configured time), could be changed manually in xmlto script by modification of FOP_PATH

       --with-dblatex
           Use dblatex for formatting. It is an experimental option, expects dblatex in specific location(detected at configured time), could be changed manually in xmlto script by modification of
           DBLATEX_PATH

       --help
           Display a short usage message. It will describe xmlto's options, and the available output formats.

       --version
           Display the version number of xmlto.

ENVIRONMENT
       XSLT_PROCESSOR
           Base name of the executable that will be used to perform the XSL-T transformation (default: xsltproc(1)).

       TMPDIR
           Directory, where to create temporary stylesheets (default: /tmp).

DIAGNOSTICS
       0
           Everything went fine. This is the expected exit code.

       1
           xmlto was called with insufficient arguments.

       2
           mktemp(1) failed to create a file/directory. Make sure /tmp or TMPDIR is writable.

       3
           xmlto failed to find some binary on configured location. Make sure that all required packages are installed and paths in xmlto script are set properly.

       10+(Validation non-zero error code)
           xmlto tried to validate a xml document, but validation failed. For better diagnostic, validation output and xmllint exit code is provided. Consider either fixing your document or using
           --skip-validation.

EXAMPLES
       To convert a DocBook XML document to PDF, use:

           xmlto pdf mydoc.xml

       To convert a DocBook XML document to HTML and store the resulting HTML files in a separate directory use:

           xmlto -o html-dir html mydoc.xml

       To convert a DocBook XML document to a single HTML file use:

           xmlto html-nochunks mydoc.xml

       To modify the output using an XSL fragment use:

           xmlto -m ulink.xsl pdf mydoc.xml

       To specify which stylesheet to use (overriding the one that the format script would choose) use:

           xmlto -x mystylesheet.xsl pdf mydoc.xml

AUTHORS
       Tim Waugh <twaugh@redhat.com>
           Original author, maintainer until 0.0.18

       Ondřej Vašík <ovasik@redhat.com>
           Maintainer since 0.0.19

COPYRIGHT
xmlto 0.0.25                                                                                    November 2011                                                                                        XMLTO(1)
