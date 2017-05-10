echo "================= PSet.py file =================="
cat PSet.py

echo "================= ls command ================="
ls

echo "================= ENV COMMAND ================="
env 

echo "================= SED REPLACE ================="
sed -i -e "s@#GRIDPACK#@$CMSSW_RELEASE_BASE/src/CMSAachen3B/GeneratorTools/data/ppTOzTOlep+lep-lfv_tarball.tar.xz@g" PSet.py

echo "================= CMSRUN starting ===================="
cmsRun -j FrameworkJobReport.xml -p PSet.py

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

