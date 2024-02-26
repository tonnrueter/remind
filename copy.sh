#!/bin/bash
while :
do
	echo "First loop..."
	! cp -r climate-temp/workers/pymagicc-* . || break 1
	sleep 0.5
done
while :
do
	echo "Second loop..."
	cp -r climate-temp/workers/pymagicc-* . || exit 1
	sleep 0.5
done
