#!/bin/bash

# Run me with uploadStorageDump.sh [action] [filename]
#PHEDEX_GLITE_ENV=/etc/profile.d/grid-env.sh;
sh /home/phedex/PHEDEX/etc/profile.d/init.sh
export PHEDEX_ROOT=/home/phedex/validation/PHEDEX
export PERL5LIB=$PHEDEX_ROOT/perl_lib:$PERL5LIB
export PATH=$PHEDEX_ROOT/Utilities:$PHEDEX_ROOT/Utilities/testSpace:$PATH


# set environment for test suite
BlockDownloadVerify-injector.pl --db /home/phedex/NCG-Lisbon/Schema/DBParam:Prod/T2PTNCGLISBON --node T2_PT_NCG_Lisbon --block % --test size --force

#exit 0
