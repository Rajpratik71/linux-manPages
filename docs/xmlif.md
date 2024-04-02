XMLIF(1)                                                                                            xmlif                                                                                            XMLIF(1)



NAME
       xmlif - conditional processing instructions for XML

SYNOPSIS
       xmlif [attrib=value...]

DESCRIPTION
       xmlif filters XML according to conditionalizing markup. This can be useful for formatting one of several versions of an XML document depending on conditions passed to the command.

       Attribute/value pairs from the command line are matched against the attributes associated with certain processing instructions in the document. The instructions are <?xmlif if?> and its inverse
       <?xmlif if not?>, <?xmlif elif?> and its inverse <?xmlif elif not?>, <?xmlif else?>, and <?xmlif fi?>.

       Argument/value pairs given on the command line are checked against the value of corresponding attributes in the conditional processing instructions. An `attribute match' happens if an attribute
       occurs in both the command-line arguments and the tag, and the values match. An `attribute mismatch' happens if an attribute occurs in both the command-line arguments and the tag, but the values do
       not match.

       Spans between <?xmlif if?> or <?xmlif elif?> and the next conditional processing instruction at the same nesting level are passed through unaltered if there is at least one attribute match and no
       attribute mismatch; spans between <?xmlif if not?> and <?xmlif elif not?> and the next conditional processing instruction are passed otherwise. Spans between <?xmlif else?> and the next
       conditional-processing tag are passed through only if no previous span at the same level has been passed through.  <?xmlif if?> and <?xmlif fi?> (and their `not' variants) change the current nesting
       level; <?xmlif else?> and <?xmlif elif?> do not.

       All these processing instructions will be removed from the output produced. Aside from the conditionalization, all other input is passed through untouched; in particular, entity references are not
       resolved.

       Value matching is by string equality, except that "|" in an attribute value is interpreted as an alternation character. Thus, saying foo='red|blue' on the command line enables conditions red and
       blue. Saying color='black|white' in a tag matches command-line conditions color='black' and color='white'.

       Here is an example:

           Always issue this text.
           <?xmlif if condition='html'?>
           Issue this text if 'condition=html' is given on the command line.
           <?xmlif elif condition='pdf|ps'?>
           Issue this text if 'condition=pdf' or 'condition=ps'
           is given on the command line.
           <?xmlif else?>
           Otherwise issue this text.
           <?xmlif fi?>
           Always issue this text.

AUTHOR
       Eric S. Raymond <esr@snark.thyrsus.com>
           Author of xmlif program



Linux                                                                                             April 2009                                                                                         XMLIF(1)
