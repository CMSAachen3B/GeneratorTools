#!/bin/bash

wget https://launchpad.net/mg5amcnlo/2.0/2.5.x/+download/MG5_aMC_v2.6.0.tar.gz
tar -zxf MG5_aMC_v2.6.0.tar.gz
rm MG5_aMC_v2.6.0.tar.gz

wget feynrules.irmp.ucl.ac.be/raw-attachment/wiki/HiggsCharacterisation/HC_UFO_v4.1.zip
unzip HC_UFO_v4.1.zip -d `pwd`/MG5_aMC_v2_6_0/models
rm HC_UFO_v4.1.zip

wget feynrules.irmp.ucl.ac.be/raw-attachment/wiki/HiggsCharacterisation/HC_NLO_X0_UFO.zip
unzip HC_NLO_X0_UFO.zip -d `pwd`/MG5_aMC_v2_6_0/models
rm HC_NLO_X0_UFO.zip

export PATH=`pwd`/MG5_aMC_v2_6_0/bin:$PATH

export MADGRAPH_DIR=`pwd`/MG5_aMC_v2_6_0
