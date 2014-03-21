#!/bin/bash

size_to_delete=0;
min_max=90;
size=0;

#srmpath=srm://srm01.ncg.ingrid.pt:8444;
srmpath=srm://srm01.ncg.ingrid.pt

PHEDEX_X509_USER_PROXY=/var/lib/vobox/cms/proxy_repository/+2fC+3dPT+2fO+3dLIPCA+2fO+3dLIP+2fOU+3dLisboa+2fCN+3dPietro+20Vischia+2fCN+3dproxy-voms+20cms;

PHEDEX_GLITE_ENV=/etc/profile.d/grid-env.sh;
source $PHEDEX_GLITE_ENV;

unset X509_USER_KEY X509_USER_CERT;
export X509_USER_PROXY=${PHEDEX_X509_USER_PROXY};

MYPROXY_SERVER=myproxy-fts.cern.ch;
export MYPROXY_SERVER;


folder="/lustre/ncg.ingrid.pt/data2/cms/store/PhEDEx_LoadTest07"

for file in `find $folder -name 'LoadTest07*' -type f -mmin +$min_max -print`; do

  [ -n "`echo $file | grep -E -e LoadTest07_Debug_NCG_Lisbon`" ] && continue

    echo "FILE is $file";

    newfile=`echo $file | sed "s:/lustre/ncg.ingrid.pt/data2/:/:"`

    size=`stat -c %s $file 2>/dev/null`

    echo  "$file";
    echo ${srmpath}${newfile}
    echo "Size: $size"
    lcg-del -vvv --vo cms -l ${srmpath}/${newfile}

done

