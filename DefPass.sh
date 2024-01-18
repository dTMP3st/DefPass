#!/bin/bash

clear

Banner=$(	echo "		+==================================================+"
	echo "		|			DefPass                    |"
	echo "		|	Anakind4, dTMP3st - Cyber Strike Force	   |"
	echo "		|	   	     Version - 1.0                 |"
	echo "		+==================================================+")

if [ "$1" == "" ] || [ "$2" == "" ]; then
	echo "$Banner"
	echo ""
	echo "Use mode: $0 <Vendor> <Product>"
elif [ "$2" == "--all" ]; then
	echo "$Banner"
	echo ""
	echo "Listing all standard passwords of products off $1 vendor."
	echo ""
	DefPassValidation=$(cat Vendors/$1/All.lst 2> /dev/null)
	if [ "$DefPassValidation" == "" ]; then
		echo "This product is not registered in the database."
		# Validar possibilidade de implementar busca pela internet e em seguida implementar na base de dados.
	else
		for DefaultPassword in $(cat Vendors/$1/All.lst); do
			DetectUsername=$(echo "$DefaultPassword" | cut -d "," -f1)
			DetectPassword=$(echo "$DefaultPassword" | cut -d "," -f2)
			echo "Username: $DetectUsername | Password: $DetectPassword"
		done
	fi
else
	echo "$Banner"
	echo ""
	DefPassValidation=$(cat Vendors/$1/$2.lst 2> /dev/null)
	if [ "$DefPassValidation" == "" ]; then
		echo "This product is not registered in the database."
		# Validar possibilidade de implementar busca pela internet e em seguida implementar na base de dados.
	else
		for DefaultPassword in $(cat Vendors/$1/$2.lst); do
			DetectUsername=$(echo "$DefaultPassword" | cut -d "," -f1)
			DetectPassword=$(echo "$DefaultPassword" | cut -d "," -f2)
			echo "Username: $DetectUsername | Password: $DetectPassword"
		done
	fi
fi