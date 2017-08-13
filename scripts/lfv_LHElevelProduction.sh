#!/bin/bash

# Define number of events
export NUMBEREVENTS=100000

# Do not edit this
export STARTDIR=`pwd`

# Define workdir
export WORKDIR=$CMSSW_BASE/../../../

# Define gridpack location, warning if you are using crab, requires global accessible gridpack
# If running locally you can also set a local gridpack location
export GRIDPACKLOC=$STARTDIR/../data/ppTOzTOlep+lep-LFV_slc6_amd64_gcc481_CMSSW_7_1_28_tarball.tar.xz

# Use crab for grid submitting, adjust crabconfig.py accordingly beforehand
#export USECRAB="True"
export USECRAB="False"

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
cp $STARTDIR/lfv_LHEGENSIMsubmissionScript.sh ./

echo "Change number of events in python config to"
echo $NUMBEREVENTS
wget https://raw.githubusercontent.com/TomCroote/lfvgenprod/master/lfv/lfv_LHE_PSet.py
ls -la ./
mv ./lfv_LHE_PSet.py $STARTDIR/../python/lfv/lfv_LHE_PSet.py
sed -e "s/#NUMBEREVENTS#/${NUMBEREVENTS}/g" $STARTDIR/../python/lfv/lfv_LHE_PSet.py > ./pythonLHE_cfg_eventsInserted.py
rm -r $STARTDIR/../python/lfv/lfv_LHE_PSet.py

if [ $USECRAB = "True" ]; then
	echo "Will use crab submission, adjust crabconfig.py accordingly if problems arise"

        echo "Copy gridpack for production to workdir, so that crab can transfer it also"
        cp $GRIDPACKLOC gridpack.tgz
	echo "Add gridpack location to python config and copy cmssw python config to workdir"
	sed -e "s~#GRIDPACKLOCATION#~../gridpack.tgz~g" ./pythonLHE_cfg_eventsInserted.py > ./pythonLHE_cfg.py

	echo "Scram b and start of LHE production"
	scram b -j 4
	
	echo "Load crab environment, grid environment should be loaded manually in advance if necessary"
	source /cvmfs/cms.cern.ch/crab3/crab.sh

	echo "Change number of events in crab config to"
	echo $NUMBEREVENTS
	echo " and copy crabconfig.py to workdir"
	wget https://raw.githubusercontent.com/TomCroote/lfvgenprod/master/lfv/lfv_LHEcrabConfig.py 
	mv ./lfv_LHEcrabConfig.py $STARTDIR/../python/lfv/
	sed -e "s/#NUMBEREVENTS#/${NUMBEREVENTS}/g" $STARTDIR/../python/lfv/lfv_LHEcrabConfig.py > ./crabconfig_eventsInserted.py
	rm -r $STARTDIR/../python/lfv/lfv_LHEcrabConfig.py
	sed -e "s/#REQUESTDATE#/`date  +'%Y%m%d%H%m%s'`/g" ./crabconfig_eventsInserted.py > ./crabconfig_dateInserted.py
	sed -e "s/#WHOAMI#/`whoami`/g" ./crabconfig_dateInserted.py > ./crabconfig_UserInserted.py

	export BASENAMEREPLACE=$(basename ${GRIDPACKLOC%.*})
	sed -e "s/#BASENAME#/${BASENAMEREPLACE}/g" ./crabconfig_UserInserted.py > ./crabconfig.py
	

        echo "Scram b and start of LHE production"
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
	sed -e "s~#GRIDPACKLOCATION#~${GRIDPACKWORKDIR}/gridpack.tgz~g" ./pythonLHE_cfg_eventsInserted.py > ./pythonLHE_cfg.py

	echo "Scram b and start of LHE production"
	scram b -j 4

	cmsRun pythonLHE_cfg.py

	echo "Finished local production using cmsRun"
fi
