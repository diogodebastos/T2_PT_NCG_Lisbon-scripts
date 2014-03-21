#!/bin/bash

source /home/phedex/PHEDEX/etc/profile.d/env.sh;

#DATASET=/Njet_4j_160_200-alpgen/CMSSW_1_6_7-CSA07-1201630335/RECO;
DATASET=/JetET110/CSA08_CSA08_S156_v1/GEN-SIM-RECO;

DB=/home/phedex/LIP-Lisbon/Schema/DBParam:Prod/LIPLISBON;
TFC=/home/phedex/scripts/storage.xml;


perl -MPHEDEX::Debug /home/phedex/PHEDEX/Utilities/BlockConsistencyCheck -db $DB -buffer T2_PT_LIP_Lisbon -tfc $TFC -dataset $DATASET --tfcprotocol srm ;

