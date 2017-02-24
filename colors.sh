#!/bin/bash

# solarized ansicolors (exporting for grins)
export base03='\033[0;30;40m'
export base02='\033[1;30;40m'
export base01='\033[0;32;40m'
export base00='\033[0;33;40m'
export base0='\033[0;34;40m'
export base1='\033[0;36;40m'
export base2='\033[0;37;40m'
export base3='\033[1;37;40m'
export yellow='\033[1;33;40m'
export orange='\033[0;31;40m'
export red='\033[1;31;40m'
export magenta='\033[1;35;40m'
export violet='\033[0;35;40m'
export blue='\033[1;34;40m'
export cyan='\033[1;36;40m'
export green='\033[1;32;40m'
export reset='\033[0m'

colors () {
  echo -e "base03  ${base03}Test$reset"
  echo -e "base02  ${base02}Test$reset"
  echo -e "base01  ${base01}Test$reset"
  echo -e "base00  ${base00}Test$reset"
  echo -e "base0   ${base0}Test$reset"
  echo -e "base1   ${base1}Test$reset"
  echo -e "base2   ${base2}Test$reset"
  echo -e "base3   ${base3}Test$reset"
  echo -e "yellow  ${yellow}Test$reset"
  echo -e "orange  ${orange}Test$reset"
  echo -e "red     ${red}Test$reset"
  echo -e "magenta ${magenta}Test$reset"
  echo -e "violet  ${violet}Test$reset"
  echo -e "blue    ${blue}Test$reset"
  echo -e "cyan    ${cyan}Test$reset"
  echo -e "green   ${green}Test$reset"
}

colors
