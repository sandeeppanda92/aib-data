#! /bin/bash
set -eu

FILES=$(ls json)

for file in $FILES
do
	echo "validating json/$file:"
	echo ""

	python -m json.tool < json/$file
	if [ $? -ne 0 ]; then
		exit
	fi
done
