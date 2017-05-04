#!/bin/bash
# this script can produce a miniAOD from a madgraph gridpack
# call it in this format:
# ./gridpackgen (gridpackdirectory/gridpackname.tar.xz) (number of events)
# without the brackets
# sorry about how messy it is
# pileup section of AODSIM is yet to be fixed
# currently outputs will be simply named LHE.root, miniAOD.root etc. 

echo "directory of the gridpack:"
echo $1
echo "desired number of events:"
echo $2

source /cvmfs/cms.cern.ch/cmsset_default.sh
export SCRAM_ARCH=slc6_amd64_gcc481
if [ -r CMSSW_7_1_20_patch2/src ] ; then 
 echo release CMSSW_7_1_20_patch2 already exists
else
scram p CMSSW CMSSW_7_1_20_patch2
fi
cd CMSSW_7_1_20_patch2/src
eval `scram runtime -sh`

#export X509_USER_PROXY=$HOME/.globus/x509up
#[ -s Configuration/GenProduction/python/getfragment.py ] || exit $?;

#if [ -e Configuration/GenProduction/python/getfragment.py ]; then
#  echo "File Configuration/GenProduction/python/getfragment.py already exists!"
#  echo "Deleting Configuration/GenProduction/python/getfragment.py..."
#  rm -r Configuration/GenProduction/python/getfragment.py
#fi

curl -s --insecure https://cms-pdmv.cern.ch/mcm/public/restapi/requests/get_fragment/SUS-RunIIWinter15wmLHE-00098 --retry 2 --create-dirs -o Configuration/GenProduction/python/getfragment.py 
[ -s Configuration/GenProduction/python/getfragment.py ] || exit $?;

sed -i -e "s@/cvmfs/cms.cern.ch/phys_generator/gridpacks/slc6_amd64_gcc481/13TeV/madgraph/V5_2.2.2/DYJets_HT_LO_MLM/DYJets_HT-incl/V1/DYJets_HT-incl_tarball.tar.xz@$1@g" Configuration/GenProduction/python/getfragment.py
sed -i -e "s/5000/$2/g" Configuration/GenProduction/python/getfragment.py

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
cmsDriver.py Configuration/GenProduction/python/getfragment.py --fileout file:LHE.root --mc --eventcontent LHE --datatier LHE --conditions MCRUN2_71_V1::All --step LHE --python_filename LHE.py --no_exec --customise Configuration/DataProcessing/Utils.addMonitoring -n $2 || exit $? ; 
echo "DRIVER LHE DONE"
cmsRun -e -j LHE.xml LHE.py || exit $? ; 
echo "RUN LHE DONE"
echo $2 events were ran 
grep "TotalEvents" LHE.xml 
grep "Timing-tstoragefile-write-totalMegabytes" LHE.xml
grep "PeakValueRss" LHE.xml 
grep "AvgEventTime" LHE.xml 
grep "AvgEventCPU" LHE.xml 
grep "TotalJobCPU" LHE.xml

#------------------------------------------------------------------------------------------------------------------------------------------------------------------

echo "GENSIM PRODUCTION BEGINING"

if [ -r CMSSW_7_1_20_patch3/src ] ; then 
 echo release CMSSW_7_1_20_patch3 already exists
else
scram p CMSSW CMSSW_7_1_20_patch3
fi
cd CMSSW_7_1_20_patch3/src
eval `scram runtime -sh`

#export X509_USER_PROXY=$HOME/.globus/x509up

curl -s --insecure https://cms-pdmv.cern.ch/mcm/public/restapi/requests/get_fragment/SUS-RunIISummer15GS-00148 --retry 2 --create-dirs -o Configuration/GenProduction/python/getfragment.py 
[ -s Configuration/GenProduction/python/getfragment.py ] || exit $?;

scram b
cd ../../
cmsDriver.py Configuration/GenProduction/python/getfragment.py --filein file:LHE.root --fileout file:GENSIM.root --mc --eventcontent RAWSIM --customise SLHCUpgradeSimulations/Configuration/postLS1Customs.customisePostLS1,Configuration/DataProcessing/Utils.addMonitoring --datatier GEN-SIM --conditions MCRUN2_71_V1::All --beamspot Realistic50ns13TeVCollision --step GEN,SIM --magField 38T_PostLS1 --python_filename GENSIM.py --no_exec -n $2 || exit $? ; 
echo "DRIVER GENSIM DONE"
cmsRun -e -j GENSIM.xml GENSIM.py || exit $? ; 
echo "RUN GENSIM DONE"
echo $2 events were ran 
grep "TotalEvents" GENSIM.xml 
grep "Timing-tstoragefile-write-totalMegabytes" GENSIM.xml 
grep "PeakValueRss" GENSIM.xml 
grep "AvgEventTime" GENSIM.xml 
grep "AvgEventCPU" GENSIM.xml 
grep "TotalJobCPU" GENSIM.xml 

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------

echo "AODSIM PRODUCTION BEGINING"

if [ -r CMSSW_8_0_21/src ] ; then 
 echo release CMSSW_8_0_21 already exists
else
scram p CMSSW CMSSW_8_0_21
fi
cd CMSSW_8_0_21/src
eval `scram runtime -sh`

export X509_USER_PROXY=$HOME/.globus/x509up

scram b
cd ../../

#xrdcp root://cms-xrd-global.cern.ch//store/mc/RunIISpring15PrePremix/Neutrino_E-10_gun/GEN-SIM-DIGI-RAW/PUMoriond17_80X_mcRun2_asymptotic_2016_TrancheIV_v2-v2/100000/001EB167-3781-E611-BE3C-0CC47A4D75F4.root ./

#cmsDriver.py step1 --filein file:GENSIM.root --fileout file:Premixstep1.root  --pileup_input file:001EB167-3781-E611-BE3C-0CC47A4D75F4.root --mc --eventcontent PREMIXRAW --datatier GEN-SIM-RAW --conditions 80X_mcRun2_asymptotic_2016_TrancheIV_v6 --step DIGIPREMIX_S2,DATAMIX,L1,DIGI2RAW,HLT:@frozen2016 --nThreads 4 --datamix PreMix --era Run2_2016 --python_filename Premix_1.py --no_exec --customise Configuration/DataProcessing/Utils.addMonitoring -n $2 || exit $? ; 

echo "DRIVER PREMIX 1 DONE"

cmsDriver.py step1 --filein "dbs:/DYJetsToLL_M-50_TuneCUETP8M1_13TeV-madgraphMLM-pythia8/RunIISummer15GS-MCRUN2_71_V1_ext1-v1/GEN-SIM" --fileout file:Premixstep1.root  --pileup_input "dbs:/Neutrino_E-10_gun/RunIISpring15PrePremix-PUMoriond17_80X_mcRun2_asymptotic_2016_TrancheIV_v2-v2/GEN-SIM-DIGI-RAW" --mc --eventcontent PREMIXRAW --datatier GEN-SIM-RAW --conditions 80X_mcRun2_asymptotic_2016_TrancheIV_v6 --step DIGIPREMIX_S2,DATAMIX,L1,DIGI2RAW,HLT:@frozen2016 --nThreads 4 --datamix PreMix --era Run2_2016 --python_filename Premix_1.py --no_exec --customise Configuration/DataProcessing/Utils.addMonitoring -n $2 || exit $? ; 

cmsRun -e -j Premix_1.xml Premix_1.py || exit $? ; 
echo "RUN PREMIX 1 DONE"
echo $2 events were ran 
grep "TotalEvents" Premix_1.xml
grep "Timing-tstoragefile-write-totalMegabytes" Premix_1.xml 
grep "PeakValueRss" Premix_1.xml 
grep "AvgEventTime" Premix_1.xml 
grep "AvgEventCPU" Premix_1.xml 
grep "TotalJobCPU" Premix_1.xml 

cmsDriver.py step2 --filein file:Premixstep1.root --fileout file:Premix.root --mc --eventcontent AODSIM --runUnscheduled --datatier AODSIM --conditions 80X_mcRun2_asymptotic_2016_TrancheIV_v6 --step RAW2DIGI,RECO,EI --nThreads 4 --era Run2_2016 --python_filename Premix_2.py --no_exec --customise Configuration/DataProcessing/Utils.addMonitoring -n $2 || exit $? ; 
echo "DRIVER PREMIX 2 DONE"
cmsRun -e -j Premix_2.xml Premix_2.py || exit $? ; 
echo "RUN PREMIX 2 DONE"
echo $2 events were ran 
grep "TotalEvents" Premix_2.xml 
grep "Timing-tstoragefile-write-totalMegabytes" Premix_2.xml
grep "PeakValueRss" Premix_2.xml 
grep "AvgEventTime" Premix_2.xml 
grep "AvgEventCPU" Premix_2.xml 
grep "TotalJobCPU" Premix_2.xml 

#---------------------------------------------------------------------------------------------------------------------------------------------------------------

cmsDriver.py step1 --filein file:Premix.root --fileout file:MiniAOD.root --mc --eventcontent MINIAODSIM --runUnscheduled --datatier MINIAODSIM --conditions 80X_mcRun2_asymptotic_2016_TrancheIV_v6 --step PAT --nThreads 4 --era Run2_2016 --python_filename MiniAOD.py --no_exec --customise Configuration/DataProcessing/Utils.addMonitoring -n $2 || exit $? ; 
echo "DRIVER MINIAOD DONE"
cmsRun -e -j MiniAOD.xml MiniAOD.py || exit $? ; 
echo "RUN MINIAOD DONE"
echo $2 events were ran 
grep "TotalEvents" MiniAOD.xml 
grep "Timing-tstoragefile-write-totalMegabytes" MiniAOD.xml 
grep "PeakValueRss" MiniAOD.xml 
grep "AvgEventTime" MiniAOD.xml
grep "AvgEventCPU" MiniAOD.xml 
grep "TotalJobCPU" MiniAOD.xml 
