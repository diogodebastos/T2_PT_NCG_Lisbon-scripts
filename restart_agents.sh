#!/bin/bash

# by hand:
# vobox-proxy --vo cms -proxy-safe 3600 --myproxy-safe 259200 --email pietro.vischia@gmail.com register

PHEDEX_X509_USER_PROXY=/var/lib/vobox/cms/proxy_repository/+2fC+3dPT+2fO+3dLIPCA+2fO+3dLIP+2fOU+3dLisboa+2fCN+3dPietro+20Vischia+2fCN+3dproxy-voms+20cms;

PHEDEX_GLITE_ENV=/etc/profile.d/grid-env.sh;


source $PHEDEX_GLITE_ENV;

unset X509_USER_KEY X509_USER_CERT;
export X509_USER_PROXY=${PHEDEX_X509_USER_PROXY};


cd /home/phedex/;

#PHEDEX/Utilities/Master -config SITECONF/T2_PT_NCG_Lisbon/PhEDEx/Config.Deb stop all
PHEDEX/Utilities/Master -config SITECONF/T2_PT_NCG_Lisbon/PhEDEx/Config.Prod stop all
sleep 60;
#PHEDEX/Utilities/Master -config SITECONF/T2_PT_NCG_Lisbon/PhEDEx/Config.Deb start all
PHEDEX/Utilities/Master -config SITECONF/T2_PT_NCG_Lisbon/PhEDEx/Config.Prod start all

