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
config.JobType.psetName = 'pythonAOD_cfg.py'
config.JobType.inputFiles = ['lfv_MiniAOD_PSet_step1.py','lfv_MiniAOD_PSet_step2.py','lfv_MiniAOD_PSet_step3.py','pileup_files2.txt']
#config.JobType.inputFiles = ['pileup_files2.txt']
config.Data.inputDataset = '#BASENAME#'
config.Data.inputDBS = 'phys03'
#config.Data.inputDataset = '/CMSSW_7_1_20_patch2/src/crab_projects/crab_privateMCProduction2017051515051494856358croote/'
#config.JobType.allowUndistributedCMSSW = True
#config.JobType.scriptExe = '../../kappaWorkflow_privateMiniAOD.sh'
#config.JobType.scriptExe = '../../kappaWorkflow_privateMiniAOD_GEN.sh'
#config.JobType.scriptExe = '../../AODscript_eventsInserted.sh'
config.JobType.scriptExe = './AODscript_eventsInserted.sh'
config.JobType.outputFiles = ['MiniAOD.root']
config.JobType.disableAutomaticOutputCollection = True

#config.Data.outputPrimaryDataset = 'LFV_ZToL1L2_13TeV_madgraph_pythia8'
config.Data.splitting = 'FileBased'
config.Data.unitsPerJob = 1
#NJOBS = 10  # This is not a configuration parameter, but an auxiliary variable that we use in the next line.
#config.Data.totalUnits = #NUMBEREVENTS#
#config.Data.totalUnits = config.Data.unitsPerJob * NJOBS
config.Data.outLFNDirBase = '/store/user/%s/' % (getUsernameFromSiteDB())
#config.Data.publication = False
config.Data.publication = True
config.Data.publishDBS = 'phys03'
config.Data.outputDatasetTag = 'RunIISummer16MiniAODv2-PUMoriond17_80X_mcRun2_asymptotic_2016'

config.Site.storageSite = "T2_DE_RWTH"
