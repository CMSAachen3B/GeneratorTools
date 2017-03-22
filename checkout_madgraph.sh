#!/bin/bash

wget https://launchpad.net/mg5amcnlo/2.0/2.5.x/+download/MG5_aMC_v2.5.3.tar.gz
tar -zxf MG5_aMC_v2.5.3.tar.gz


wget feynrules.irmp.ucl.ac.be/raw-attachment/wiki/HiggsCharacterisation/HC_UFO_v4.1.zip
unzip HC_UFO_v4.1.zip -d `pwd`/MG5_aMC_v2_5_3/models


export PATH=`pwd`/MG5_aMC_v2_5_3/bin:$PATH

export MADGRAPH_DIR=`pwd`/MG5_aMC_v2_5_3
