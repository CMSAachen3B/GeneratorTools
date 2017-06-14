#!/bin/bash

# Define number of events
export NUMBEREVENTS= 100000

# Define workdir
export WORKDIR=`$CMSSW_BASE/../`

# Define dataset location, warning if you are using crab, requires global accessible dataset
# If running locally you can also set a local location
#export LHELOC=$WORKDIR/LHE.root
export LHELOC='/MinBias/croote-CRAB3_tutorial_May2015_MC_analysis_3_winputfiles-cc8a7e5394800ee601e23fd8c9aa6a3c/USER'

# Use crab for grid submitting, adjust crabconfig.py accordingly beforehand
export USECRAB="True"
#export USECRAB="False"

######### Do not change anything behind this line ###############


export STARTDIR=`pwd`
echo "Start dir was:"
echo $STARTDIR

echo "Workdir set is:" 
echo $WORKDIR
mkdir -p $WORKDIR
echo "Created workdir"
cd $WORKDIR
echo "Changed into workdir"

echo "Install CMSSW in workdir"
if [ -r CMSSW_7_1_20_patch3/src ] ; then 
 echo release CMSSW_7_1_20_patch3 already exists
else
scram p CMSSW CMSSW_7_1_20_patch3
fi
cd CMSSW_7_1_20_patch3/src
eval `scram runtime -sh`
echo "Loaded CMSSW_7_1_20"

#echo "Copy run script to workdir"
#mkdir -p GeneratorInterface/LHEInterface/data/
#cp $STARTDIR/run_generic_tarball_cvmfs.sh GeneratorInterface/LHEInterface/data/run_generic_tarball_cvmfs.sh

echo "Change number of events in python config to"
echo $NUMBEREVENTS
sed -e "s/#NUMBEREVENTS#/${NUMBEREVENTS}/g" $STARTDIR/../python/lfv/lfv_GENSIM_PSet.py > ./pythonGENSIM_cfg_eventsInserted.py
#sed -e "s/#NUMBEREVENTS#/${NUMBEREVENTS}/g" $STARTDIR/kappaWorkflow_privateMiniAOD_GEN.sh

if [ $USECRAB = "True" ]; then
	echo "Will use crab submission, adjust crabconfig.py accordingly if problems arise"

	echo "Add dataset location to python config and copy cmssw python config to workdir"
	sed -e "s~#DATASETLOC#~${LHELOC}~g" ./pythonGENSIM_cfg_eventsInserted.py > ./pythonGENSIM_cfg.py

	echo "Scram b and start of LHEGEN production"
	scram b -j 4
	
	echo "Load crab environment, grid environment should be loaded manually in advance if necessary"
	source /cvmfs/cms.cern.ch/crab3/crab.sh

	echo "Change number of events in crab config to"
	echo $NUMBEREVENTS
	echo " and copy crabconfig.py to workdir"
	sed -e "s/#NUMBEREVENTS#/${NUMBEREVENTS}/g" $STARTDIR/../python/lfv/lfv_GENSIMcrabConfig.py > ./crabconfig_eventsInserted.py
	sed -e "s/#REQUESTDATE#/`date  +'%Y%m%d%H%m%s'`/g" ./crabconfig_eventsInserted.py > ./crabconfig_dateInserted.py
	sed -e "s/#WHOAMI#/`whoami`/g" ./crabconfig_dateInserted.py > ./crabconfig_UserInserted.py

	#export BASENAMEREPLACE=$(basename ${LHELOC%.*})
	#sed -e "s/#BASENAME#/${BASENAMEREPLACE}/g" ./crabconfig_UserInserted.py > ./crabconfig.py
	

        echo "Scram b and start of LHEGEN production"
        scram b -j 4

	echo "Submit crab jobs"
	crab submit crabconfig.py

	echo "Finished with crab submission, check job status manually"
else
	echo "Will do local production using cmsRun"

	echo "Copy gridpack for production to workdir"
	cp $LHELOC LHE.root

	echo "Add gridpack location to python config and copy cmssw python config to workdir"
	export LHEWORKDIR=`pwd`
	sed -e "s~#LHELOCATION#~${LHEWORKDIR}/LHE.root~g" ./pythonGENSIM_cfg_eventsInserted.py > ./pythonGENSIM_cfg.py

	echo "Scram b and start of LHEGEN production"
	scram b -j 4

	cmsRun pythonGENSIM_cfg.py

	echo "Finished local production using cmsRun"
fi
