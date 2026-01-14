#!/bin/sh

echo 'Assembling...'

tools/asm6f smb2.asm -n -c -L bin/smb2.nes bin/smb2.lst "$@" > bin/assembler.log

if [ $? -ne 0 ] ; then
	echo 'Build failed!'
	exit 1
fi

echo 'Build succeeded.'

cmd.exe /c start C:/Users/davet/Desktop/Mesen.exe //wsl.localhost/Ubuntu/home/dave/Super_Mario_Bros_-2/bin/smb2.nes > /dev/null 2>&1
