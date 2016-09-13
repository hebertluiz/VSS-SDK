#!/bin/bash

DISTRO=`lsb_release -si`
RELEASE=`lsb_release -sr`
ARCHITECTURE=`uname -m`

WHITE=$(tput setaf 15)
RED=$(tput setaf 9)
YELLOW=$(tput setaf 11)
GREEN=$(tput setaf 2)
PURPLE=$(tput setaf 5)
BLUE=$(tput setaf 12)
BOLD=$(tput bold)
NORMAL=$(tput sgr0)
INSTALLED=0
BASE_PATH=$(pwd)
QMAKE_QT5_PATH=$(which qmake-qt5)


# PRINT THE MAIN MESSAGE
MAIN_MESSAGE () {
    echo "${WHITE}${BOLD}--------------------------------------------------------------------------";
    echo " Installing IEEE Very Small Size [Soccer] Suite Development Kit (VSS-SDK) ";
    echo "--------------------------------------------------------------------------${NORMAL}";

    echo " ${RED} If any error occur, ${BOLD}PLEASE${NORMAL}${RED}, create a ${BOLD}ISSUE${NORMAL}${RED} on our ${BOLD}GITHUB${NORMAL}${RED} repository";
    echo " ${WHITE}${BOLD} https://github.com/SIRLab/VSS-SDK/issues ${NORMAL}${RED}and tell us. We'll fix soon.";
    echo ""; 
}

# PRINT THE INFO MESSAGE
INFO_MESSAGE () {
    echo "${YELLOW}${BOLD}Linux information:${NORMAL}";
    echo " ${YELLOW}  Distro: " $DISTRO;
    echo " ${YELLOW}  Release: " $RELEASE;
    echo " ${YELLOW}  Architecture: " $ARCHITECTURE;
    echo "${WHITE}"
    sleep 5;
}

INSTALL_OPENCV () {
	if [[ -d $CURRENT_PATH"opencv" ]]; then
	    INSTALLED=1
	else
	    echo " ";
	    echo "${BLUE}${BOLD}Install from Github: OpenCV${WHITE}${NORMAL} (Library of real-time computer vision)";
	    echo " ";
	    sleep 3;
	    git clone https://github.com/Itseez/opencv.git
	    cd opencv
	    mkdir build && cd build
	    cmake ..
	    make -j8
	    sudo make install
	    sudo ldconfig
	    cd $CURRENT_PATH 
	    echo " ";
		INSTALLED=1
	fi

}

INSTALL_UBUNTU_16_04 () {
    echo " ";
    echo "${BLUE}${BOLD}Apt-Get Update & Upgrade ${WHITE}${NORMAL} (Update and upgrade all packets)"
    echo " ";
    sleep 3;
    sudo apt-get update && apt-get upgrade

    echo " ";
    echo "${BLUE}${BOLD}Apt-Get Install: Pkg-Config ${WHITE}${NORMAL} (Helper tool used when compiling applications and libraries)"
    echo " ";
    sleep 3;
    sudo apt-get install pkg-config

    echo " ";
    echo "${BLUE}${BOLD}Apt-Get Install:${WHITE}${NORMAL}";
    echo " ${BLUE}  g++ ${WHITE}(C++ compiler)";
    echo " ${BLUE}  cmake ${WHITE}(Tool to build, test and package software)";
    echo " ${BLUE}  git ${WHITE}(Distributed version control of software)";
    echo " ${BLUE}  uvcdynctrl ${WHITE}(Dynamic control of webcams)";
    echo " ${BLUE}  libzmqpp3 libzmqpp-dev ${WHITE}(Library which implements socket interfaces)";
    echo " ${BLUE}  protobuf-compiler libprotobuf-dev ${WHITE}(Mechanism for serializing structured data)";
    echo " ${BLUE}  qt5-qmake qtbase5-dev qtdeclarative5-dev libqt5webkit5-dev ${WHITE}(Framework for applications and user interfaces)";
    echo " ${BLUE}  libsqlite3-dev ${WHITE}(Embeddable, zero-configuration SQL database engine)"
    echo " ${BLUE}  doxygen graphviz graphviz-dev ${WHITE}(Generator of documentation and graphs)"
    echo " ${BLUE}  libboost-all-dev ${WHITE}(Peer-reviewed portable C++ source libraries)"
    echo " ${BLUE}  freeglut3 freeglut3-dev ${WHITE}(OpenGL Utility Toolkit (GLUT) library)"
    echo " ${BLUE}  libbullet-dev ${WHITE}(Physics Library)"
    echo " ";
    sleep 5;
    sudo apt-get install g++ cmake git uvcdynctrl libzmqpp3 libzmqpp-dev protobuf-compiler libprotobuf-dev qt5-qmake qtbase5-dev qtdeclarative5-dev libqt5webkit5-dev libsqlite3-dev doxygen graphviz graphviz-dev libboost-all-dev freeglut3 freeglut3-dev libbullet-dev

    INSTALL_OPENCV;
}

INSTALL_UBUNTU_14_04 () {
    echo " ";
    echo "${BLUE}${BOLD}Apt-Get Update & Upgrade ${WHITE}${NORMAL} (Update and upgrade all packets)"
    echo " ";
    sleep 3;
    sudo apt-get update && apt-get upgrade

    echo " ";
    echo "${BLUE}${BOLD}Apt-Get Install: Pkg-Config ${WHITE}${NORMAL} (Helper tool used when compiling applications and libraries)"
    echo " ";
    sleep 3;
    sudo apt-get install pkg-config

    echo " ";
    echo "${BLUE}${BOLD}Apt-Get Install:${WHITE}${NORMAL}";
    echo " ${BLUE}  g++ ${WHITE}(C++ compiler)";
    echo " ${BLUE}  cmake ${WHITE}(Tool to build, test and package software)";
    echo " ${BLUE}  git ${WHITE}(Distributed version control of software)";
    echo " ${BLUE}  uvcdynctrl ${WHITE}(Dynamic control of webcams)";
    echo " ${BLUE}  libzmq3 libzmq3-dev ${WHITE}(Library which implements socket interfaces)";
    echo " ${BLUE}  protobuf-compiler libprotobuf-dev ${WHITE}(Mechanism for serializing structured data)";
    echo " ${BLUE}  qt5-qmake qtbase5-dev qtdeclarative5-dev libqt5webkit5-dev ${WHITE}(Framework for applications and user interfaces)";
    echo " ${BLUE}  libsqlite3-dev ${WHITE}(Embeddable, zero-configuration SQL database engine)"
    echo " ${BLUE}  doxygen graphviz graphviz graphviz-dev ${WHITE}(Generator of documentation and graphs)"
    echo " ${BLUE}  libboost-all-dev ${WHITE}(Peer-reviewed portable C++ source libraries)"
    echo " ${BLUE}  freeglut3 freeglut3-dev ${WHITE}(OpenGL Utility Toolkit (GLUT) library)"
    echo " ${BLUE}  libbullet-dev ${WHITE}(Physics Library)"
    echo " ";
    sleep 5;
    sudo apt-get install g++ cmake git uvcdynctrl libzmq3 libzmq3-dev protobuf-compiler libprotobuf-dev qt5-qmake qtbase5-dev qtdeclarative5-dev libqt5webkit5-dev libsqlite3-dev doxygen graphviz graphviz graphviz-dev libboost-all-dev freeglut3 freeglut3-dev libbullet-dev

    INSTALL_OPENCV;
}

INSTALL_DEBIAN_8_2 () {
    echo " ";
    echo "${BLUE}${BOLD}Apt-Get Update & Upgrade ${WHITE}${NORMAL} (Update and upgrade all packets)"
    echo " ";
    sleep 3;
    sudo apt-get update && apt-get upgrade

    echo " ";
    echo "${BLUE}${BOLD}Apt-Get Install: Pkg-Config ${WHITE}${NORMAL} (Helper tool used when compiling applications and libraries)"
    echo " ";
    sleep 3;
    sudo apt-get install pkgconf

    echo " ";
    echo "${BLUE}${BOLD}Apt-Get Install:${WHITE}${NORMAL}";
    echo " ${BLUE}  g++ ${WHITE}(C++ compiler)";
    echo " ${BLUE}  cmake ${WHITE}(Tool to build, test and package software)";
    echo " ${BLUE}  git ${WHITE}(Distributed version control of software)";
    echo " ${BLUE}  uvcdynctrl ${WHITE}(Dynamic control of webcams)";
    echo " ${BLUE}  libzmq3 libzmq3-dev ${WHITE}(Library which implements socket interfaces)";
    echo " ${BLUE}  protobuf-compiler libprotobuf-dev ${WHITE}(Mechanism for serializing structured data)";
    echo " ${BLUE}  qt5-default qtbase5-dev qtdeclarative5-dev libqt5webkit5-dev ${WHITE}(Framework for applications and user interfaces)";
    echo " ${BLUE}  libsqlite3-dev ${WHITE}(Embeddable, zero-configuration SQL database engine)"
    echo " ${BLUE}  doxygen graphviz graphviz graphviz-dev ${WHITE}(Generator of documentation and graphs)"
    echo " ${BLUE}  libboost-all-dev ${WHITE}(Peer-reviewed portable C++ source libraries)"
    echo " ${BLUE}  freeglut3 freeglut3-dev ${WHITE}(OpenGL Utility Toolkit (GLUT) library)"
    echo " ${BLUE}  libbullet-dev ${WHITE}(Physics Library)"
    echo " ";
    sleep 5;
    sudo apt-get install g++ cmake git uvcdynctrl libzmq3 libzmq3-dev protobuf-compiler libprotobuf-dev qt5-default qtbase5-dev qtdeclarative5-dev libqt5webkit5-dev libsqlite3-dev doxygen graphviz graphviz graphviz-dev libboost-all-dev freeglut3 freeglut3-dev libbullet-dev

    INSTALL_OPENCV;
}

INSTALL_DEBIAN_8_5 () {
    echo " ";
    echo "${BLUE}${BOLD}Apt-Get Update & Upgrade ${WHITE}${NORMAL} (Update and upgrade all packets)"
    echo " ";
    sleep 3;
    sudo apt-get update && apt-get upgrade

    echo " ";
    echo "${BLUE}${BOLD}Apt-Get Install: Pkg-Config ${WHITE}${NORMAL} (Helper tool used when compiling applications and libraries)"
    echo " ";
    sleep 3;
    sudo apt-get install pkgconf

    echo " ";
    echo "${BLUE}${BOLD}Apt-Get Install:${WHITE}${NORMAL}";
    echo " ${BLUE}  g++ ${WHITE}(C++ compiler)";
    echo " ${BLUE}  cmake ${WHITE}(Tool to build, test and package software)";
    echo " ${BLUE}  git ${WHITE}(Distributed version control of software)";
    echo " ${BLUE}  uvcdynctrl ${WHITE}(Dynamic control of webcams)";
    echo " ${BLUE}  libzmq3 libzmq3-dev ${WHITE}(Library which implements socket interfaces)";
    echo " ${BLUE}  protobuf-compiler libprotobuf-dev ${WHITE}(Mechanism for serializing structured data)";
    echo " ${BLUE}  qt5-default qtbase5-dev qtdeclarative5-dev libqt5webkit5-dev ${WHITE}(Framework for applications and user interfaces)";
    echo " ${BLUE}  libsqlite3-dev ${WHITE}(Embeddable, zero-configuration SQL database engine)"
    echo " ${BLUE}  doxygen graphviz graphviz graphviz-dev ${WHITE}(Generator of documentation and graphs)"
    echo " ${BLUE}  libboost-all-dev ${WHITE}(Peer-reviewed portable C++ source libraries)"
    echo " ${BLUE}  freeglut3 freeglut3-dev ${WHITE}(OpenGL Utility Toolkit (GLUT) library)"
    echo " ${BLUE}  libbullet-dev ${WHITE}(Physics Library)"
    echo " ";
    sleep 5;
    sudo apt-get install g++ cmake git uvcdynctrl libzmq3 libzmq3-dev protobuf-compiler libprotobuf-dev qt5-default qtbase5-dev qtdeclarative5-dev libqt5webkit5-dev libsqlite3-dev doxygen graphviz graphviz graphviz-dev libboost-all-dev freeglut3 freeglut3-dev libbullet-dev

    INSTALL_OPENCV;
}

INSTALL_FEDORA_2X () {
   
    echo " ";
    echo "${BLUE}${BOLD}DNF Install:${WHITE}${NORMAL}";
    echo " ${BLUE}  g++ ${WHITE}(C++ compiler)";
    echo " ${BLUE}  cmake ${WHITE}(Tool to build, test and package software)";
    echo " ${BLUE}  git ${WHITE}(Distributed version control of software)";
    echo " ${BLUE}  uvcdynctrl ${WHITE}(Dynamic control of webcams)";
    echo " ${BLUE}  czmq cppzmq-devel ${WHITE}(Library which implements socket interfaces)";
    echo " ${BLUE}  protobuf libprotobuf-dev ${WHITE}(Mechanism for serializing structured data)";
    echo " ${BLUE}  qt5-qtbase qt5-qtbase5-devel qt5-qtdeclarative-devel qt5-qtwebkit-devel ${WHITE}(Framework for applications and user interfaces)";
    echo " ${BLUE}  sqlite-devel ${WHITE}(Embeddable, zero-configuration SQL database engine)"
    echo " ${BLUE}  doxygen graphviz graphviz graphviz-devel ${WHITE}(Generator of documentation and graphs)"
    echo " ${BLUE}  boost-devel ${WHITE}(Peer-reviewed portable C++ source libraries)"
    echo " ${BLUE}  freeglut freeglut-devel ${WHITE}(OpenGL Utility Toolkit (GLUT) library)"
    echo " ${BLUE}  bullet-devel ${WHITE}(Physics Library)"
    echo " ${BLUE}  opencv opencv-devel ${WHITE}(Library of real-time computer vision)" 
    echo " ";
    sleep 5;

    sudo dnf install gcc-c++ cmake qconf git uvcdynctrl \
    czmq cppzmq-devel protobuf protobuf-devel qt5-qtbase \
    qt5-qtbase-devel qt5-qtdeclarative-devel qt5-qtwebkit-devel \
    sqlite-devel  doxygen  graphviz graphviz-devel boost-devel \
    freeglut freeglut-devel bullet-devel opencv opencv-devel

    INSTALL_OPENCV;
}


INSTALL () {
    if [[ "$DISTRO" == "Ubuntu" ]]; then
        if [[ "$RELEASE" == "16.04" ]]; then
            INSTALL_UBUNTU_16_04;
        elif [[ "$RELEASE" == "14.04" ]]; then
            INSTALL_UBUNTU_14_04;
        else
            echo "${RED}${BOLD}Ubuntu Unknown";
        fi    
    elif [[ "$DISTRO" == "Debian" ]]; then
        if [[ "$RELEASE" == "8.5" ]]; then
            INSTALL_DEBIAN_8_5;
        elif [[ "$RELEASE" == "8.2" ]]; then
            INSTALL_DEBIAN_8_2;
        else
            echo "${RED}${BOLD}Debian Unknown";
        fi
    elif [[ "$DISTRO" == "Fedora" ]]; then
    	if [[ "$RELEASE" == "24" ]]; then
    		INSTALL_FEDORA_2X;
    	elif [[ "$RELEASE" == "23" ]]; then
            INSTALL_FEDORA_2X;
        else
            echo "${RED}${BOLD}Fedora Unknown";
        fi            
else
        echo "${RED}${BOLD}Linux Unknown";
    fi
    
}


MAIN_MESSAGE;

INFO_MESSAGE;

INSTALL;

if [ $INSTALLED == 1 ]; then
    cd "$BASE_PATH"
    ./init.sh

    # Criando Link para o binario do qmake caso não exista
    if [[ "$DISTRO" == "Fedora" ]] && [ -x /usr/lib64/qt5/bin/qmake ] then
    	echo ""
        sed -i 's;/usr/lib/86_64-linux-gnu/qt5/;/usr/lib64/qt5/;' "$BASE_PATH"/VSS-Vision/src/Makefile
        echo "";
    else
        echo "${RED} Erro ao localizar o ${WHITE}qmake${RED}, Instale usando o binario abaixo."
        echo "${WHITE} http://download.qt.io/official_releases/qt/5.6/5.6.1-1/qt-opensource-linux-x64-5.6.1-1.run"
    fi

    ./update.sh
else
     echo "${NORMAL}${RED}Exiting ...${WHITE}";
fi 




