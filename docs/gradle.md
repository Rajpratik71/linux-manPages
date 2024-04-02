GRADLE(1)                                                   Gradle Command Line Manual                                                   GRADLE(1)

NAME
       gradle - Adaptable, fast automation for all

SYNOPSIS
       gradle [option...] [task...]

OPTIONS
       A detailed guide of the command line interface is provided on Gradle's official website. The project itself does not provide a manpage,
       therefore maintaining it is error-prone and costly.

       The summary of the options is provided below.

       -?, -h, --help
           Shows a help message.

       -a, --no-rebuild (deprecated)
           Do not rebuild project dependencies.

       --all
           Shows additional detail in the task listing. See the documentation section LISTING TASKS.

       -b, --build-file
           Specifies the build file. See the documentation section SELECTING BUILD.

       --build-cache (incubating)
           Enables the Gradle build cache. Gradle will try to reuse outputs from previous builds.

       --no-build-cache (incubating)
           Disables the Gradle build cache.

       -c, --settings-file
           Specifies the settings file.

       --console
           Specifies which type of console output to generate.

           Set to plain to generate plain text only. This option disables all color and other rich output in the console output.

           Set to auto (the default) to enable color and other rich output in the console output when the build process is attached to a console,
           or to generate plain text only when not attached to a console.

           Set to rich to enable color and other rich output in the console output, regardless of whether the build process is not attached to a
           console. When not attached to a console, the build output will use ANSI control characters to generate the rich output.

           Set to verbose to enable color and other rich output like the rich, but output more detailed message (task name, output, etc.)

       --continue
           Continues task execution after a task failure.

       --configure-on-demand (incubating)
           Only relevant projects are configured in this build run. This means faster builds for large multi-projects. See the documentation
           section CONFIGURATION ON DEMAND.

       --no-configure-on-demand (incubating)
           Disables the use of configuration on demand.

       -D, --system-prop
           Sets a system property of the JVM, for example -Dmyprop=myvalue. See the documentation section GRADLE PROPERTIES AND SYSTEM PROPERTIES.

       -d, --debug
           Log in debug mode (includes normal stacktrace). See the documentation section LOGGING.

       -g, --gradle-user-home
           Specifies the Gradle user home directory. The default is the .gradle directory in the user's home directory.

       --include-build
           Run the build as a composite, including the specified build. See the documentation section COMPOSITE BUILDS.

       -I, --init-script
           Specifies an initialization script. See the documentation section INIT SCRIPTS.

       -i, --info
           Set log level to info. See the documentation section LOGGING.

       -m, --dry-run
           Runs the build with all task actions disabled. See the documentation section DRY RUN.

       --offline
           Specifies that the build should operate without accessing network resources. See the documentation section CACHE COMMAND LINE OPTIONS.

       -P, --project-prop
           Sets a project property of the root project, for example -Pmyprop=myvalue. See the documentation section GRADLE PROPERTIES AND SYSTEM
           PROPERTIES.

       -p, --project-dir
           Specifies the start directory for Gradle. Defaults to current directory. See the documentation section SELECTING BUILD.

       --parallel (incubating)
           Build projects in parallel. Gradle will attempt to determine the optimal number of executor threads to use. This option should only be
           used with decoupled projects (see the documentation section DECOUPLED PROJECTS). For limitations of this option please see the
           documentation section PARALLEL EXECUTION.

       --no-parallel (incubating)
           Disables parallel execution to build projects.

       --max-workers (incubating)
           Sets the maximum number of workers that Gradle may use. For example --max-workers=3. The default is the number of processors.

       --profile
           Profiles build execution time and generates a report in the   buildDir  /reports/profile directory. See the documentation section
           PROFILING BUILD.

       --project-cache-dir
           Specifies the project-specific cache directory. Default value is .gradle in the root project directory.

       -q, --quiet
           Log errors only. See the documentation section LOGGING.

       --recompile-scripts (deprecated)
           Forces scripts to be recompiled, bypassing caching. This option has been deprecated and is scheduled to be removed Gradle 5.0. You
           should avoid using it.

       --refresh-dependencies
           Refresh the state of dependencies. See the documentation section CACHE COMMAND LINE OPTIONS.

       --rerun-tasks
           Specifies that any task optimization is ignored.

       -S, --full-stacktrace
           Print out the full (very verbose) stacktrace for any exceptions. See the documentation section LOGGING.

       -s, --stacktrace
           Print out the stacktrace also for user exceptions (e.g. compile error). See the documentation section LOGGING.

       --scan (incubating)
           Creates a build scan. Gradle will auto-apply the build scan plugin with a compatible version. For more information about build scans,
           please visit <https://gradle.com/build-scans>.

       --no-scan (incubating)
           Disables the creation of a build scan. For more information about build scans, please visit <https://gradle.com/build-scans>.

       -t, --continuous (incubating)
           Enables the documentation section CONTINUOUS BUILD,CONTINUOUS BUILDING - Gradle will automatically re-run when changes are detected.

       -u, --no-search-upward
           Don't search in parent directories for a settings.gradle file.

       -v, --version
           Prints version info.

       -w, --warn
           Set log level to warn. See the documentation section LOGGING

       -x, --exclude-task
           Specifies a task to be excluded from execution. See the documentation section EXCLUDING TASKS FROM THE COMMAND LINE.

           The above information is printed to the console when you execute gradle -h.

SEE ALSO
       <https://docs.gradle.org/current/userguide/command_line_interface.html>

AUTHORS
       Gradle developers

Gradle 4.4.1                                                        2019-12-10                                                           GRADLE(1)
