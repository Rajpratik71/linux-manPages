
opagetvf_env(1)                                                                             IFSFFCLIRG (Man Page)                                                                             opagetvf_env(1)



NAME
       opagetvf_env



       Provides opagetvf_func and opagetvf2_func shell functions that query the parameters of a vFabric. Also exports values that indicate the PKEY, SL, MTU, and RATE associated with the vFabric. The typi‐
       cal usage of this tool is to include it in a shell script as:. /usr/sbin/opagetvf_env

       A usage example is provided in:
       /usr/src/opa/mpi_apps/openmpi.params

       NOTE: opagetvf_func and opagetvf2_func have a similar usage. The difference is whether the MTU and RATE are returned as absolute values or enum values, respectively.


Function Syntax
       opagetvf_func "arguments to opagetvf" pkey_env_var_name sl_env_var_name
       [ mtu_env_var_name[ rate_env_var_name]]

       or

       opagetvf2_func "arguments to opagetvf" pkey_env_var_name
       sl_env_var_name[ mtu_env_var_name[ rate_env_var_name]]




Function Options
       "arguments to opagetvf"
                 Specifies a set of arguments to pass to opagetvf to select a virtual fabric.See opagetvf for more information.


       pkey_env_var_name
                 Specifies the environment variable to fill in with pkey for the selected virtual fabric. The variable given will be exported with the hex numeric value for the pkey.If a variable  name  of
                 "" is provided, pkey is not saved.


       sl_env_var_name
                 Specifies  the  environment variable to fill in with service level (sl) for the selected virtual fabric. The variable given will be exported with the numeric value for the sl.If a variable
                 name of "" is provided, sl is not saved.


       mtu_env_var_name
                 Specifies the environment variable to fill in with maximum MTU for the selected virtual fabric. The variable given will be exported with the value for the MTU.If a variable name of  ""  is
                 provided, MTU is not saved.


                 For opagetvf_func, MTU is returned as an absolute value of 2048, 4096, 8192, or 10240.

                 For opagetvf2_func, MTU is returned as an enumerated value of 4, 5, 6, or 7 corresponding to the absolute values above, respectively.

                 If the selected virtual fabric does not have a limitation specified for MTU, the variable will be unaltered.

       rate_env_var_name
                 Specifies  the  environment variable to fill in with maximum static rate for the selected virtual fabric. The variable given will be exported with the value for the rate.If a variable name
                 of "" is provided, rate is not saved.


                 For opagetvf_func, rate is returned as an absolute value of 25g, 50g, 75g or 100g.

                 For opagetvf2_func, rate is returned as an enumerated value of 15, 12, 9, or 16 corresponding to the absolute values above, respectively.

                 If the selected virtual fabric does not have a limitation specified for rate, the variable will be unaltered.


Function Example
       # ensure values are empty in case they are not specified for the
       virtual fabric
       MTU=
       RATE=
       opagetvf_func "-d 'Compute'" PKEY SERVICE_LEVEL MTU RATE
       echo "The Compute Virtual Fabric has pkey: $PKEY SL:$SERVICE_LEVEL MTU:
       $MTU rate:$RATE"



       NOTE: Additional examples may be found in /usr/src/opa/mpi_apps/openmpi.params and /usr/src/opa/mpi_apps/mvapich2.params. Those scripts use opagetvf_func and opagetvf2_func  to  get  virtual  fabric
       parameters and then pass them into openmpi and mvapich2, respectively.



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                               opagetvf_env(1)
