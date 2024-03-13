#!/bin/bash


###################################
# Keep Sharp                      #
# https://www.keepsharp.site/main #
# https://github.com/keepsharp    #
###################################




############## Check Root Privileges ##############
function root(){ 
	if [[ $UID -ne 0 ]]; then
		return 0
		#echo "You must run this script as root"
	else
		return 1
	fi
} 



############## Brute Force ##############
function bruteforce() {
	lista=("crunch" "john" "hashcat" "hydra" "cewl")
	for i in "${lista[@]}"
	do 
	if command -v $i  > /dev/null 2>&1; then
		echo -e "$i -->" "\033[32m Command already installed on this distro\033[0m"
	else
		echo -e "$i -->" "\033[31m Command doesn't exist\033[0m"
		echo -e "\033[32m {+} Install $i \033[0m"
		apt install $i -y 
	fi
	done 
}




############## Steganography ##############
function stegano() {
	lista=("convert" "exif" "exiftool" "exiv2" "outguess" "steghide" "stegcracker" "zsteg")
	for i in "${lista[@]}"
	do 
	if command -v $i  > /dev/null 2>&1; then
		echo -e "$i -->" "\033[32m Command already installed on this distro\033[0m"
	else
		echo -e "$i -->" "\033[31m Command doesn't exist\033[0m"
		echo -e "\033[32m {+} Install $i \033[0m"
		apt install $i -y 
	fi
	done 
}



############## Update system ##############
function update(){
	apt update -y 
	apt full-upgrade -y 
}



############## Forensic Tools ############## 
function forensic() {
	lista=("aircrack-ng" "audacity" "samdump2" "creddump7" "exiftool" "extundelete" "foremost" "pngcheck" "usbrip" "wireshark")
	for i in "${lista[@]}"
	do 
	if command -v $i  > /dev/null 2>&1; then
		echo -e "$i -->" "\033[32m Command already installed on this distro\033[0m"
	else
		echo -e "$i -->" "\033[31m Command doesn't exist\033[0m"
		echo -e "\033[32m {+} Install $i \033[0m"
		apt install $i -y 
	fi
	done
}



############## Reverse Engineering & Binary Exploiation ##############
function reverse() {
	lista=("binwalk" "strings" "ghidra" "apktool" "radare2" "jadx" "javasnoop" "edb-debugger")
	for i in "${lista[@]}"
	do 
	if command -v $i  > /dev/null 2>&1; then
		echo -e "$i -->" "\033[32m Command already installed on this distro\033[0m"
	else
		echo -e "$i -->" "\033[31m Command doesn't exist\033[0m"
		echo -e "\033[32m {+} Install $i \033[0m"
		apt install $i -y 
	fi
	done
}




############## Python Libraries ##############
function programming() {
	lista=("pwntools" "bs4" "sys" "requests" "urllib3" "impacket" "cryptography" "yara" "angr")
	list_code=("pwn" "bs4" "sys" "requests" "urllib3" "impacket" "cryptography" "yara" "angr")
	for i in "${list_code[@]}"
	do 
	if python -c "import $i" >& /dev/null; then
		echo -e "$i -->" "\033[32m This library already exists\033[0m"
	else
		echo -e "$i -->" "\033[31m This library doesn't exist\033[0m"
		echo -e "\033[32m {+} Install $i \033[0m"
		pip install $i
	fi
	done
}



############## Main ##############
function main() {
	if root ; then
		echo -e "\033[31m {+} You should run this script with root privileges\033[0m"
		echo -e "\033[31m {+} Try this command $0 \033[0m"
		echo -e "\033[32m {+} sudo bash $0 \033[0m"
	else
		programming
		bruteforce
		forensic
		reverse
		stegano
		update
		# Python
		echo -e "\033[34m      Python Libraies\033[0m"
		list_code=("pwn" "bs4" "sys" "requests" "urllib3" "impacket" "cryptography" "yara" "angr")
		#echo -e "\033[31m This libraries are useful for solving challenges\033[0m"
		for i in "${list_code[@]}"; do echo -ne "\033[32m  $i \033[0m"; done;
		echo
		echo
		
		# Brute Force
		echo -e "\033[34m      Brute Force Aattacks\033[0m"
		list_brute=("crunch" "john" "hashcat" "hydra" "cewl")
		#echo -e "\033[31m This libraries are useful for solving challenges\033[0m"
		for i in "${list_brute[@]}"; do echo -ne "\033[32m  $i \033[0m"; done;
		echo
		echo

		# Forensic
		echo -e "\033[34m      Forensics\033[0m"
		list_forensics=("aircrack-ng" "audacity" "samdump2" "creddump7" "exiftool" "extundelete" "foremost" "pngcheck" "usbrip" "wireshark")
		#echo -e "\033[31m This tools are useful for solving forensics challenges\033[0m"
		for i in "${list_forensics[@]}"; do echo -ne "\033[32m  $i \033[0m"; done;
		echo
		echo
		
		# Reverse Engeneering
		echo -e "\033[34m      Reverse Engeneering\033[0m"
		list_reverse=("binwalk" "strings" "ghidra" "apktool" "radare2" "jadx" "javasnoop" "edb-debugger")
		#echo -e "\033[31m This tools are useful for solving reverse challenges\033[0m"
		for i in "${list_reverse[@]}"; do echo -ne "\033[32m  $i \033[0m"; done;
		echo
		echo
		
		# Stegano
		echo -e "\033[34m      Steganography\033[0m"
		list_stegano=("convert" "exif" "exiftool" "exiv2" "outguess" "steghide" "stegcracker" "zsteg")
		#echo -e "\033[31m This tools are useful for solving steganography challenges\033[0m"
		for i in "${list_stegano[@]}"; do echo -ne "\033[32m  $i \033[0m"; done;
		
	fi
}

main
