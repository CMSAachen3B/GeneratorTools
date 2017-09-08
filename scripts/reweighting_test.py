#!/usr/bin/env python
# -*- coding: utf-8 -*-

import math
import multiprocessing
import os
import string
import sys
import tempfile

#data and param_card
#madgraph_process_directory = "/.automount/home/home__home2/institut_3b/wiens/Bachelorarbeit/Analysis/CMSSW_7_4_7/src/CMSAachen3B/GeneratorTools/data/vbf/JJ_X0JJ/SubProcesses/P1_ud_x0ud"

#generate p p > x0 j j $$ w+ w- z / a @0
madgraph_process_directory = "/.automount/home/home__home2/institut_3b/wiens/Bachelorarbeit/Analysis/CMSSW_7_4_7/src/CMSAachen3B/GeneratorTools/data/vbf/SubProcesses/P0_dux_x0dux_no_a"

#gridpack
#madgraph_process_directory = "/.automount/home/home__home2/institut_3b/wiens/Bachelorarbeit/Analysis/CMSSW_7_4_7/src/CMSAachen3B/GeneratorTools/data/vbf_gridpack/SubProcesses/P18_ud_hud"

#[virt=QCD]
#madgraph_process_directory = "/.automount/home/home__home2/institut_3b/wiens/Bachelorarbeit/Analysis/CMSSW_7_4_7/src/CMSAachen3B/GeneratorTools/data/vbf_nlo/SubProcesses/P15_ud_x0ud_no_a"

alpha_s = 0.118
madgraph_param_card = "/.automount/home/home__home2/institut_3b/wiens/Bachelorarbeit/Analysis/CMSSW_7_4_7/src/param_card_ud_x0ud.dat"
cartesian_four_momenta = [[264.7953186035156, 0.0, 0.0, 264.7951354980469], [1960.022216796875, 0.0, 0.0, -1960.022216796875], [638.6737060546875, 6.08879280090332, -279.48333740234375, -560.4739990234375], [1263.6693115234375, -1.991899847984314, -16.118444442749023, -1263.56494140625], [322.4744873046875, -4.096892833709717, 295.6017761230469, 128.81185913085938]]


os.chdir(madgraph_process_directory)
sys.path.insert(0, madgraph_process_directory)

import matrix2py

matrix2py.initialise(madgraph_param_card)

nhel = 0 # means sum over all helicity
result = matrix2py.get_me(zip(*cartesian_four_momenta), alpha_s, 0)


print "Matrixelementsquared = ", result

#gridpack output
#KSM=0 und VBF Kappas=1
#Matrixelementsquared =  (-0.0004936838295594038, 236)

#KSM=1 und VBF Kappas=0
#Matrixelementsquared =  (-0.0004936838295594038, 236)

#KSM=1 und VBF Kappas=1
#Matrixelementsquared =  (-0.0004936838295594038, 236)

