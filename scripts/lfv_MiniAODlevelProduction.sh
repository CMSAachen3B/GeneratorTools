#!/bin/bash

# Define number of events
export NUMBEREVENTS=100000

export STARTDIR=`pwd`

# Define workdir
export WORKDIR=$CMSSW_BASE/../

# Define gridpack location, warning if you are using crab, requires global accessible gridpack
# If running locally you can also set a local gridpack location
#export GRIDPACKLOC='https://github.com/CMSAachen3B/GeneratorTools/raw/master/data/ppTOzTOlep%2Blep-lfv_tarball.tar.xz'
export GENSIMLOC=/LFV_ZToL1L2_13TeV_madgraph_pythia8/croote-CRAB3_tutorial_May2015_MC_analysis_3_winputfiles-2480552d3a4cb91ebeaa106488712ec9/USER
#wget https://github.com/CMSAachen3B/GeneratorTools/raw/master/data/ppTOzTOlep%2Blep-lfv_tarball.tar.xz
#mv ppTOzTOlep+lep-lfv_tarball.tar.xz gridpack.tgz
 #export GRIDPACKLOC=/afs/cern.ch/work/m/mharrend/public/ttHtranche3/TTTo2L2Nu_hvq_ttHtranche3.tgz

# Use crab for grid submitting, adjust crabconfig.py accordingly beforehand
export USECRAB="True"
#export USECRAB="False"

######### Do not change anything behind this line ###############


echo "Start dir was:"
echo $STARTDIR

echo "Workdir set is:" 
echo $WORKDIR
mkdir -p $WORKDIR
echo "Created workdir"
cd $WORKDIR
echo "Changed into workdir"

echo "Install CMSSW in workdir"
source /cvmfs/cms.cern.ch/cmsset_default.sh
export SCRAM_ARCH=slc6_amd64_gcc530
if [ -r CMSSW_8_0_21/src ] ; then 
 echo release CMSSW_8_0_21 already exists
else
scram p CMSSW CMSSW_8_0_21
fi
cd CMSSW_8_0_21/src
eval `scram runtime -sh`
echo "Loaded CMSSW_8_0_21"

export X509_USER_PROXY=$HOME/.globus/x509up

cp $STARTDIR/lfv_MiniAODsubmissionScript.sh $WORKDIR/

echo "Copy run script to workdir"
mkdir -p GeneratorInterface/LHEInterface/data/
cp $STARTDIR/run_generic_tarball_cvmfs.sh GeneratorInterface/LHEInterface/data/run_generic_tarball_cvmfs.sh
cp $STARTDIR/pileup_files2.txt ./pileup_files2.txt
#cp $STARTDIR/../python/lfv/lfv_MiniAOD_PSet_step2.py ./
#cp $STARTDIR/../python/lfv/lfv_MiniAOD_PSet_step3.py ./

echo "Change number of events in python config to"
echo $NUMBEREVENTS
sed -e "s/#NUMBEREVENTS#/${NUMBEREVENTS}/g" $STARTDIR/../python/lfv/lfv_MiniAOD_PSet_step1.py > ./lfv_MiniAOD_PSet_step1_events.py
sed -e "s/#NUMBEREVENTS#/${NUMBEREVENTS}/g" $STARTDIR/../python/lfv/lfv_MiniAOD_PSet_step2.py > ./lfv_MiniAOD_PSet_step2.py
sed -e "s/#NUMBEREVENTS#/${NUMBEREVENTS}/g" $STARTDIR/../python/lfv/lfv_MiniAOD_PSet_step3.py > ./lfv_MiniAOD_PSet_step3.py
sed -e "s/#NUMBEREVENTS#/${NUMBEREVENTS}/g" $STARTDIR/../python/lfv/lfv_MiniAOD_PSet_Dummy.py > ./pythonAOD_cfg_eventsInserted.py
sed -e "s/#NUMBEREVENTS#/${NUMBEREVENTS}/g" $STARTDIR/lfv_MiniAODsubmissionScript2.sh > ./AODscript_eventsInserted.sh
#sed -e "s/#NUMBEREVENTS#/${NUMBEREVENTS}/g" $STARTDIR/../python/lfv/lfv_MiniAOD_PSet_step1.py > ./pythonAOD_cfg_eventsInserted.py
#sed -e "s/#NUMBEREVENTS#/${NUMBEREVENTS}/g" $STARTDIR/lfv_MiniAODsubmissionScript.sh > ./AODscript_eventsInserted.sh
#sed -e "s/#STARTDIR#/${STARTDIR}/g" $STARTDIR/AOD.py > ./pythonAOD_cfg_eventsInserted.py
#sed -e "s/#NUMBEREVENTS#/${NUMBEREVENTS}/g" $STARTDIR/kappaWorkflow_privateMiniAOD_GEN.sh

if [ $USECRAB = "True" ]; then
	echo "Will use crab submission, adjust crabconfig.py accordingly if problems arise"

        echo "Copy gridpack for production to workdir, so that crab can transfer it also"
        #cp $GENSIMLOC GENSIM.root
	#echo "Add gridpack location to python config and copy cmssw python config to workdir"
	sed -e "s~#GENSIMLOCATION#~${GENSIMLOC}~g" ./pythonAOD_cfg_eventsInserted.py > ./pythonAOD_cfg.py
	sed -e "s~#GENSIMLOCATION#~${GENSIMLOC}/~g" ./lfv_MiniAOD_PSet_step1_events.py > ./lfv_MiniAOD_PSet_step1.py

	echo "Scram b and start of LHEGEN production"
	scram b -j 4
	
	echo "Load crab environment, grid environment should be loaded manually in advance if necessary"
	source /cvmfs/cms.cern.ch/crab3/crab.sh

	echo "Change number of events in crab config to"
	echo $NUMBEREVENTS
	echo " and copy crabconfig.py to workdir"
	sed -e "s/#NUMBEREVENTS#/${NUMBEREVENTS}/g" $STARTDIR/../python/lfv/lfv_MiniAODcrabConfig.py > ./crabconfig_eventsInserted.py
	sed -e "s/#REQUESTDATE#/`date  +'%Y%m%d%H%m%s'`/g" ./crabconfig_eventsInserted.py > ./crabconfig_dateInserted.py
	sed -e "s/#WHOAMI#/`whoami`/g" ./crabconfig_dateInserted.py > ./crabconfig_UserInserted.py

	#export BASENAMEREPLACE=$(basename ${GENSIMLOC%.*})
	#sed -e "s/#BASENAME#/${BASENAMEREPLACE}/g" ./crabconfig_UserInserted.py > ./crabconfig.py
	sed -e "s~#BASENAME#~${GENSIMLOC}~g" ./crabconfig_UserInserted.py > ./crabconfig.py
	

        echo "Scram b and start of LHEGEN production"
        scram b -j 4

	echo "Submit crab jobs"
	crab submit crabconfig.py

	echo "Finished with crab submission, check job status manually"
else
	echo "Will do local production using cmsRun"

	echo "Copy gridpack for production to workdir"
	cp $GENSIMLOC GENSIM.root

	echo "Add gridpack location to python config and copy cmssw python config to workdir"
	export GENSIMWORKDIR=`pwd`
	sed -e "s~#GENSIMLOCATION#~file:${GENSIMWORKDIR}/GENSIM.root~g" ./pythonAOD_cfg_eventsInserted.py > ./pythonAOD_cfg.py

	echo "Scram b and start of LHEGEN production"
	scram b -j 4

        echo "==================== PWD COMMAND ===================="

        pwd

	echo "Step 1 run"

	cmsRun pythonAOD_cfg.py 

	echo "Step 2 run"

	cmsRun -e -j Premix_2.xml lfv_MiniAOD_PSet_step2.py || exit $? ;

	echo "Step 3 run"

	cmsRun -e -j Premix_2.xml lfv_MiniAOD_PSet_step3.py || exit $? ;

	echo "Finished local production using cmsRun"
fi
