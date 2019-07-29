omp(8)                                                        System Manager's Manual                                                       omp(8)

NAME
       omp - OMP command line client for the Open Vulnerability Assessment System (OpenVAS)

SYNOPSIS
       omp OPTIONS

DESCRIPTION
       Together,  OpenVAS  Scanner  (openvassd(8))  and  OpenVAS  Manager  (openvasmd(8)) provide the core functionality of the Open Vulnerability
       Assessment System (OpenVAS), with OpenVAS Scanner handling the actual scan process and OpenVAS Manager adding various management  function‐
       alities to handle and organise scan results.

       The  omp binary is a command line client which uses the OMP protocol to connect to the OpenVAS Manager and makes it easy to access the full
       functionality provided by the OpenVAS Manager conveniently from the command line and allows quick integration in a scripted environment.

OPTIONS
       -h, --host=HOST
              Connect to OpenVAS Manager on host HOST.

       -p, --port=PORT
              Connect to OpenVAS Manager on port PORT.

       -u, --username=USER
              Use the username USER to access the OpenVAS Manager.

       -w, --password=PASSWORD
              Use the password PASSWORD to access the OpenVAS Manager. If the password is not set as parameter,  it  will  be  requested  interac‐
              tively.

       --config-file=FILE
              Use the information provided in FILE as parameters for the connection to the OpenVAS Manager.

       --send-file=FILE
              Replace SENDFILE in xml string to send with base64 encoded content of FILE. Only the first occurrence is replaced.

       -P, --prompt
              Prompt to exit.

       -O, --get-omp-version
              Display the OMP version used by OpenVAS Manager.

       -C, --create-task
              Create a task.

       -n, --name=NAME
              Use NAME as the name for the newly created task.

       -c, --comment=COMMENT
              Use COMMENT as the comment for the newly created task.

       -t, --target=TARGET
              Use TARGET as the target for the newly created task.

       --file Add text in stdin as file on task..

       -E, --delete-report
              Delete one or more reports.

       -D, --delete-task
              Delete one or more tasks.

       -R, --get-report
              Get report of one task.

       -F, --get-report-formats
              Get report formats (OMP 2.0 only).

       -f, --format=FORMAT
              Get report in format FORMAT.

       -G, --get-tasks
              Get status of one, many or all tasks.

       -g, --get-configs
              Get configs.

       -T, --get-targets
              Get targets.

       -M, --modify-task
              Modify a task.

       -S, --start-task
              Start one or more tasks.

       -X, --xml=COMMAND
              Send COMMAND as XML to the OpenVAS Manager (e.g. "<help/>", "<get_version/>").

       -i, --pretty-print
              In combination with -X, pretty print the response.

       -v, --version
              Print version.

       -?, --help
              Show help.

EXAMPLES
       omp --username foobar --get-tasks

       Connect to the OpenVAS Manager as user foobar and get the list of tasks.

SEE ALSO
       openvassd(8) gsad(8) openvasmd(8) check_omp(8)

MORE INFORMATION ABOUT THE OPENVAS PROJECT
       The  canonical  places  where  you  will  find  more  information  about  the  OpenVAS project are: http://www.openvas.org/ (Official site)
       http://wald.intevation.org/projects/openvas/ (Development Platform)

COPYRIGHT
       The omp command line client is released under the GNU GPL, version 2, or, at your option, any later version.

Manuals                                                                User                                                                 omp(8)
