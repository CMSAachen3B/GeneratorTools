#!/bin/bash

if [ ! -d $CMSSW_BASE/src/CMSAachen3B/GeneratorTools/data/vbf ]
then
	mkdir -p $CMSSW_BASE/src/CMSAachen3B/GeneratorTools/data/vbf
fi
rm -rf $CMSSW_BASE/src/CMSAachen3B/GeneratorTools/data/vbf/*

$CMSSW_BASE/src/CMSAachen3B/GeneratorTools/MG5_aMC_v2_6_0/bin/mg5_aMC $CMSSW_BASE/src/CMSAachen3B/GeneratorTools/data/configs/vbf.dat

ln -s $CMSSW_RELEASE_BASE/external/$SCRAM_ARCH/lib/* $CMSSW_BASE/src/CMSAachen3B/GeneratorTools/data/vbf/lib/
sed -i -e "s@\(F2PY.*\)\$@\1 --fcompiler=gnu95@g" $CMSSW_BASE/src/CMSAachen3B/GeneratorTools/data/vbf/SubProcesses/makefile



echo -e "\e[92mStart compiling makefile \"$MAKEFILE\"\e[0m"
cd $CMSSW_BASE/src/CMSAachen3B/GeneratorTools/data/vbf/SubProcesses/
make allmatrix2py.so && echo -e "\e[42mSuccessfully compiled makefile \"$MAKEFILE\".\e[0m" || echo -e "\e[41mFailed to compile makefile \"$MAKEFILE\"!\e[0m"
echo ""


