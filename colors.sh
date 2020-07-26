#!/bin/bash
(x=`tput op` y=`printf %76s`;for i in {0..256};do o=00$i;echo -e ${o:${#o}-3:3} `tput setaf $i;tput setab $i`${y// /=}$x;done)

for C in {0..255}; do     tput setab $C;     echo -n "$C "; done

for ((x=0; x<=255; x++));do echo -e "${x}:\033[48;5;${x}mcolor\033[000m";done

for ((x=0; x<=255; x++));do echo -e "${x}:\033[38;5;${x}mcolor\033[000m";done
