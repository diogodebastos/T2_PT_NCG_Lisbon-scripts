#!/bin/bash

# install test suite
# cd /home/phedex/validation/; git clone https://github.com/dmwm/PHEDEX.git cd ../

# set environment for test suite
sh /home/phedex/PHEDEX/etc/profile.d/init.sh
export PHEDEX_ROOT=/home/phedex/validation/PHEDEX
export PERL5LIB=$PHEDEX_ROOT/perl_lib:$PERL5LIB
export PATH=$PHEDEX_ROOT/Utilities:$PHEDEX_ROOT/Utilities/testSpace:$PATH

# valid proxy with the specified compatibility options required for access to the central DMWMMON database:
grid-proxy-init -rfc -bits 1024

# run validation

# detailed use: spacecount --help

# dump-file parsing and aggregation:
#spacecount <interface> --dump <dump file>
spacecount posix --dump /home/cms/cmssgm/DumpFile.2015-04-22.txt

# upload the storage record
spacecount posix --dump /home/cms/cmssgm/DumpFile.2015-04-22.txt --node T2_PT_NCG_Lisbon

# update entry at in https://twiki.cern.ch/twiki/bin/view/CMSPublic/SpaceMonSiteAdmin#Step_2_Validate_storage_dump

