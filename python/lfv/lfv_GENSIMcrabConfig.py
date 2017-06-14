from CRABClient.UserUtilities import config, getUsernameFromSiteDB
config = config()

#config.General.requestName = 'tutorial_May2015_MC_generation_4'
config.General.requestName = "privateMCProduction#REQUESTDATE##WHOAMI#"
config.General.workArea = './crab_projects'
config.General.transferOutputs = True
config.General.transferLogs = True

config.User.voGroup = 'dcms'

config.JobType.pluginName = 'Analysis'
#config.JobType.inputFiles = ['run_generic_tarball_cvmfs.sh','ppTOzTOleplfv_tarball.tgz']
config.JobType.psetName = 'pythonGENSIM_cfg.py'
#config.JobType.inputFiles = ['GeneratorInterface/LHEInterface/data/run_generic_tarball_cvmfs.sh', 'LHE.root']
config.Data.inputDataset = #DATASETLOC#
config.Data.inputDBS = 'phys03'
#config.Data.inputDataset = '/CMSSW_7_1_20_patch2/src/crab_projects/crab_privateMCProduction2017051515051494856358croote/'
#config.JobType.allowUndistributedCMSSW = True
config.JobType.scriptExe = '../../lfv_LHEGENSIMsubmissionScript.sh'
#config.JobType.scriptExe = '../../kappaWorkflow_privateMiniAOD_GEN.sh'
#config.JobType.scriptExe = '../../kappaWorkflow_privateMiniAOD_AODSIM.sh'
#config.JobType.outputFiles = ['LHETuple.root']

#config.Data.outputPrimaryDataset = 'MinBias'
config.Data.splitting = 'FileBased'
config.Data.unitsPerJob = 250
#NJOBS = 10  # This is not a configuration parameter, but an auxiliary variable that we use in the next line.
#config.Data.totalUnits = #NUMBEREVENTS#
#config.Data.totalUnits = config.Data.unitsPerJob * NJOBS
config.Data.outLFNDirBase = '/store/user/%s/' % (getUsernameFromSiteDB())
config.Data.publication = False
#config.Data.publication = True
config.Data.outputDatasetTag = 'CRAB3_tutorial_May2015_MC_analysis_3_winputfiles'

config.Site.storageSite = "T2_DE_RWTH"
