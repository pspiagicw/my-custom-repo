#!/bin/bash

GREEN='\033[0;32m'
RED='\033[1;31m'
NC='\033[0m'

VERSION="0.0.1"

welcome() {
    cat <<EOF


   ▄█   ▄█▄    ▄████████  ▄█    █▄     ▄████████  ▄████████    ▄█    █▄    
  ███ ▄███▀   ███    ███ ███    ███   ███    ███ ███    ███   ███    ███   
  ███▐██▀     ███    ███ ███    ███   ███    ███ ███    █▀    ███    ███   
 ▄█████▀      ███    ███ ███    ███   ███    ███ ███         ▄███▄▄▄▄███▄▄ 
▀▀█████▄    ▀███████████ ███    ███ ▀███████████ ███        ▀▀███▀▀▀▀███▀  
  ███▐██▄     ███    ███ ███    ███   ███    ███ ███    █▄    ███    ███   
  ███ ▀███▄   ███    ███ ███    ███   ███    ███ ███    ███   ███    ███   
  ███   ▀█▀   ███    █▀   ▀██████▀    ███    █▀  ████████▀    ███    █▀    
  ▀                                                                        

EOF
    echo "Welcome to Kavach ISO Generator"
    echo "Version ${VERSION}"
    echo "This will drop you into a docker environment of archlinux , where you can build the ISO manually."
    echo -e "${GREEN} [*] Checking if your system satisfies the dependencies.${NC}"
}

checkdocker() {
    if ! command -v docker &> /dev/null
    then
        echo -e "${RED} [!] You don't have docker installed.${NC}"
        echo -e "${RED} [!] You need docker installed on non-archlinux systems.${NC}"
        echo -e "${GREEN} [*] More information at https://github.com/pspiagicw/kavach"
        exit
    else
        echo -e "${GREEN} [^_^] Docker installation found!. ${NC}"
    fi
    
    
}
rundocker() {
    echo -e "${GREEN} [*] Running a interactive docker image. ${NC}"
    echo -e "${GREEN} [*] 'archiso' and other dependencies will NOT BE INSTALLED. ${NC}"

    docker run -it --privileged -v $(pwd):/mnt -w /mnt archlinux  /bin/bash
}
main() {
    welcome
    sleep 0.5
    checkdocker
    sleep 0.5
    rundocker
}
main
