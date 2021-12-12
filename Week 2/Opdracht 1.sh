#!/bin/bash

dir=$1
datum=$2

mkdir bestand

cd "$HOME"/"$dir"



for x in *
do
	if [ "$datum" = "week" ]
	then
		periode=$(date -r "$x" +%W)
	else
		if [ "$datum" = "maand" ]
		then
			periode=$(date -r "$x" +%m)
		else
			echo "Geen datum opgegeven"
			exit 1
		fi
	fi



	if [[ -d "$HOME"/bestand/"$periode" ]]
	then
		cp -v "$x" "$HOME"/bestand/"$periode"/"$x"
	else
		mkdir "$HOME"/bestand/"$periode"
		cp -v "$x" "$HOME"/bestand/"$periode"/"$x"
	fi

	oud=$(sudo md5sum "$HOME"/"$dir"/"$x" | cut -d " " -f1)
	nieuw=$(sudo md5sum "$HOME"/bestand/"$periode"/"$x" | cut -d " " -f1)

	if [ "$oud" = "$nieuw" ]
	then
		rm "$x"
	else
		echo "$x is fout"
	fi

	echo ""
done
