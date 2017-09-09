#!/usr/bin/env python
# -*- coding: utf-8 -*-

import logging
import Artus.Utility.logger as logger
log = logging.getLogger(__name__)

import argparse
import os
import sys


if __name__ == "__main__":

	parser = argparse.ArgumentParser(description="Test matrix element calculation for a dux_x0dux VBF event.",
	                                 parents=[logger.loggingParser])

	parser.add_argument("--param-card", default="/.automount/home/home__home2/institut_3b/wiens/Bachelorarbeit/Analysis/CMSSW_7_4_7/src/param_card_ud_x0ud.dat",
	                    help="Path to param_card.dat. [Default: %(default)s]")
	parser.add_argument("--process-directory", default="$CMSSW_BASE/src/CMSAachen3B/GeneratorTools/data/vbf/SubProcesses/P0_dux_x0dux_no_a",
	                    help="Path to param_card.dat. [Default: %(default)s]")
	
	args = parser.parse_args()
	logger.initLogger(args)
	
	args.param_card = os.path.abspath(os.path.expandvars(args.param_card))
	args.process_directory = os.path.abspath(os.path.expandvars(args.process_directory))
	
	os.chdir(args.process_directory)
	sys.path.insert(0, args.process_directory)
	import matrix2py
	
	matrix2py.initialise(args.param_card)
	
	cartesian_four_momenta = [[264.7953186035156, 0.0, 0.0, 264.7951354980469], [1960.022216796875, 0.0, 0.0, -1960.022216796875], [638.6737060546875, 6.08879280090332, -279.48333740234375, -560.4739990234375], [1263.6693115234375, -1.991899847984314, -16.118444442749023, -1263.56494140625], [322.4744873046875, -4.096892833709717, 295.6017761230469, 128.81185913085938]]
	alpha_s = 0.118
	nhel = 0 # means sum over all helicity
	matrix_element_squared = matrix2py.get_me(zip(*cartesian_four_momenta), alpha_s, nhel)
	
	log.info("squared matrix element = " + str(matrix_element_squared))

