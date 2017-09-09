#!/usr/bin/env python
# -*- coding: utf-8 -*-

import logging
import Artus.Utility.logger as logger
log = logging.getLogger(__name__)

import argparse
import os
import re


def cmssw_directory(output_directory):
	return output_directory.replace(os.path.expandvars("$CMSSW_BASE"), "$CMSSW_BASE")

def process2key(process):
	return process.replace(" ", "").replace("~", "_bar").replace(">", "_").replace("x0", "h0")

def print_config(output_directory, process):
	log.info("\""+process2key(process)+":"+output_directory+"\",")


if __name__ == "__main__":

	parser = argparse.ArgumentParser(description="Parse MadGraph output to find MadGraphProcessDirectories settings for Artus.",
	                                 parents=[logger.loggingParser])
	parser.add_argument("madgraph_log", help="MadGraph output")
	args = parser.parse_args()
	logger.initLogger(args)
	
	madgraph_log = ""
	with open(args.madgraph_log) as madgraph_log_file:
		madgraph_log = madgraph_log_file.read()
	
	process_pattern = "(?:[gudcsbhx][~0]?)(?:\\s[gudcsbhx][~0]?)*\\s\\>(?:\\s[gudcsbhx][~0]?)+"
	
	output_pattern = "INFO: Creating files in directory\\s(.*)\\s\nINFO: Generating Feynman diagrams for Process:\\s("+process_pattern+")"
	output_results = re.findall(output_pattern, madgraph_log, re.MULTILINE)
	
	for output_directory, main_process in output_results:
		output_directory = cmssw_directory(output_directory)
		print_config(output_directory, main_process)
		
		combined_process_pattern = "INFO: Combined process\\s("+process_pattern+").*with process\\s"+main_process+"(?!\\s[gudcsbhx][~0]?\\s)"
		combined_process_results = re.findall(combined_process_pattern, madgraph_log)
		
		for combined_process in combined_process_results:
			print_config(output_directory, combined_process)

