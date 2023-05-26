#!/bin/bash

dirname=OOP345
copydirname=copyOOP345

cd /home/slee550/$dirname
echo $(pwd)
git pull origin main
echo "git pull ${dirname}" 
cd ..
echo $(pwd)

if [ -e $copydirname ]; then
	echo "Do you want to delete ${copydirname}? y:yes"
	read answer
	if [ $answer == y ]; then
		rm -rf $copydirname
		echo "Dir ${copydirname} deleted."
	else
		echo Enter week number ex:WS01
		read week
		echo Enter project name ex:w1p1
		read prgname
		cd /home/slee550/$copydirname/$week/$prgname
		echo Enter part name ex:w2_p2
		read partname
		~hong.huang/submit 345_$partname
	fi
else
	echo "Dir ${copydirname} does not exist. Create it."
	cp -r "$dirname" $copydirname
	echo "Dir ${copydirname} is copied."
	echo Enter week number ex:WS01
	read week
	echo Enter project name ex:w1p1
	read prgname
	cd /home/slee550/$copydirname/$week/$prgname
	echo "Your location is: $(pwd)"
        /usr/local/gcc/10.2.0/bin/g++ -Wall -std=c++17 -g -o ws "$@"
	echo "Compile success"
fi
	
