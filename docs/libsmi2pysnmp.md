libsmi2pysnmp(1)                                                      PYSNMP                                                      libsmi2pysnmp(1)

NAME
       libsmi2pysnmp - libsmi-to-pysnmp MIB converter

SYNTAX
       libsmi2pysnmp

DESCRIPTION
       libsmi2pysnmp  is  used  to convert MIB definitions to a form usable by PySNMP. To convert a single MIB use it like this: smidump -f python
       <mib-text-file.txt> | libsmi2pysnmp > <mib-text-file.py>

AUTHORS
       Ilya Etingof <ilya@glas.net>

SEE ALSO
       http://pysnmp.sourceforge.net

Jan Luebbe                                                          0.0.5-alpha                                                   libsmi2pysnmp(1)
