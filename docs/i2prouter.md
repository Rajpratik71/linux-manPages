I2PROUTER(1)                                                            I2P                                                           I2PROUTER(1)

NAME
       i2prouter - start and stop the I2P router

SYNOPSIS
       i2prouter {console|start|stop|graceful|restart|condrestart|status|dump|install|remove}

DESCRIPTION
       Control the I2P service.

       console
              Runs I2P as a console application under the current user.

       start  Starts the I2P service.

       stop   Stops the I2P service.

       restart
              Stops the I2P service and then starts it.

       condrestart
              Restart the I2P service only if it is already running.

       graceful
              Stop I2P gracefully (may take up to 11 minutes)

       install
              Install initscript to start I2P automatically when the system boots.

       remove Uninstall initscript that was installed with install

       status Prints whether the I2P service is running.

       dump   Dumps the current threads into wrapper.log.

REPORTING BUGS
       Please enter a ticket on the I2P trac page ⟨https://trac.i2p2.de/⟩.

SEE ALSO
       i2prouter-nowrapper(1)

                                                                 January 26, 2017                                                     I2PROUTER(1)
