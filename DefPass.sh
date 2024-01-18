#!/bin/bash

clear

BannerFunction(){
	echo "		+==================================================+"
	echo "		|			DefPass                    |"
	echo "		|	Anakind4, dTMP3st - Cyber Strike Force	   |"
	echo "		|	   	     Version - 1.0                 |"
	echo "		+==================================================+"
}

PasswordAttackFunction(){
	echo ""
	echo -n "I would like to validate the use of passwords on the target [Y/n] "
	read PasswordAttackConfirmation
	if [ "$PasswordAttackConfirmation" == "" ] || [ "$PasswordAttackConfirmation" == "Y" ] || [ "$PasswordAttackConfirmation" == "y" ]; then
		echo -n "Set a valid address for the target: "
		read TargetAddress
		echo -n "Set the port the service is running on: "
		read TargetPort
		echo "[+] Attacking $TargetAddress on port $TargetPort ..."
	else
		echo "[-] Exiting ..."
	fi
}

# Scan(){}

# Exploitation(){}


if [ "$1" == "" ] || [ "$2" == "" ] && [ "$1" != "--help" ]; then
	BannerFunction
	echo ""
	echo "Use mode: $0 <Vendor> <Product>"
	echo "Use $0 --help to view available parameters"
elif [ "$1" == "--help" ]; then
	BannerFunction
	echo ""
	echo "Parameters used by the program:"
	echo ""
	echo "--all - List all default passwords for all products from a specific vendor."	
elif [ "$2" == "--all" ]; then
	BannerFunction
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
			PasswordAttackFunction
		done
	fi
else
	BannerFunction
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
			PasswordAttackFunction
		done
	fi
fi