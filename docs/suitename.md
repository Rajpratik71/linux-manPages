SUITENAME(1)                                                       User Commands                                                      SUITENAME(1)

NAME
       suitename - categorize each suite in an RNA backbone as belonging to either one of 53 defined types or as outlier

SYNOPSIS
       suitename -flags <stdin >stdout

DESCRIPTION
       Suitename is a program that supports the ROC RNA Ontology Consortium consensus RNA backbone nomenclature and conformer-list development.

       From dihedral-angle input for a specific RNA structure (usually from Dangle), Suitename categorizes the RNA backbone geometry of each suite
       (the sugar-to-sugar version of a residue) either as an outlier ("!!") or as belonging to one of the 53 defined conformer bins.  The  output
       is  either  a  one-line-per-suite  report,  or a linear conformer string (as shown below the image here) in one of several variant formats.
       Suitename is built into MolProbity, producing entries in the multi-criterion chart for an RNA model and also a suitestring file.

OPTIONS
              output flags: [ -report || -string || -kinemage ]

              default:  -report -residuein

              input flags: [ -residuein || -suitein  ]

              flags: [ -residuein [ -pointIDfields # ] ] default#==6

              OR flags: [ -suitein [ -anglefields # ] ] default#==9

              defaults: -residuein  -pointIDfields 6 as made by dangle

              dangle "alpha, beta, gamma, delta, epsilon, zeta" in.pdb >out.dngl

              label : model : chain : number : ins : type : alpha : beta : gamma : delta : epsilon : zeta

              -suitein presumes point records from a kinemage {pointID} 7 or 9 anglefields {ptID} [chi] deltam epsilon zeta alpha beta gamma delta
              [chi]

       Note that all other kinemage lines must be stripped off.

              -thetaeta  kinemage labels theta,eta instead of chi-1,chi

       Note dangle trick to make theta,...,eta suites directly

              flag: -report [ -chart ] suites in order of input, suiteness summary at end

              ( -chart : NO summary at end, for MolProbity multichart)

              flag: -string 3 character per suite string in order of input

              20 per line, ptID of n*20th at end of line

              flag: -nosequence only suite names, no Base sequence character

              flag: -oneline string all one line, no point IDs

              flag: -overlap 20 per line: overlap 10 each line, 10 new per line

              flag: -kinemage kinemage of clusters grouped by pucker,pucker ...

              group {delta,delta},subgroup {gamma},list {cluster name} assigns to designated wannabe clusters, default: wannabe

              flag: -nowannabe   to not assign them

              [ -power #.#] default# 3.00 multi-dimension distance calc

              [ -test ] dump cluster centers, halfwidths,... to stderr

       cluster averages version: 070506

       cluster half-widths version: 070328

       axes limits version: 070326

       suitename is not paying attention to chains...

suitename 0.3.070628                                                 July 2015                                                        SUITENAME(1)
