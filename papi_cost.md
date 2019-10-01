papi_cost(1)                                                                                         PAPI                                                                                        papi_cost(1)



NAME
       papi_cost - papi_cost utility.

       file cost.c

NAME
       papi_cost - computes execution time costs for basic PAPI operations.

Synopsis
       papi_cost [-dhs] [-b bins] [-t threshold]

Description
       papi_cost is a PAPI utility program that computes the min / max / mean / std. deviation of execution times for PAPI start/stop pairs and for PAPI reads. This information provides the basic operating
       cost to a user's program for collecting hardware counter data. Command line options control display capabilities.

Options
       · -b < bins > Define the number of bins into which the results are partitioned for display. The default is 100.
       · -d Display a graphical distribution of costs in a vertical histogram.
       · -h Display help information about this utility.
       · -s Show the number of iterations in each of the first 10 standard deviations above the mean.
       · -t < threshold > Set the threshold for the number of iterations to measure costs. The default is 100,000.
Bugs
       There are no known bugs in this utility. If you find a bug, it should be reported to the PAPI Mailing List at ptools-perfapi@ptools.org.



Version 5.2.0.0                                                                                Tue Oct 30 2018                                                                                   papi_cost(1)
