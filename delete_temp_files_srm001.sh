#!/bin/bash

size_to_delete=0;
days=16;
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

for dir in temp/prod temp/user unmerged; do
    folder="/lustre/ncg.ingrid.pt/data2/cms/store/$dir"
    echo "Processing $folder"
    if [ -d $folder ]; then
       find $folder -type f -mtime +$days -print > /tmp/list.tmp
       while read -r line; do
          size=`stat -c %s $line 2>/dev/null`
          srmfile=`echo $line | sed "s:/lustre/ncg.ingrid.pt/data2/:/:"`
          surl="${srmpath}${srmfile}"
          echo "`date +%F,%T`,$line,$size,${surl}"
          lcg-del -vvv --vo cms -l ${surl}
       done < "/tmp/list.tmp"
       rm -f /tmp/list.tmp
    fi
done

