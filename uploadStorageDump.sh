#!/bin/bash

# Run me with uploadStorageDump.sh [action] [filename]

# Action ("check" and then "upload")
ACTION="${1}"

# Filename to check and upload
FILENAME="${2}"

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

if [ "${ACTION}" = "check" ]; then
	spacecount posix --dump ${FILENAME}
	echo "---------------------------------"
	echo "If the only error is \"The \'node\' parameter (undef) to (eval) was an \'undef\'\", then it is OK and you can upload (LoL, by the way)"

elif [ "${ACTION}" = "upload" ]; then
	# upload the storage record
	spacecount posix --dump ${FILENAME} -node T2_PT_NCG_Lisbon
	echo "Now please update the entry at https://twiki.cern.ch/twiki/bin/view/CMSPublic/SpaceMonSiteAdmin#Step_2_Validate_storage_dump"
	echo "Also, please check the status at http://dashb-ssb.cern.ch/dashboard/request.py/siteview#currentView=test&highlight=true"
	echo "(the dashboard might take a few hours to pick up the update)" 
fi

exit 0
