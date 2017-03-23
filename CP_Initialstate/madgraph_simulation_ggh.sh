#!/bin/bash

$MADGRAPH_DIR/bin/mg5_aMC $GENERATOR_TOOLS/configs/ggh.txt

sed -i -e "s@\(F2PY.*\)\$@\1 --fcompiler=gnu95" $MADGRAPH_DIR/JJ_X0/SubProcesses/makefile

echo "hallo"
for makefile in $MADGRAPH_DIR/JJ_X0/SubProcesses/P*/makefile;
do
	echo `dirname $makefile`
	echo "before"
	cd `dirname $makefile` 
	echo "hi"	
	pwd
	echo "here starts matrix2py"
	make matrix2py.so 
	#|| (echo "Compilation failed"; exit)
done

sed -i -e "s@\(F2PY.*\)\$@\1 --fcompiler=gnu95@g" $MADGRAPH_DIR/JJ_X0J/SubProcesses/makefile

for makefile in $MADGRAPH_DIR/JJ_X0J/SubProcesses/P*/makefile;
do
	echo `dirname $makefile`
	echo "before"
	cd `dirname $makefile` 
	echo "hi"	
	pwd
	echo "here starts matrix2py"
	make matrix2py.so 
	#|| (echo "Compilation failed"; exit)
done

sed -i -e "s@\(F2PY.*\)\$@\1 --fcompiler=gnu95@g" $MADGRAPH_DIR/JJ_X0JJ/SubProcesses/makefile

for makefile in $MADGRAPH_DIR/JJ_X0JJ/SubProcesses/P*/makefile;
do
	echo `dirname $makefile`
	echo "before"
	cd `dirname $makefile` 
	echo "hi"	
	pwd
	echo "here starts matrix2py"
	make matrix2py.so 
	#|| (echo "Compilation failed"; exit)
done




#cd $MADGRAPH_DIR/gg_X0/SubProcesses/P1_gg_x0/
#pwd
#make matrix2py.so
