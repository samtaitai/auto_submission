#!/bin/bash

dirname=OOP345
copydirname=copyOOP345

cd /home/slee550/$dirname
echo $(pwd)
git pull origin main
echo "git pull ${dirname}" 
cd ..
echo $(pwd)

echo "Which week do you work on? ex:WS01"
read week

if [ -e $copydirname/$week ]; then
	echo "Do you want to delete and recopy ${week} dir?"
	read answer
	if [ $answer == y ]; then
		rm -rf $copydirname/$week
		cp -r /home/slee550/$copydirname/$week $copydirname
		echo "${copydirname}/${week} copied."
	else
		echo Ready to submit
		echo Enter project name ex:w1p1
		read prgname
		cd /home/slee550/$copydirname/$week/$prgname
		echo Enter part name ex:w2_p2
		read partname
		~hong.huang/submit 345_$partname
	fi
else
	echo "Dir ${copydirname}/${week} does not exist. Create it."
	cp -r "$dirname/$week" $copydirname
	echo "Dir ${copydirname}/${week} is copied."
	echo Enter project name ex:w1p1
	read prgname
	cd /home/slee550/$copydirname/$week/$prgname
	echo "Your location is: $(pwd)"
        /usr/local/gcc/10.2.0/bin/g++ -Wall -std=c++17 -g -o ws "$@"
	echo "Compile success"
fi
	
