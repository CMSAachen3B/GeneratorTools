echo "================= PSet.py file 1 =================="
cat PSet.py

#echo "================= PSet.pkl file =================="
#cat PSet.pkl

echo "================= ls command ================="
ls

echo "================= pwd command ================="
pwd

echo "================= ENV COMMAND ================="
env 

#echo "================= SED REPLACE ================="
#sed -i -e "s~#GRIDPACK#~${CMSSW_RELEASE_BASE}/src/CMSAachen3B/GeneratorTools/data/ppTOzTOlep+lep-lfv_tarball.tar.xz~g" ./LHE.py
#sed -i -e "s~#GRIDPACK#~${CMSSW_RELEASE_BASE}/src/CMSAachen3B/GeneratorTools/data/ppTOzTOlep+lep-lfv_tarball.tar.xz~g" ./PSet.py
#sed -e "s~#GRIDPACKLOCATION#~${GRIDPACKWORKDIR}/gridpack.tgz~g"

#echo "================= PSet.py file 2 =================="
#cat PSet.py
#echo "---------------------------------------------------"
#cat LHE.py

echo "================= CMSRUN starting ===================="
cmsRun -j FrameworkJobReport.xml -p PSet.py

#echo "================= PSet.py file 3 =================="
#cat PSet.py

echo "================= STEP -AOD to MiniAOD finished ===================="

#echo "================= creating softlink for cfipython ===================="
#rm -rf $CMSSW_BASE/cfipython
#ln $CMSSW_RELEASE_BASE/cfipython $CMSSW_BASE/cfipython -s


#cp $CMSSW_BASE/python/kSkimming_run2_cfg.py kappa_privateMiniAOD.py
#cmsRun -j FrameworkJobReport.xml  kappa_privateMiniAOD.py testfile=privateMiniAOD.root
#rm privateMiniAOD.root 
#echo "================= KAPPASKIM finished ===================="

#ls -lrth
echo "================= CMSRUN finished ===================="

cmsRun -e -j Premix_2.xml Premix_2.py || exit $? ; 
echo "RUN PREMIX 2 DONE"
#---------------------------------------------------------------------------------------------------------------------------------------------------------------
 
echo "DRIVER MINIAOD DONE"
cmsRun -e -j MiniAOD.xml MiniAOD.py || exit $? ; 
echo "RUN MINIAOD DONE"

