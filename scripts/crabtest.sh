#!/bin/bash
#echo "directory of the gridpack:"
#echo "/afs/cern.ch/user/c/croote/analysis/ppTOzTOlep+lep-lfv_tarball.tar.xz"
#echo "desired number of events:"
#echo "2"

source /cvmfs/cms.cern.ch/cmsset_default.sh
export SCRAM_ARCH=slc6_amd64_gcc481
if [ -r CMSSW_7_1_20_patch2/src ] ; then 
 echo release CMSSW_7_1_20_patch2 already exists
else
scram p CMSSW CMSSW_7_1_20_patch2
fi
cd CMSSW_7_1_20_patch2/src
eval `scram runtime -sh`

export X509_USER_PROXY=$HOME/.globus/x509up
[ -s Configuration/GenProduction/python/getfragment.py ] || exit $?;

#if [ -e Configuration/GenProduction/python/getfragment.py ]; then
#  echo "File Configuration/GenProduction/python/getfragment.py already exists!"
#  echo "Deleting Configuration/GenProduction/python/getfragment.py..."
#  rm -r Configuration/GenProduction/python/getfragment.py
#fi

curl -s --insecure https://cms-pdmv.cern.ch/mcm/public/restapi/requests/get_fragment/SUS-RunIIWinter15wmLHE-00098 --retry 2 --create-dirs -o Configuration/GenProduction/python/getfragment.py 
[ -s Configuration/GenProduction/python/getfragment.py ] || exit $?;

sed -i -e "s@/cvmfs/cms.cern.ch/phys_generator/gridpacks/slc6_amd64_gcc481/13TeV/madgraph/V5_2.2.2/DYJets_HT_LO_MLM/DYJets_HT-incl/V1/DYJets_HT-incl_tarball.tar.xz@/afs/cern.ch/user/c/croote/analysis/ppTOzTOlep+lep-lfv_tarball.tar.xz@g" Configuration/GenProduction/python/getfragment.py
sed -i -e "s/5000/2/g" Configuration/GenProduction/python/getfragment.py

#echo "import FWCore.ParameterSet.Config as cms" >> Configuration/GenProduction/python/getfragment.py
#echo " " >> Configuration/GenProduction/python/getfragment.py
#echo 'externalLHEProducer = cms.EDProducer("ExternalLHEProducer",' >> Configuration/GenProduction/python/getfragment.py
##echo "    args = cms.vstring('/afs/cern.ch/user/c/croote/analysis/ppTOzTOlep+lep-lfv_tarball.tar.xz')," >> Configuration/GenProduction/python/getfragment.py
#echo "    args = cms.vstring('$NAME1')," >> Configuration/GenProduction/python/getfragment.py
#echo "    #nEvents = cms.untracked.uint32(5000)," >> Configuration/GenProduction/python/getfragment.py
##echo "    nEvents = cms.untracked.uint32($NAME2)," >> Configuration/GenProduction/python/getfragment.py
#echo "    numberOfParameters = cms.uint32(1)," >> Configuration/GenProduction/python/getfragment.py
#echo "    outputFile = cms.string('cmsgrid_final.lhe')," >> Configuration/GenProduction/python/getfragment.py
#echo "    scriptName = cms.FileInPath('GeneratorInterface/LHEInterface/data/run_generic_tarball_cvmfs.sh')" >> Configuration/GenProduction/python/getfragment.py
#echo ")" >> Configuration/GenProduction/python/getfragment.py

scram b
cd ../../
cmsDriver.py Configuration/GenProduction/python/getfragment.py --fileout file:LHE.root --mc --eventcontent LHE --datatier LHE --conditions MCRUN2_71_V1::All --step LHE --python_filename LHE.py --no_exec --customise Configuration/DataProcessing/Utils.addMonitoring -n 2 || exit $? ; 
#echo "DRIVER LHE DONE"
cmsRun -j LHE.xml -p LHE.py || exit $? ; 
#echo "RUN LHE DONE"
#echo 2 events were ran 
#grep "TotalEvents" LHE.xml 
#grep "Timing-tstoragefile-write-totalMegabytes" LHE.xml
#grep "PeakValueRss" LHE.xml 
#grep "AvgEventTime" LHE.xml 
#grep "AvgEventCPU" LHE.xml 
#grep "TotalJobCPU" LHE.xml
