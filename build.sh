#!/bin/sh
# Modified script from the smb2 disassembly https://github.com/Xkeeper0/smb2
# Last modification: 2025-04-22 Producks

# Compilation flag
PROTO_MUSIC="-dPROTOTYPE_DPCM_SAMPLES -dPROTOTYPE_INSTRUMENTS -dPROTOTYPE_MUSIC_STARMAN -dPROTOTYPE_MUSIC_UNDERGROUND -dPROTOTYPE_MUSIC_ENDING"

build() {
  echo 'Assembling...'
	tools/asm6f smb2.asm -m -n -c -L bin/smb2.nes "$@" > bin/assembler.log
}

error () {
	echo 'Build failed!'
	exit 1
}

if [ $# -eq 0 ]; then
	echo '[0] Vanilla music + Merio & Garfield'
	echo '[1] Prototype music + Merio & Garfield'
	read -p 'Enter a number to select a version: ' input
else
  input="$1"
fi

case $input in
	"0")
	build
	;;
	"1")
	build $PROTO_MUSIC
	;;
	*)
  if [ $# -eq 0 ]; then
    error
  else 
    echo Custom flags compilation
    build $@
  fi
esac

if [ $? -ne 0 ] ; then # Check if any error happened during the building process
  error
fi

echo 'Build succeeded.'
