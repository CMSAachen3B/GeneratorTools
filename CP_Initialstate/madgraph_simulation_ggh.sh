#!/bin/bash

if [ z ${CMSSW_BASE+x} ]; then

	$MADGRAPH_DIR/bin/mg5_aMC $GENERATOR_TOOLS/configs/ggh.txt

	chmod u+x $MADGRAPH_DIR/data_ggh/JJ_X0/SubProcesses/makefile

	sed -i -e "s@\(F2PY.*\)\$@\1 --fcompiler=gnu95@g" $MADGRAPH_DIR/data_ggh/JJ_X0/SubProcesses/makefile

	echo "hallo"
	for makefile in $MADGRAPH_DIR/data_ggh/JJ_X0/SubProcesses/P*/makefile;
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

	sed -i -e "s@\(F2PY.*\)\$@\1 --fcompiler=gnu95@g" $MADGRAPH_DIR/data_ggh/JJ_X0J/SubProcesses/makefile

	for makefile in $MADGRAPH_DIR/data_ggh/JJ_X0J/SubProcesses/P*/makefile;
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

	sed -i -e "s@\(F2PY.*\)\$@\1 --fcompiler=gnu95@g" $MADGRAPH_DIR/data_ggh/JJ_X0JJ/SubProcesses/makefile

	for makefile in $MADGRAPH_DIR/data_ggh/JJ_X0JJ/SubProcesses/P*/makefile;
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


	sed -i -e "s@\(F2PY.*\)\$@\1 --fcompiler=gnu95@g" $MADGRAPH_DIR/data_ggh/JJ_X0JJJ/SubProcesses/makefile

	for makefile in $MADGRAPH_DIR/data_ggh/JJ_X0JJJ/SubProcesses/P*/makefile;
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
else echo "To execute this script you must open a new terminal and not run 'setkitanalysis'!"
fi


#cd $MADGRAPH_DIR/gg_X0/SubProcesses/P1_gg_x0/
#pwd
#make matrix2py.so
