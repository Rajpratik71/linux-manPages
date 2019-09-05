OONIPROBE-AGENT(1)                                OONI: Open Observatory of Network Interference                                OONIPROBE-AGENT(1)

NAME
       ooniprobe-agent - an internet censorship measurement tool, system daemon.

SYNOPSIS
       ooniprobe-agent start | stop | run | status

DESCRIPTION
       ooniprobe-agent, is a system daemon responsible for automatically running OONI measurements and exposing a web user interface. The web user
       interface is accessible by default on http://127.0.0.1:8842/

OPTIONS
       --help Display help and exit.

       --version
              Display the ooniprobe version and exit.

COMMANDS
       start Start the ooniprobe-agent in the background

       stop Stop the ooniprobe-agent

       status Show status of the ooniprobe-agent

       run Run the ooniprobe-agent in the foreground

OONIPROBE
   Read this before running ooniprobe!
       Running ooniprobe is a potentially risky activity. This greatly depends on the jurisdiction in which you are in and which test you are run‐
       ning.  It  is  technically possible for a person observing your internet connection to be aware of the fact that you are running ooniprobe.
       This means that if running network measurement tests is something considered to be illegal in your country then you could be spotted.

       Furthermore, ooniprobe takes no precautions to protect the install target machine from forensics analysis.   If  the  fact  that  you  have
       installed or used ooni probe is a liability for you, please be aware of this risk.

   What is this?
       ooniprobe is the command line tool that volunteers and researches interested in contributing data to the project should be running.

       If you are interested in using ooniprobe from a graphical user interface refer to ooniprobe-agent and see how to run that.

       ooniprobe  allows  the  user to select what test should be run and what backend should be used for storing the test report and/or assisting
       them in the running of the test.

       ooniprobe tests are divided into two categories: Traffic Manipulation and Content Blocking.

       Traffic Manipulation tests aim to detect the presence of some sort of tampering with the internet traffic between the probe  and  a  remote
       test helper backend. As such they usually require the selection of a oonib backend component for running the test.

       Content  Blocking  are aimed at enumerating the kind of content that is blocked from the probes network point of view. As such they usually
       require to have specified an input list for running the test.

EXAMPLES
       Run the web_connectivity test on http://torproject.org:
          ooniprobe web_connectivity --url http://torproject.org/

       Run the http_invalid_request_line test to detect middleboxes:
          ooniprobe http_invalid_request_line

       Run the http_header_field_manipulation test to detect middleboxes:
          ooniprobe http_header_field_manipulation

       List all the available tests:
          ooniprobe -s

       Start the web user interface:
          ooniprobe -w

AUTHOR
       The Tor Project

COPYRIGHT
       2016, The Tor Project

2.1.0                                                              Dec 07, 2016                                                 OONIPROBE-AGENT(1)
