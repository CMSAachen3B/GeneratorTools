#!/bin/bash

$MADGRAPH_DIR/bin/mg5_aMC $GENERATOR_TOOLS/configs/vbf.txt

chmod u+x $MADGRAPH_DIR/data_vbf/JJ_X0JJ/SubProcesses/makefile

sed -i -e "s@\(F2PY.*\)\$@\1 --fcompiler=gnu95@g" $MADGRAPH_DIR/data_vbf/JJ_X0JJ/SubProcesses/makefile

echo "hallo"
for makefile in $MADGRAPH_DIR/data_vbf/JJ_X0JJ/SubProcesses/P*/makefile;
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

chmod u+x $MADGRAPH_DIR/data_vbf/JJ_X0JJJ/SubProcesses/makefile

sed -i -e "s@\(F2PY.*\)\$@\1 --fcompiler=gnu95@g" $MADGRAPH_DIR/data_vbf/JJ_X0JJJ/SubProcesses/makefile

echo "hallo"
for makefile in $MADGRAPH_DIR/data_vbf/JJ_X0JJJ/SubProcesses/P*/makefile;
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
