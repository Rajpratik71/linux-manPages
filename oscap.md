OSCAP(8)                                                                               System Administration Utilities                                                                               OSCAP(8)



NAME
       oscap - OpenSCAP command line tool


SYNOPSIS
       oscap [general-options] module operation [operation-options-and-arguments]


DESCRIPTION
       oscap is Security Content Automation Protocol (SCAP) toolkit based on OpenSCAP library. It provides various functions for different SCAP specifications (modules).

       OpenSCAP tool claims to provide capabilities of Authenticated Configuration Scanner and Authenticated Vulnerability Scanner as defined by The National Institute of Standards and Technology.


GENERAL OPTIONS
       -V, --version
              Print supported SCAP specification, location of schema files, schematron files, CPE files, probes and supported OVAL objects.  Displays a list of inbuilt CPE names.

       -h, --help
              Help screen.


MODULES
       info   Determine type and print information about a file.

       xccdf  The eXtensible Configuration Checklist Description Format.

       oval   Open Vulnerability and Assessment Language.

       ds     SCAP Data Stream

       cpe    Common Platform Enumeration.

       cvss   Common Vulnerability Scoring System

       cve    Common Vulnerabilities and Exposures


INFO OPERATIONS
       [options] any-scap-file.xml
              This  module  prints  information about SCAP content in a file specified on a command line. It determines SCAP content type, specification version, date of creation, date of import and so on.
              Info module doesn't require any additional opperation switch.

              For XCCDF or Datastream files, info module prints out IDs of incorporated profiles, components, and datastreams. These IDs can be used to specify the target for evaluation. Use options --pro‐
              file, --xccdf-id (or --oval-id), and --datastream-id respectively.

              --fetch-remote-resources
                     Allow download of remote components referenced from Datastream.

              --profile PROFILE
                     Show info of the profile with the given ID.

              --profiles
                     Show profiles from the input file in the <id>:<title> format, one line per profile.


XCCDF OPERATIONS
       eval [options] INPUT_FILE [oval-definitions-files]
              Perform  evaluation  of  XCCDF document file given as INPUT_FILE. Print result of each rule to standard output, including rule title, rule id and security identifier(CVE, CCE). Optionally you
              can give a source datastream as the INPUT_FILE instead of an XCCDF file (see --datastream-id).

              oscap returns 0 if all rules pass. If there is an error during evaluation, the return code is 1. If there is at least one rule with either fail or unknown  result,  oscap-scan  finishes  with
              return code 2.

              Unless --skip-valid is used, the INPUT_FILE is validated using XSD schemas (depending on document type of INPUT_FILE) and rejected if invalid.

              You  may  specify OVAL Definition files as the last parameter, XCCDF evaluation will then proceed only with those specified files. Otherwise, when oval-definitions-files parameter is missing,
              oscap tool will try to load all OVAL Definition files referenced from XCCDF automatically (search in the same path as XCCDF).

              --profile PROFILE
                     Select a particular profile from XCCDF document.

              --rule RULE
                     Select a particular rule from XCCDF document. Only this rule will be evaluated. Rule will use values according to the selected profile. If no profile is selected,  default  values  are
                     used.

              --tailoring-file TAILORING_FILE
                     Use  given file for XCCDF tailoring. Select profile from tailoring file to apply using --profile. If both --tailoring-file and --tailoring-id are specified, --tailoring-file takes pri‐
                     ority.

              --tailoring-id COMPONENT_REF_ID
                     Use tailoring component in input source datastream for XCCDF tailoring. The tailoring component must be specified by its Ref-ID (value of component-ref/@id attribute  in  input  source
                     datastream). Select profile from tailoring component to apply using --profile. If both --tailoring-file and --tailoring-id are specified, --tailoring-file takes priority.

              --cpe CPE_FILE
                     Use given CPE dictionary or language (auto-detected) for applicability checks. (Some CPE names are provided by openscap, see oscap --version for Inbuilt CPE names)

              --results FILE
                     Write XCCDF results into FILE.

              --results-arf FILE
                     Writes results to a given FILE in Asset Reporting Format. It is recommended to use this option instead of --results when dealing with datastreams.

              --stig-viewer FILE
                     Writes XCCDF results into FILE in a format readable by DISA STIG Viewer. See http://iase.disa.mil/stigs/Pages/stig-viewing-guidance.aspx

              --thin-results
                     Thin Results provides only minimal amount of information in OVAL/ARF results. The option --without-syschar is automatically enabled when you use Thin Results.

              --without-syschar
                     Don't provide system characteristics in OVAL/ARF result files.

              --report FILE
                     Write HTML report into FILE. You also have to specify --results for this feature to work. Please see --oval-results to enable additional information in the report.

              --oval-results
                     Generate  OVAL  Result file for each OVAL session used for evaluation. File with name 'original-oval-definitions-filename.result.xml' will be generated for each referenced OVAL file in
                     current working directory. This option (in conjunction with the --report option) also enables inclusion of additional OVAL information in the XCCDF  report.  To  change  the  directory
                     where OVAL files are generated change the CWD using the `cd` command.

              --check-engine-results
                     After evaluation is finished, each loaded check engine plugin is asked to export its results. The export itself is plugin specific, please refer to documentation of the plugin for more
                     details.

              --export-variables
                     Generate OVAL Variables documents which contain external variables' values that were provided to the OVAL checking engine during evaluation. The filename format is 'original-oval-defi‐
                     nitions-filename-session-index.variables-variables-index.xml'.

              --datastream-id ID
                     Uses  a  datastream  with  that particular ID from the given datastream collection. If not given the first datastream is used. Only applies if you give source datastream in place of an
                     XCCDF file.

              --xccdf-id ID
                     Takes component ref with given ID from checklists. This allows to select a particular XCCDF component even in cases where there are 2 XCCDFs in one datastream. If none  is  given,  the
                     first component from the checklists element is used.

              --benchmark-id ID
                     Selects  a component ref from any datastream that references a component with XCCDF Benchmark such that its @id attribute matches given string exactly. Please note that this is not the
                     recommended way of selecting a component-ref. You are advised to use --xccdf-id AND/OR --datastream-id for more precision. --benchmark-id is only used when both --xccdf-id and --datas‐
                     tream-id are not present on the command line!

              --skip-valid
                     Do not validate input/output files.

              --fetch-remote-resources
                     Allow download of remote OVAL content referenced from XCCDF by check-content-ref/@href.

              --remediate
                     Execute  XCCDF  remediation in the process of XCCDF evaluation. This option automatically executes content of XCCDF fix elements for failed rules, and thus this shall be avoided unless
                     for trusted content. Use of this option is always at your own risk.

              --verbose VERBOSITY_LEVEL
                     Turn on verbose mode at specified verbosity level. VERBOSITY_LEVEL is one of: DEVEL, INFO, WARNING, ERROR.

              --verbose-log-file FILE
                     Set filename to write additional information.

       remediate [options] INPUT_FILE [oval-definitions-files]
              This module provides post-scan remediation. It assumes that the INPUT_FILE is result of `oscap xccdf eval` operation. The input file must contain  TestResult  element.  This  module  executes
              XCCDF fix elements for failed rule-result contained in the given TestResult. Use of this option is always at your own risk and it shall be avoided unless for trusted content.

              --result-id ID
                     ID of the XCCDF TestResult element which shall be remedied. If this option is missing the last TestResult (in top-down processing) will be remedied.

              --skip-valid
                     Do not validate input/output files.

              --fetch-remote-resources
                     Allow download of remote OVAL content referenced from XCCDF by check-content-ref/@href.

              --cpe CPE_FILE
                     Use given CPE dictionary or language (auto-detected) for applicability checks.

              --results FILE
                     Write XCCDF results into FILE.

              --results-arf FILE
                     Writes results to a given FILE in Asset Reporting Format. It is recommended to use this option instead of --results when dealing with datastreams.

              --stig-viewer FILE
                     Writes XCCDF results into FILE in a format readable by DISA STIG Viewer. See http://iase.disa.mil/stigs/Pages/stig-viewing-guidance.aspx

              --report FILE
                     Write HTML report into FILE. You also have to specify --results for this feature to work.

              --oval-results
                     Generate  OVAL  Result  file  for each OVAL session used for evaluation. File with name 'original-oval-definitions-filename.result.xml' will be generated for each referenced OVAL file.
                     This option (with conjunction with the --report option) also enables inclusion of additional OVAL information in the XCCDF report.

              --check-engine-results
                     After evaluation is finished, each loaded check engine plugin is asked to export its results. The export itself is plugin specific, please refer to documentation of the plugin for more
                     details.

              --export-variables
                     Generate OVAL Variables documents which contain external variables' values that were provided to the OVAL checking engine during evaluation. The filename format is 'original-oval-defi‐
                     nitions-filename-session-index.variables-variables-index.xml'.

       resolve -o output-file xccdf-file
              Resolve an XCCDF file as described in the XCCDF specification. It will flatten inheritance hierarchy of XCCDF profiles, groups, rules, and values. Result is another XCCDF document, which will
              be written to output-file.

              --force
                     Force resolving XCCDF document even if it is already marked as resolved.

       validate [options] xccdf-file
              Validate given XCCDF file against a XML schema. Every found error is printed to the standard error. Return code is 0 if validation succeeds, 1 if validation could not be performed due to some
              error, 2 if the XCCDF document is not valid.

              --schematron
                     Turn on Schematron-based validation. It is able to find more errors and inconsistencies but is much slower. Schematron is available only for XCCDF version 1.2.

       export-oval-variables [options] xccdf-file [oval-definitions-files]
              Collect all the XCCDF values that would be used by OVAL during evaluation of a certain profile and export them as OVAL external-variables document(s). The filename format  is  'original-oval-
              definitions-filename-session-index.variables-variables-index.xml'.

              --profile PROFILE
                     Select a particular profile from XCCDF document.

              --fetch-remote-resources
                     Allow download of remote OVAL content referenced from XCCDF by check-content-ref/@href.

              --skip-valid
                     Do not validate input/output files.

              --datastream-id ID
                     Uses  a  datastream  with  that particular ID from the given datastream collection. If not given the first datastream is used. Only applies if you give source datastream in place of an
                     XCCDF file.

              --xccdf-id ID
                     Takes component ref with given ID from checklists. This allows to select a particular XCCDF component even in cases where there are 2 XCCDFs in one datastream.

              --cpe CPE_FILE
                     Use given CPE dictionary or language (auto-detected) for applicability checks. The variables documents are created only for xccdf:Rules which are applicable.

       generate [options] <submodule> [submodule-specific-options]
              Generate another document form an XCCDF file such as security guide or result report.

              --profile ID
                     Apply profile with given ID to the Benchmark before further processing takes place.

              Available submodules:

              guide [options] xccdf-file
                     Generate a formatted document containing a security guide from a XCCDF Benchmark. Unless the --output option is specified it will be written to the  standard  output.  Without  profile
                     being set only groups (not rules) will be included in the output.

                     --output FILE
                            Write the guide to this file instead of standard output.

                     --hide-profile-info
                            Information on chosen profile (e.g. rules selected by the profile) will be excluded from the document.

              report [options] xccdf-file
                     Generate  a  document containing results of a XCCDF Benchmark execution. Unless the --output option is specified it will be written to the standard output. ID of the TestResult element
                     to visualise defaults to the most recent result (according to the end-time attribute).

                     --output FILE
                            Write the report to this file instead of standard output.

                     --result-id ID
                            ID of the XCCDF TestResult from which the report will be generated.

                     --show what
                            Specify what result types shall be displayed in the result report. The default is to show everything except for rules with results notselected and notapplicable. The  what  part
                            is  a comma-separated list of result types to display in addition to the default. If result type is prefixed by a dash '-', it will be excluded from the results. If what is pre‐
                            fixed by an equality sign '=', a following list specifies exactly what rule types to include in the report. Result types are:  pass,  fixed,  notchecked,  notapplicable,  notse‐
                            lected, informational, unknown, error, fail.

                     --oval-template template-string
                            To use the ability to include additional information from OVAL in xccdf result file, a template which will be used to obtain OVAL result file names has to be specified. The tem‐
                            plate can be either a filename or a string containing wildcard character (percent sign '%'). Wildcard will be replaced by the original OVAL definition file  name  as  referenced
                            from  the  XCCDF file. This way it is possible to obtain OVAL information even from XCCDF documents referencing several OVAL files. To use this option with results from an XCCDF
                            evaluation, specify %.result.xml as a OVAL file name template.

                     --sce-template template-string
                            To use the ability to include additional information from SCE in XCCDF result file, a template which will be used to obtain SCE result file names has to be specified.  The  tem‐
                            plate  can  be  either a filename or a string containing wildcard character (percent sign '%'). Wildcard will be replaced by the original SCE script file name as referenced from
                            the XCCDF file. This way it is possible to obtain SCE information even from XCCDF documents referencing several SCE files. To use this option with results from an XCCDF  evalua‐
                            tion, specify %.result.xml as a SCE file name template.

              fix [options] xccdf-file
                     Generate  a script that shall bring the system to a state of compliance with given XCCDF Benchmark. There are 2 possibilities when generating fixes: Result-oriented fixes (--result-id)
                     or Profile-oriented fixes (--profile). Result-oriented takes precedences over Profile-oriented, if result-id is given, oscap will ignore any profile provided.

                     Result-oriented fixes are generated using result-id provided to select only the failing rules from results in xccdf-file, it skips all other rules.

                     Profile-oriented fixes are generated using all rules within the provided profile. If no result-id/profile are provided, (default) profile will be used to generate fixes.

                     --fix-type TYPE
                            Specify fix type. There are multiple programming languages in which the fix script can be generated. TYPE should be one of: bash, ansible, puppet,  anaconda.  Default  is  bash.
                            This option is mutually exclusive with --template, because fix type already determines the template URN.

                     --output FILE
                            Write the report to this file instead of standard output.

                     --result-id ID
                            Fixes will be generated for failed rule-results of the specified TestResult.

                     --template ID|FILE
                            Template  to  be used to generate the script. If it contains a dot '.' it is interpreted as a location of a file with the template definition. Otherwise it identifies a template
                            from standard set which currently includes: bash (default if no --template switch present). Brief explanation of the process of writing your own templates is  in  the  XSL  file
                            xsl/legacy-fix.xsl in the openscap data directory. You can also take a look at the default template xsl/legacy-fixtpl-bash.xml.

                     --xccdf-id ID
                            Takes component ref with given ID from checklists. This allows to select a particular XCCDF component even in cases where there are 2 XCCDFs in one datastream. If none is given,
                            the first component from the checklists element is used.

                     --benchmark-id ID
                            Selects a component ref from any datastream that references a component with XCCDF Benchmark such that its @id attribute matches given string exactly.

                     --tailoring-file TAILORING_FILE
                            Use given file for XCCDF tailoring. Select profile from tailoring file to apply using --profile. If both --tailoring-file  and  --tailoring-id  are  specified,  --tailoring-file
                            takes priority.

                     --tailoring-id COMPONENT_REF_ID
                            Use  tailoring  component  in input source datastream for XCCDF tailoring. The tailoring component must be specified by its Ref-ID (value of component-ref/@id attribute in input
                            source datastream). Select profile from tailoring component to apply using --profile. If both --tailoring-file and --tailoring-id are specified, --tailoring-file takes priority.

              custom --stylesheet xslt-file [options] xccdf-file
                     Generate a custom output (depending on given XSLT file) from an XCCDF file.

                     --stylesheet FILE
                            Specify an absolute path to a custom stylesheet to format the output.

                     --output FILE
                             Write the document into file.


OVAL OPERATIONS
       eval [options] INPUT_FILE
              Probe the system and evaluate all definitions from OVAL Definition file. Print result of each definition to standard output. The return code is 0 after a   successful  evaluation.  On  error,
              value 1 is returned.

              INPUT_FILE can be either OVAL Definition File or SCAP Source Datastream, it depends on used options.

              Unless --skip-valid is used, the INPUT_FILE is validated using XSD schemas (depending on document type of INPUT_FILE) and rejected if invalid.

              --id DEFINITION-ID
                     Evaluate ONLY specified OVAL Definition from OVAL Definition File.

              --variables FILE
                     Provide external variables expected by OVAL Definition File.

              --directives FILE
                     Use OVAL Directives content to specify desired results content.

              --without-syschar
                     Don't provide system characteristics in result file.

              --results FILE
                     Write OVAL Results into file.

              --report FILE
                     Create human readable (HTML) report from OVAL Results.

              --datastream-id ID
                     Uses  a  datastream  with  that particular ID from the given datastream collection. If not given the first datastream is used. Only applies if you give source datastream in place of an
                     OVAL file.

              --oval-id ID
                     Takes component ref with given ID from checks. This allows to select a particular OVAL component even in cases where there are 2 OVALs in one datastream.

              --skip-valid
                     Do not validate input/output files.

              --fetch-remote-resources
              Allow download of remote components referenced from Datastream.

       --verbose VERBOSITY_LEVEL
              Turn on verbose mode at specified verbosity level. VERBOSITY_LEVEL is one of: DEVEL, INFO, WARNING, ERROR.

       --verbose-log-file FILE
              Set filename to write additional information.


       collect [options] definitions-file
              Probe the system and gather system characteristics for all objects in OVAL Definition file.

              --id OBJECT-ID
                     Collect system characteristics ONLY for specified OVAL Object.

              --variables FILE
                     Provide external variables expected by OVAL Definitions.

              --syschar FILE
                     Write OVAL System Characteristic into file.

              --skip-valid
                     Do not validate input/output files.

              --verbose VERBOSITY_LEVEL
                     Turn on verbose mode at specified verbosity level. VERBOSITY_LEVEL is one of: DEVEL, INFO, WARNING, ERROR.

              --verbose-log-file FILE
                     Set filename to write additional information.


       analyse [options] --results FILE definitions-file syschar-file
              In this mode, the oscap tool does not perform data collection on the local system, but relies upon the input file, which may have been generated on another system. The output  (OVAL  Results)
              is printed to file specified by --results parameter.

              --variables FILE
                     Provide external variables expected by OVAL Definitions.

              --directives FILE
                     Use OVAL Directives content to specify desired results content.

              --skip-valid
                     Do not validate input/output files.

              --verbose VERBOSITY_LEVEL
                     Turn on verbose mode at specified verbosity level. VERBOSITY_LEVEL is one of: DEVEL, INFO, WARNING, ERROR.

              --verbose-log-file FILE
                     Set filename to write additional information.


       validate [options] oval-file
              Validate  given OVAL file against a XML schema. Every found error is printed to the standard error. Return code is 0 if validation succeeds, 1 if validation could not be performed due to some
              error, 2 if the OVAL document is not valid.

              --definitions, --variables, --syschar, --results --directives
                     Type of the OVAL document is automatically detected by default. If you want enforce certain document type, you can use one of these options.

              --schematron
                     Turn on Schematron-based validation. It is able to find more errors and inconsistencies but is much slower.

       generate <submodule> [submodule-specific-options]
              Generate another document form an OVAL file.

              Available submodules:

              report [options] oval-results-file
                     Generate a formatted HTML page containing visualisation of an OVAL results file. Unless the --output option is specified it will be written to the standard output.

                     --output FILE
                            Write the report to this file instead of standard output.

       list-probes [options]
              List supported object types (i.e. probes)

              --static
                     List all probes defined in the internal tables.

              --dynamic
                     List all probes supported on the current system (this is default behavior).

              --verbose
                     Be verbose.



CPE OPERATIONS
       check name
              Check whether name is in correct CPE format.

       match name dictionary.xml
              Find an exact match of CPE name in the dictionary.

       validate cpe-dict-file
              Validate given CPE dictionary file against a XML schema. Every found error is printed to the standard error. Return code is 0 if validation succeeds, 1 if validation could  not  be  performed
              due to some error, 2 if the XCCDF document is not valid.


CVSS OPERATIONS
       score cvss_vector
              Calculate  score from a CVSS vector. Prints base score for base CVSS vector, base and temporal score for temporal CVSS vector, base and temporal and environmental score for environmental CVSS
              vector.

       describe cvss_vector
              Describe individual components of a CVSS vector in a human-readable format and print partial scores.

       CVSS vector consists of several slash-separated components specified as key-value pairs. Each key can be specified at most once. Valid CVSS vector has to contain at least base CVSS metrics, i.e. AV,
       AC, AU, C, I, and A. Following table summarizes the components and possible values (second column is metric category: B for base, T for temporal, E for environmental):

              AV:[L|A|N]            B   Access vector: Local, Adjacent network, Network

              AC:[H|M|L]            B   Access complexity: High, Medium, Low

              AU:[M|S|N]            B   Required authentication: Multiple instances, Single instance, None

              C:[N|P|C]             B   Confidentiality impact: None, Partial, Complete

              I:[N|P|C]             B   Integrity impact: None, Partial, Complete

              A:[N|P|C]             B   Availability impact: None, Partial, Complete

              E:[ND|U|POC|F|H]      T   Exploitability: Not Defined, Unproven, Proof of Concept, Functional, High

              RL:[ND|OF|TF|W|U]     T   Remediation Level: Not Defined, Official Fix, Temporary Fix, Workaround, Unavailable

              RC:[ND|UC|UR|C]       T   Report Confidence: Not Defined, Unconfirmed, Uncorroborated, Confirmed

              CDP:[ND|N|L|LM|MH|H]  E   Collateral Damage Potential: Not Defined, None, Low, Low-Medium, Medium-High, High

              TD:[ND|N|L|M|H]       E   Target Distribution: Not Defined, None, Low, Medium, High

              CR:[ND|L|M|H]         E   Confidentiality requirement: Not Defined, Low, Medium, High

              IR:[ND|L|M|H]         E   Integrity requirement: Not Defined, Low, Medium, High

              AR:[ND|L|M|H]         E   Availability requirement: Not Defined, Low, Medium, High

DS OPERATIONS
       sds-compose [options] SOURCE_XCCDF TARGET_SDS
              Creates a source datastream from the XCCDF file given in SOURCE_XCCDF and stores the result in TARGET_SDS. Dependencies like OVAL files are automatically detected and bundled in target source
              datastream.

              --skip-valid
                     Do not validate input/output files.

       sds-add [options] NEW_COMPONENT EXISTING_SDS
              Adds given NEW_COMPONENT file to the existing source datastream (EXISTING_SDS). Component file might be OVAL, XCCDF or CPE Dictionary file. Dependencies  like  OVAL  files  are  automatically
              detected  an bundled in target source datastream.

              --datastream-id DATASTREAM_ID
                     Uses a datastream with that particular ID from the given datastream collection. If not given the first datastream is used.

              --skip-valid
                     Do not validate input/output files.

       sds-split [options] SOURCE_DS TARGET_DIR
              Splits given source datastream into multiple files and stores all the files in TARGET_DIR.

              --datastream-id DATASTREAM_ID
                     Uses a datastream with that particular ID from the given datastream collection. If not given the first datastream is used.

              --xccdf-id XCCDF_ID
                     Takes component ref with given ID from checklists. This allows to select a particular XCCDF component even in cases where there are 2 XCCDFs in one datastream.

              --skip-valid
                     Do not validate input/output files.

              --fetch-remote-resources
                     Allow download of remote components referenced from Datastream.

       sds-validate SOURCE_DS
              Validate given source datastream file against a XML schema. Every found error is printed to the standard error. Return code is 0 if validation succeeds, 1 if validation could not be performed
              due to some error, 2 if the source datastream is not valid.

       rds-create [options] SDS TARGET_ARF XCCDF_RESULTS [OVAL_RESULTS [OVAL_RESULTS ..]]
              Takes given source datastream, XCCDF and OVAL results and creates a result datastream (in Asset Reporting Format) and saves it to file given in TARGET_ARF.

              --skip-valid
                     Do not validate input/output files.

       rds-split [options] [--report-id REPORT_ID] RDS TARGET_DIR
              Takes given result datastream (also called ARF = asset reporting format) and splits given report and its respective report-request to given target directory. If  no  report-id  is  given,  we
              assume user wants the first applicable report in top-down order in the file.

              --skip-valid
                     Do not validate input/output files.

       rds-validate SOURCE_RDS
              Validate given result datastream file against a XML schema. Every found error is printed to the standard error. Return code is 0 if validation succeeds, 1 if validation could not be performed
              due to some error, 2 if the result datastream is not valid.


CVE OPERATIONS
       validate cve-nvd-feed.xml
              Validate given CVE data feed.

       find CVE cve-nvd-feed.xml
              Find given CVE in data feed and report base score, vector string and vulnerable software list.


EXIT STATUS
       Normally, the exit status is 0 when operation finished successfully and 1 otherwise. In cases when oscap performs evaluation of the system it may return 2 indicating success  of  the  operation  but
       incompliance of the assessed system.


EXAMPLES
       Evaluate XCCDF content using CPE dictionary and produce html report. In this case we use United States Government Configuration Baseline (USGCB) for Red Hat Enterprise Linux 5 Desktop.

               oscap xccdf eval --fetch-remote-resources --oval-results \
                       --profile united_states_government_configuration_baseline \
                       --report usgcb-rhel5desktop.report.html \
                       --results usgcb-rhel5desktop-xccdf.xml.result.xml \
                       --cpe usgcb-rhel5desktop-cpe-dictionary.xml \
                       usgcb-rhel5desktop-xccdf.xml

CONTENT
        SCAP Security Guide - https://github.com/OpenSCAP/scap-security-guide/

        National Vulnerability Database - http://web.nvd.nist.gov/view/ncp/repository

        Red Hat content repository - http://www.redhat.com/security/data/oval/



REPORTING BUGS
       Please report bugs using https://github.com/OpenSCAP/openscap/issues
       Make sure you include the full output of `oscap --v` in the bug report.


AUTHORS
       Peter Vrabec <pvrabec@redhat.com>
       Šimon Lukašík
       Martin Preisler <mpreisle@redhat.com>



Red Hat                                                                                           March 2017                                                                                         OSCAP(8)
