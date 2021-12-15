#!/bin/bash

dir=$1
datum=$2

mkdir bestand

cd "$HOME"/"$dir"

echo "is het een week of maand? vul :[week,maand] in"
read input
for x in *
do

	if [ "$input" = "week" ]
	then
		maandofweek=$(date -r "$file" +%W)

	else
	if [ "$input" = "maand" ]
	then
	maandofweek=$(date -r "$file" +%m)
	else
		echo "Je hebt iets anders gekozen dan maand of week"
		exit 1
	fi
fi




if [[ -d "$HOME"/bestand/"$maandofweek" ]]
then
	cp -v "$file" "$HOME"/bestand/"$maandofweek"/"$file"
else
	mkdir "$HOME"/bestand/"$periode"
	cp -v "$file" "$HOME"/bestand/"$maandofweek"/"$file"
fi

origineel=$(sudo md5sum "$HOME"/"$dir"/"$file" | cut -d " " -f1)
kopie=$(sudo md5sum "$HOME"/bestand/"$maandofweek"/"$file" | cut -d " " -f1)

if [ "$origineel" = "$kopie" ]
then
	rm "$file"
else
	echo "$fiile is fout"
fi

	echo ""

done
