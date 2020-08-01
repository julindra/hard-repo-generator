#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

. "${DIR}/script-data.sh"

org=""
phase=""
nowDate=`date +"%d"`
nowTime=`date +"%H"`
nowTime=$(expr $nowTime + 0)

i=1
while IFS=' ' read -r date week day clock || [[ -n "$date" ]]
do
	if [[ $i -eq 1 ]]; then
		org=$date
		phase=$week
	fi

	if [[ $date == $nowDate ]]; then
		if [[ $clock == "" && $nowTime -lt 12 ]] || [[ $clock == "pm" && $nowTime -ge 12 ]]; then
			if [[ $phase == "phase-0" ]]; then
				execute="${GENERATOR} ${org} ${week} ${TOKEN}"
				echo $execute
				$execute
			else
				execute="${GENERATOR} ${org} ${phase} ${week} ${day}"
				echo $execute
				. $execute
			fi
		fi
	fi

	i=$((i+1))
done < "$INPUT"