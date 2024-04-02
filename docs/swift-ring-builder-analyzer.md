SWIFT-RING-BUILDER-ANALYZER(1)                                                             General Commands Manual                                                             SWIFT-RING-BUILDER-ANALYZER(1)



NAME
       swift-ring-builder-analyzer - put the OpenStack Swift ring builder through its paces

SYNOPSIS
       swift-ring-builder-analyzer [options] scenario_path


DESCRIPTION
       This  is  a  tool  to  help  developers  quantify  changes to the ring builder. It takes a scenario (JSON file) describing the builder's basic parameters (part_power, replicas, etc.) and a number of
       "rounds", where each round is a set of operations to perform on the builder. For each round, the operations are applied, and then the builder is rebalanced until it reaches a steady state.


OPTIONS
       scenario_path
              Path to the scenario file

       -h, --help
              Show this help message and exit

       --check, -c
              Just check the scenario, don't execute it.


DOCUMENTATION
       More in depth documentation in regards to swift-ring-builder-analyzer and also about OpenStack Swift as a whole  can  be  found  at  https://docs.openstack.org/swift/latest/  and  https://docs.open‐
       stack.org



OpenStack Swift                                                                                  August 2016                                                                   SWIFT-RING-BUILDER-ANALYZER(1)
