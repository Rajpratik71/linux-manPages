CRONTABS(4)                                                                                 Crontabs users' Manual                                                                                CRONTABS(4)



NAME
       crontabs - configuration and scripts for running periodical jobs

SYNOPSIS
       run-parts [--list|--test]<directory>

DESCRIPTION
       Crontabs  is a historical name for the run-parts script and the system crontab. The run-parts script runs all executables in the specified directory.  Run-parts runs all executables in the specified
       directory.  The execution of files can be allowed or denied by creating file jobs.allow or jobs.deny which worked similar as other allow/deny config files. The file must be created in the  specified
       directory.

       --list print names of all files (not limited to executables), but don't run them. This option can't be used with test option.

       --test print names of files, which would be run.

              Randomization  of  jobs  can  be  configured in the /etc/sysconfig/run-parts file. To enable randomization of jobs, set the RANDOMIZE parameter to 1 and set the RANDOM parameter to an integer
              which determines a random seed. Additionally, you may configure the RANDOMTIME parameter (again, by specifying an integer) to provide an additional level of randomization. Jobs are  not  ran‐
              domized when the RANDOM and RANDOMTIME parameters are set to 0. Values in these two parameters must be set to 1 or larger to provide a good enough randomization.

              Randomization  of  cron  jobs can be useful for shared networks, where multiple cron jobs executed at once can cause spikes in traffic, especially during daily jobs. With randomized jobs, the
              workload is evenly distributed throughout the day.


EXAMPLE OF CONFIGURATION FILE
       RANDOMIZE=1
       RANDOM=4
       RANDOMTIME=8

       Historically the crontab file contained configuration which called run-parts on files in cron.{daily,weekly,monthly} directories. These jobs are now run indirectly through anacron  to  prevent  con‐
       flicts  between  cron and anacron.  That means the anacron package has to be installed if the jobs in these directories should be running. Refer to the anacron(8) how to limit the time of day of the
       job execution.


EXAMPLE
       /etc/cron.daily/jobs.deny could contain for example 0logwatch which forbid execution of this script.

SEE ALSO
       anacron(8), crontab(5)



Marcela Mašláňová                                                                                 2012-08-29                                                                                      CRONTABS(4)
