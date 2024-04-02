papi_multiplex_cost(1)                                                                               PAPI                                                                              papi_multiplex_cost(1)



NAME
       papi_multiplex_cost - papi_multiplex_cost utility.

       file multiplex.c

NAME
       papi_multiplex_cost - computes execution time costs for basic PAPI operations on multiplexed EventSets.

Synopsis
       papi_cost [-m, --min < min >] [-x, --max < max >] [-k,-s]

Description
       papi_multiplex_cost is a PAPI utility program that computes the min / max / mean / std. deviation of execution times for PAPI start/stop pairs and for PAPI reads on multiplexed eventsets. This
       information provides the basic operating cost to a user's program for collecting hardware counter data. Command line options control display capabilities.

Options
       · -m < Min number of events to test >
       · -x < Max number of events to test >
       · -k, Do not time kernel multiplexing
       · -s, Do not ime software multiplexed EventSets
       · -t THREASHOLD, Test with THRESHOLD iterations of counting loop.
Bugs
       There are no known bugs in this utility. If you find a bug, it should be reported to the PAPI Mailing List at ptools-perfapi@ptools.org.



Version 5.2.0.0                                                                                Tue Oct 30 2018                                                                         papi_multiplex_cost(1)
