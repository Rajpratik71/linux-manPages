DPL4HYDRA(1)                                                  General Commands Manual                                                 DPL4HYDRA(1)

NAME
       DPL4HYDRA - Generates a (d)efault (p)assword (l)ist as input for THC hydra

DESCRIPTION
       This script allow generate list with the default passwords of of the main vendors of network devices (BRAND) like: 2wire, 360systems, 3com,
       3m, acc, acceleratednetworks, accton, aceex, acer, actiontec, adaptecraid,  adc,  adckentrox,  adcompleteco,  adic,  adp,  adtech,  adtran,
       advanced,  advanteknetworks,  aethra,  airlink,  aironet,  aladdin,  alcatel,  allied, allnet, allot, alteon, ambit, ami, amitech, amptron,
       amptron, andovercontrols, aoc, apache, apc, apple, areca, arescom, arlotto, arrowpoint, asante, ascend, ascom, asmack, asmax, aspect,  ast,
       asus,  at&t,  atcom,  atlantis,  att,  attachmate, audioactive, autodesk, avaya, avengernewssystem, award, axis, aztech, barracudanetworks,
       baynetworks, bea, beetal, belkin, bestpractical, betabrite, billion, bintec, biodata, biostar, bizdesign, blackbox,  bluecoatsystems,  bmc,
       borland, boson, boson, breezecom, broadlogic, brocade, brother, bt, buffalo, cableandwireless, cabletron, canyon, castlenet, cayman, celer‐
       ity, cgi, cgiworld, chase, chaseresearch, checkpoint, chumingchen, ciphertrust, cisco, cnet, cobalt,  colubrisnetworks,  comersus,  compaq,
       compex,  compualynx,  computer,  comtrend,  conceptronic,  concord, conexant, conitec, corecess, coyotepoint, crystalview, ctx, cyberguard,
       cybermax, cyclades, d-link, daewoo, dallas, dallassemiconductors, darkman, data, datacom, datageneral, datawizard, davox,  daytek,  debian,
       decnet,  deerfield,  dell, demarc, deutschetelekom, develcon, dictaphone, digicom, digicorp, digicraftsoftware, digiinternational, digital,
       digitalequipment, discar, dlink, draytek, drupal.org, dupont, dynalink, dynix,  econ,  edimax,  efficientnetworks,  elron,  elsa,  eminent,
       encad, enhydra, enox, enterasys, entrust, epox, ericsson, etech, everfocus, exindanetworks, extendedsystems, extremenetworks, f5, firebird,
       flowpoint, fortinet, foundry, foundrynetworks, freetech, fujixerox, funk, funksoftware, galacticomm, gandalf, gateway, ge, geeklog,  gener‐
       alinstruments,  gericom, giga, gigabyte, globespanvirata, gossamerthreads, grandstreamnetworks, greatspeed, guardone, h2o, h2oproject, har‐
       ris, hayes, hewlett-packard, honeywell, horizondatasys, hosting, hp, huawei, ibm, imperiasoftware, informix, infosmart,  infotec,  infrant,
       innovaphone,  integratednetworks,  intel,  interbase,  intermec, intershop, intex, intuit, ipstar, ipswitch, irc, ironport, iso, iwill, jd,
       jdedwards, jds, jetform, jetway, johnsoncontrols, josstechnology, juniper, justin, justinhagstrom,  kalatel,  kaptest,  kethinov,  keyscan,
       konicaminolta, kti, kyocera, lacie, lanier, lantronics, leading, lenel, level1, lg, lgic, linksys, linux, livingstone, logitech, longshine,
       lucent, machspeed, macromedia, magic-pro, main, mambo, mantis, marconi, mcafee,  mediatrix,  megastar,  memotec,  mentec,  mercury,  metro,
       michiel,  microcom,  micron,  micronet,  micronics,  microplex,  microrouter,  microsoft, mikepeters, mikrotik, minoltaqms, pantoel, mitel,
       mobotix, motorola, mp3mystic, mro, mrv, multitech, mutaresoftware, muze, mysql, nai, nanoteq, ncr, netapp,  netcomm,  netgear,  netgenesis,
       netopia,  netport, netscape, netscreen, network, networkassociates, networkice, nexland, next, ngsec, ngsecure, nicesystemsltd, nimble, no,
       nokia, norstar, nortel, novell, nrg, nullsoft, nurit, oce, ods, oki, olicom, olitec, omnitronix, oodiecom, openconnect,  openmarket,  open‐
       wave,  openxchange, optivision, optus, oracle, osicom, ovislink, pacific, packardbell, panasonic, pandatel, patton, penril, pentagram, pen‐
       taoffice, pentasafe, philips, phoenix, phpreactor, phptest, pirelli, planet, pollsafe, polycom, postgresql, prestige, prestigio, primebase,
       prolite,  promise, prostar, proxim, pyramidcomputer, qdi, quake, qualiteam, quantex, quantum, radio, radioshack, radware, rainbow, rampnet‐
       works, rapidstream, raritan, raytalk, redhat, redline, remedy, research, resumix, ricoh, rizen, rm, roamabout, rodopi, safecom, sagem, sam‐
       bartechnologies,  samsung,  samuelabels,  sap,  sap,  schneider,  schneiderelectric,  scientificatlanta,  seagullscientific, securicor3net,
       securstar, semaphore, servertechnology, sgi, sharp, shiva, shoretel, shuttle

       This script depends on a local (d)efault (p)assword (l)ist called ~/.dpl4hydra/dpl4hydra_full.csv. If it is not  available,  regenerate  it
       with dpl4hydra refresh. Source of the default password list is http://open-sez.me/passwd.htm

Options
       help   Show help information

       refresh
              Refresh list: Download the full (d)efault (p)assword (l)ist

       BRAND  Generates  a  (d)efault (p)assword (l)ist from the local file ~/.dpl4hydra/dpl4hydra_full.csv, limiting the output to BRAND systems,
              using the format username:password (as required by THC hydra).

              Dump list of brand selected in ~/.dpl4hydra/dpl4hydra_BRAND.lst

       all    Dump list of all systems credentials into ~/.dpl4hydra/dpl4hydra_all.lst

EXAMPLES

       dpl4hydra linksys
       Output:
       File dpl4hydra_linksys.lst was created with 20 entries
       For use in hydra:
       hydra -C ~/.dpl4hydra/dpl4hydra_linksys.lst -t 1 192.168.1.1 http-get /index.asp

SEE ALSO
       hydra(1),

AUTHOR
       dpl4hydra was written by Roland Kessler.

       This manual page was written by Daniel Echeverry <epsilon77@gmail.com>, for the Debian project (and may be used by others).

                                                                    19/01/2014                                                        DPL4HYDRA(1)
