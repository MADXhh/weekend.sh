#!/bin/bash
#
# Bash script for tell the number of remaining working days
#
# Version 0.9
#
# Usage:
# 			weekend.sh Result:
#			>X days to go< (in case of a working day)
# or
#			>weekend<
#
#
################# FUNCTIONS ####################
# Capture CTRL+C
trap CtrlC INT
function CtrlC() {
read -p "weekend.sh cancelled! really ? [y/N] " -n 1 -r
echo
if ! [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "In Hamburg sagt man TSCHUESS!!"
	echo " "
	exit 1
else
	echo "run..."
	echo ""
fi
}

# Help-function
help() {
	echo ""
	echo "weekend.sh"
	echo ""
	echo "Usage:"
	echo " weekend.sh"
	echo " Result:"
	echo " X days to goâ€œ (in case of a working day)"
	echo " or "
	echo " >weekend< "
	echo ""
	echo "---"
	echo ""
	exit 1
}
################ main ########################
day=$(LC_ALL=de_DE.utf8 date +%a)

#echo $day
echo ""

if [ $# -lt 1 ]
then
	case $day in
	Mo) echo -e "\e[1m\e[91m5 days to go\e[0m";;
	Di) echo -e "\e[1m\e[91m4 days to go\e[0m";;
	Mi) echo -e "\e[1m\e[91m3 days to go\e[0m";;
	Do) echo -e "\e[1m\e[91m2 days to go\e[0m";;
	Fr) echo -e "\e[1m\e[91m1 day to go\e[0m";;
	Sa) echo -e "\e[1m\e[91mweekend\e[0m";;
	So) echo -e "\e[1m\e[91mweekend\e[0m";;
	*) echo " :-( "
		echo "unknown Error..."
		help;;
	esac
	echo ""
else
	echo " :-( "
	echo "unknown Error..."
	echo ""
	help
fi
exit 0
