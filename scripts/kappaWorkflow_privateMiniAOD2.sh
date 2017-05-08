echo "================= PSet.py file =================="
cat PSet.py

export GRIDPACKLOC=https://github.com/CMSAachen3B/GeneratorTools/raw/master/data/ppTOzTOlep%2Blep-lfv_tarball.tar.xz

wget $GRIDPACLOC gridpack.tar.xz
sed -e "s~#GRIDPACKLOCATION#~./gridpack.tar.xz~g" PSet.py
ls

#echo "================= Gridpack download ================="
#wget https://github.com/CMSAachen3B/GeneratorTools/raw/master/data/ppTOzTOlep%2Blep-lfv_tarball.tar.xz

#echo "================= PWD ================="

#pwd

echo "================= CMSRUN starting ===================="
cmsRun -j FrameworkJobReport.xml -p PSet.py

#echo "================= STEP -AOD to MiniAOD finished ===================="
#s
#echo "================= creating softlink for cfipython ===================="
#rm -rf $CMSSW_BASE/cfipython
#ln $CMSSW_RELEASE_BASE/cfipython $CMSSW_BASE/cfipython -s


#cp $CMSSW_BASE/python/kSkimming_run2_cfg.py kappa_privateMiniAOD.py
#cmsRun -j FrameworkJobReport.xml  kappa_privateMiniAOD.py testfile=privateMiniAOD.root
#rm privateMiniAOD.root 
#echo "================= KAPPASKIM finished ===================="

#ls -lrth
echo "================= CMSRUN finished ===================="

#touch LHETuple.root
