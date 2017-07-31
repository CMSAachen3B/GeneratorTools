from CRABClient.UserUtilities import config, getUsernameFromSiteDB
config = config()

#config.General.requestName = 'tutorial_May2015_MC_generation_4'
config.General.requestName = "privateMCProduction#REQUESTDATE##WHOAMI#"
config.General.workArea = './crab_projects'
config.General.transferOutputs = True
config.General.transferLogs = True

config.User.voGroup = 'dcms'

config.JobType.pluginName = 'PrivateMC'
#config.JobType.inputFiles = ['run_generic_tarball_cvmfs.sh','ppTOzTOleplfv_tarball.tgz']
config.JobType.psetName = 'pythonLHE_cfg.py'
config.JobType.inputFiles = ['GeneratorInterface/LHEInterface/data/run_generic_tarball_cvmfs.sh', 'gridpack.tgz']
#config.JobType.allowUndistributedCMSSW = True
config.JobType.scriptExe = './lfv_LHEGENSIMsubmissionScript.sh'
#config.JobType.scriptExe = '../../kappaWorkflow_privateMiniAOD_GEN.sh'
#config.JobType.scriptExe = '../../kappaWorkflow_privateMiniAOD_AODSIM.sh'
#config.JobType.outputFiles = ['LHETuple.root']

config.Data.outputPrimaryDataset = 'LFV_ZToL1L2_13TeV_madgraph_pythia8'
config.Data.splitting = 'EventBased'
config.Data.unitsPerJob = 1000
#NJOBS = 10  # This is not a configuration parameter, but an auxiliary variable that we use in the next line.
config.Data.totalUnits = #NUMBEREVENTS#
#config.Data.totalUnits = config.Data.unitsPerJob * NJOBS
config.Data.outLFNDirBase = '/store/user/%s/' % (getUsernameFromSiteDB())
#config.Data.publication = False
config.Data.publication = True
config.Data.publishDBS = 'phys03'
config.Data.outputDatasetTag = 'RunIISummer16MiniAODv2-PUMoriond17_80X_mcRun2_asymptotic_2016'

config.Site.storageSite = "T2_DE_RWTH"
