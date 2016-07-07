export sw=/home/phedex/sw/
myarch=slc6_amd64_gcc481
repo=comp.pre
wget -O $sw/bootstrap.sh http://cmsrep.cern.ch/cmssw/$repo/bootstrap.sh
sh -x $sw/bootstrap.sh setup -path $sw -arch $myarch -repository $repo 2>&1|tee $sw/bootstrap_$myarch.log
echo "-------------------------------------------------------------------------------------------------------------"
echo "Then remember to edit your PhEDEx configuration files increasing the value of the PHEDEX_OS_VERSION env variable to PHEDEX_OS_VERSION=slc6_amd64_gcc481;"


