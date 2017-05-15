#!/bin/bash

# Define number of events
export NUMBEREVENTS=1000

# Define workdir
export WORKDIR=`pwd`

# Define gridpack location, warning if you are using crab, requires global accessible gridpack
# If running locally you can also set a local gridpack location
#export GRIDPACKLOC='https://github.com/CMSAachen3B/GeneratorTools/raw/master/data/ppTOzTOlep%2Blep-lfv_tarball.tar.xz'
export GRIDPACKLOC=$WORKDIR/ppTOzTOlep+lep-lfv_new_tarball.tar.xz
#wget https://github.com/CMSAachen3B/GeneratorTools/raw/master/data/ppTOzTOlep%2Blep-lfv_tarball.tar.xz
#mv ppTOzTOlep+lep-lfv_tarball.tar.xz gridpack.tgz
 #export GRIDPACKLOC=/afs/cern.ch/work/m/mharrend/public/ttHtranche3/TTTo2L2Nu_hvq_ttHtranche3.tgz

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
export SCRAM_ARCH=slc6_amd64_gcc481
if [ -r CMSSW_7_1_20_patch2/src ] ; then 
 echo release CMSSW_7_1_20_patch2 already exists
else
scram p CMSSW CMSSW_7_1_20_patch2
fi
cd CMSSW_7_1_20_patch2/src
eval `scram runtime -sh`
echo "Loaded CMSSW_7_1_20"

echo "Copy run script to workdir"
mkdir -p GeneratorInterface/LHEInterface/data/
cp $STARTDIR/run_generic_tarball_cvmfs.sh GeneratorInterface/LHEInterface/data/run_generic_tarball_cvmfs.sh

echo "Change number of events in python config to"
echo $NUMBEREVENTS
sed -e "s/#NUMBEREVENTS#/${NUMBEREVENTS}/g" $STARTDIR/LHE_wscript.py > ./pythonLHEGEN_cfg_eventsInserted.py
#sed -e "s/#NUMBEREVENTS#/${NUMBEREVENTS}/g" $STARTDIR/kappaWorkflow_privateMiniAOD_GEN.sh

if [ $USECRAB = "True" ]; then
	echo "Will use crab submission, adjust crabconfig.py accordingly if problems arise"

        echo "Copy gridpack for production to workdir, so that crab can transfer it also"
        cp $GRIDPACKLOC gridpack.tgz
	echo "Add gridpack location to python config and copy cmssw python config to workdir"
	sed -e "s~#GRIDPACKLOCATION#~../gridpack.tgz~g" ./pythonLHEGEN_cfg_eventsInserted.py > ./pythonLHEGEN_cfg.py

	echo "Scram b and start of LHEGEN production"
	scram b -j 4
	
	echo "Load crab environment, grid environment should be loaded manually in advance if necessary"
	source /cvmfs/cms.cern.ch/crab3/crab.sh

	echo "Change number of events in crab config to"
	echo $NUMBEREVENTS
	echo " and copy crabconfig.py to workdir"
	sed -e "s/#NUMBEREVENTS#/${NUMBEREVENTS}/g" $STARTDIR/crabConfig_tutorial_MC_generation3_wscript.py > ./crabconfig_eventsInserted.py
	sed -e "s/#REQUESTDATE#/`date  +'%Y%m%d%H%m%s'`/g" ./crabconfig_eventsInserted.py > ./crabconfig_dateInserted.py
	sed -e "s/#WHOAMI#/`whoami`/g" ./crabconfig_dateInserted.py > ./crabconfig_UserInserted.py

	export BASENAMEREPLACE=$(basename ${GRIDPACKLOC%.*})
	sed -e "s/#BASENAME#/${BASENAMEREPLACE}/g" ./crabconfig_UserInserted.py > ./crabconfig.py
	

        echo "Scram b and start of LHEGEN production"
        scram b -j 4

	echo "Submit crab jobs"
	crab submit crabconfig.py

	echo "Finished with crab submission, check job status manually"
else
	echo "Will do local production using cmsRun"

	echo "Copy gridpack for production to workdir"
	cp $GRIDPACKLOC gridpack.tgz

	echo "Add gridpack location to python config and copy cmssw python config to workdir"
	export GRIDPACKWORKDIR=`pwd`
	sed -e "s~#GRIDPACKLOCATION#~${GRIDPACKWORKDIR}/gridpack.tgz~g" ./pythonLHEGEN_cfg_eventsInserted.py > ./pythonLHEGEN_cfg.py

	echo "Scram b and start of LHEGEN production"
	scram b -j 4

	cmsRun pythonLHEGEN_cfg.py

	echo "Finished local production using cmsRun"
fi
