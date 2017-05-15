echo "================= PSet.py file 1 =================="
cat PSet.py

#echo "================= PSet.pkl file =================="
#cat PSet.pkl

echo "================= ls command ================="
ls

echo "================= pwd command ================="
pwd

echo "================= ENV COMMAND ================="
env 

#echo "================= SED REPLACE ================="
#sed -i -e "s~#GRIDPACK#~${CMSSW_RELEASE_BASE}/src/CMSAachen3B/GeneratorTools/data/ppTOzTOlep+lep-lfv_tarball.tar.xz~g" ./LHE.py
#sed -i -e "s~#GRIDPACK#~${CMSSW_RELEASE_BASE}/src/CMSAachen3B/GeneratorTools/data/ppTOzTOlep+lep-lfv_tarball.tar.xz~g" ./PSet.py
#sed -e "s~#GRIDPACKLOCATION#~${GRIDPACKWORKDIR}/gridpack.tgz~g"

#echo "================= PSet.py file 2 =================="
#cat PSet.py
#echo "---------------------------------------------------"
#cat LHE.py

echo "================= CMSRUN starting ===================="
cmsRun -j FrameworkJobReport.xml -p PSet.py

#echo "================= PSet.py file 3 =================="
#cat PSet.py

echo "================= STEP -AOD to MiniAOD finished ===================="



if [ -r CMSSW_7_1_20_patch3/src ] ; then 
 echo release CMSSW_7_1_20_patch3 already exists
else
scram p CMSSW CMSSW_7_1_20_patch3
fi
cd CMSSW_7_1_20_patch3/src
eval `scram runtime -sh`

curl -s --insecure https://cms-pdmv.cern.ch/mcm/public/restapi/requests/get_fragment/SUS-RunIISummer15GS-00148 --retry 2 --create-dirs -o Configuration/GenProduction/python/getfragment.py 
[ -s Configuration/GenProduction/python/getfragment.py ] || exit $?;

scram b
cd ../../
cmsDriver.py Configuration/GenProduction/python/getfragment.py --filein file:LHE.root --fileout file:GENSIM.root --mc --eventcontent RAWSIM --customise SLHCUpgradeSimulations/Configuration/postLS1Customs.customisePostLS1,Configuration/DataProcessing/Utils.addMonitoring --datatier GEN-SIM --conditions MCRUN2_71_V1::All --beamspot Realistic50ns13TeVCollision --step GEN,SIM --magField 38T_PostLS1 --python_filename GENSIM.py --no_exec -n 1000 || exit $? ; 
echo "DRIVER GENSIM DONE"
cmsRun -e -j GENSIM.xml GENSIM.py || exit $? ; 
echo "RUN GENSIM DONE"


echo "================= CMSRUN finished ===================="

if [ -r CMSSW_8_0_21/src ] ; then 
 echo release CMSSW_8_0_21 already exists
else
scram p CMSSW CMSSW_8_0_21
fi
cd CMSSW_8_0_21/src
eval `scram runtime -sh`

scram b
cd ../../
cmsDriver.py step1 --filein file:GENSIM.root --fileout file:Premixstep1.root  --pileup_input "dbs:/Neutrino_E-10_gun/RunIISpring15PrePremix-PUMoriond17_80X_mcRun2_asymptotic_2016_TrancheIV_v2-v2/GEN-SIM-DIGI-RAW" --mc --eventcontent PREMIXRAW --datatier GEN-SIM-RAW --conditions 80X_mcRun2_asymptotic_2016_TrancheIV_v6 --step DIGIPREMIX_S2,DATAMIX,L1,DIGI2RAW,HLT:@frozen2016 --nThreads 4 --datamix PreMix --era Run2_2016 --python_filename Premix_1.py --no_exec --customise Configuration/DataProcessing/Utils.addMonitoring -n 1000 || exit $? ; 
#echo "DRIVER GENSIM DONE"
cmsRun -e -j Premix_1.xml Premix_1.py || exit $? ; 
#echo "RUN GENSIM DONE"
cmsDriver.py step2 --filein file:Premixstep1.root --fileout file:Premix.root --mc --eventcontent AODSIM --runUnscheduled --datatier AODSIM --conditions 80X_mcRun2_asymptotic_2016_TrancheIV_v6 --step RAW2DIGI,RECO,EI --nThreads 4 --era Run2_2016 --python_filename Premix_2.py --no_exec --customise Configuration/DataProcessing/Utils.addMonitoring -n 1000 || exit $? ; 
cmsRun -e -j Premix_2.xml Premix_2.py || exit $? ; 

