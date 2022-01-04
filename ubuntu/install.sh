#!/bin/bash

EVDEV=/usr/share/X11/xkb/rules/evdev.xml
XKBFILE=/usr/share/X11/xkb/symbols/br
LAYOUTFILE=./nativo-prog
LAYOUTEVDEV=./evdev
layoutName="nativo-prog"


BKPEVDEV=./backup/evdev.xml
BKPXKB=./backup/br

case $1 in
	--install)
		echo "install"
		;;
	--restore)
		echo "restore"

		# check if the backup exists.
		if ! test -e $BKPEVDEV; then
			echo "The $BKPEVDEV not exists!"
			exit 1
		elif ! test -e $BKPXKB; then
			echo "The $BKPXKB not exists!"
			exit 1
		fi

		cp $BKPEVDEV $EVDEV
		cp $BKPXKB $XKBFILE
		exit 0
		;;
	*)
		echo "unknow command"
		exit 1
		;;
esac

# check if the files exists in the system.
if ! test -e $EVDEV; then
	echo "The $EVDEV not exists!"
	exit 1
elif ! test -e $XKBFILE; then
	echo "The $XKBFILE not exists!"
	exit 1
fi

installCheck=$(grep -R $layoutName $XKBFILE $EVDEV)

if [ -n "$installCheck" ]
then
	echo "The layout $layoutName exists in files"
	exit 2
fi

# Backup the original files.
! test -d backup && mkdir backup
cp $EVDEV backup
cp $XKBFILE backup

# append the nativo keyboard in the end of the file
cat $LAYOUTFILE >> $XKBFILE

# append the evdev of nativo-prog to evdev.xml
flag=0
IFS=''

if test -e .temp ; then
	rm .temp
fi

while read data
do
	echo "$data" >> .temp
	if [ $flag = 0 ] && [[ "$data" =~ "<name>nativo</name>" ]]
	then
		flag=1
	fi
	if [ $flag = 1 ] && [[ "$data" =~ "</variant>" ]]
	then
		flag=-1
		cat $LAYOUTEVDEV >> .temp
	fi
done < $EVDEV
cp .temp $EVDEV
rm .temp


