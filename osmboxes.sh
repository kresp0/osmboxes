#!/bin/bash
if [[ $# -eq 0 ]] ; then
    echo 'Use: ./osmboxes.sh file.osm osmtm_tasks_XX.json'
    exit 0
fi

perl -pe 's/{"geo/\n{"geo/g' $2 | grep '"state": 0' > /tmp/tareas

NAME=`echo $1 | awk -F '.' '{print $1}'`

while IFS='' read -r linea || [[ -n "$linea" ]]; do
	echo $linea > /tmp/linea
	X=`awk -F '"x": ' '{print $2}' /tmp/linea | awk -F ',' '{print $1}' | tr -d '}'`
	Y=`awk -F '"y": ' '{print $2}' /tmp/linea | awk -F ',' '{print $1}' | tr -d '}'`
	perl -pe 's/\[\[\[\[/XXXXX\n/' /tmp/linea | perl -pe 's/\]\]\]\]/\nXXXX/g' | grep -v XXXX | tr -d '[],' | perl -pe 's/ /\n/g' | sort -nu | perl -pe 's/\n/,/g' > /tmp/coordenadas
	BOX=`awk -F ',' '{print $1","$3","$2","$4}' /tmp/coordenadas`
	FILE=$NAME-$X-$Y.osm
	echo $FILE
	osmconvert $1 -b=$BOX -o=$FILE
done < /tmp/tareas
