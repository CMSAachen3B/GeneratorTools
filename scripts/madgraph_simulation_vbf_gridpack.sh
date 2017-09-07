#!/bin/bash

if [ ! -d $CMSSW_BASE/src/CMSAachen3B/GeneratorTools/data/vbf_gridpack ]
then
	mkdir -p $CMSSW_BASE/src/CMSAachen3B/GeneratorTools/data/vbf_gridpack
fi
rm -rf $CMSSW_BASE/src/CMSAachen3B/GeneratorTools/data/vbf_gridpack/*

$CMSSW_BASE/src/CMSAachen3B/GeneratorTools/MG5_aMC_v2_5_5/bin/mg5_aMC $CMSSW_BASE/src/CMSAachen3B/GeneratorTools/data/configs/vbf_gridpack.dat

ln -s $CMSSW_RELEASE_BASE/external/$SCRAM_ARCH/lib/* $CMSSW_BASE/src/CMSAachen3B/GeneratorTools/data/vbf_gridpack/lib/
sed -i -e "s@\(F2PY.*\)\$@\1 --fcompiler=gnu95@g" $CMSSW_BASE/src/CMSAachen3B/GeneratorTools/data/vbf_gridpack/SubProcesses/makefile

for MAKEFILE in $CMSSW_BASE/src/CMSAachen3B/GeneratorTools/data/vbf_gridpack/SubProcesses/P*/makefile;
do
	echo -e "\e[92mStart compiling makefile \"$MAKEFILE\"\e[0m"
	cd `dirname $MAKEFILE`
	make matrix2py.so && echo -e "\e[42mSuccessfully compiled makefile \"$MAKEFILE\".\e[0m" || echo -e "\e[41mFailed to compile makefile \"$MAKEFILE\"!\e[0m"
	echo ""
done

