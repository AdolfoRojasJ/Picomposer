#!/bin/bash

#RESOURCES
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_FILE=~/resources/config.txt
DESKTOP_DIR=$(xdg-user-dir DESKTOP)
VERSION="Picomposer.sh"
DEFAULT_CODE="#include \"pico/stdlib.h\"\n#define LEDPIN 0\n\nvoid led_init(void)\n{\n    gpio_init(LEDPIN);\n    gpio_set_dir(LEDPIN, GPIO_OUT);\n}\n\nint main()\n{\n    led_init();\n    while(1)\n    {\n        gpio_put(LEDPIN, 1);\n        sleep_ms(500);\n        gpio_put(LEDPIN, 0);\n        sleep_ms(500);\n    }\n}"
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
RESET=$(tput sgr0)
PURPLE=$(tput setaf 125)
CYAN=$(tput setaf 6)
BOLD=$(tput bold)
NORMAL=$(tput sgr0)

#LANG_TEXTS
#ENGLISH
EXIT_MESSAGE_ENG="Press Ctrl+C to Exit\n"
MAIN_MENU_ENG="Choose an option:\n1) Installation \n2) Project \n3) Serial Terminal \n4) Settings"
INSTALLATION_MENU_ENG="Choose an option:\n1) PC Installation \n2) PI Installation"
PROJECT_MENU_ENG="Choose an option:\n1) New Project \n2) New FreeRTOS Project \n3) Open Project \n4) Build Projects \n5) Upload Projects \n6) Import Projects \n7) Delete Project" 
GENERAL_SELECTION_ENG="You've Selected:"
BAD_SELECTION_ENG="Invalid selection, Try Again"
LIBRARIES_SELECTION_ENG="Libraries:"
LIBRARIES_INSTRUCTION_ENG="Type the libraries that you need for your project, separated by commas: "
SERIAL_COM_SELECTION_ENG="Would you like to activate the Serial Communication?\n1) YES \n2) NO"
PROJECTS_LIST_ENG="Available Projects:\n"
OPEN_PROJECT_INSTRUCTION_ENG="Type the project number that you want to open:"
UPLOAD_PROJECT_INSTRUCTION_ENG="Type the project number that you want to upload:"
UF2_EXIST_ENG=".uf2 file located: "
UF2_DOESNT_EXIST_ENG=".uf2 file doesn't exist"
IMPORT_PROJECT_INSTRUCTION_ENG="Type the project number that you want to import:"
DELETE_PROJECT_INSTRUCTION_ENG="Type the project number that you want to delete:"
SETTINGS_MENU_ENG="Choose an option:\n1) Text Editor \n2) Language" 
TEXT_SETTINGS_MENU_ENG="Choose an option:\n1) Vim \n2) Nano \n3) gedit " 
LANGUAGE_SETTINGS_MENU_ENG="Choose an option:\n1) English \n2) Spanish " 
RETURN_ENG="Press 0 to return\n" 
C_EXIST_ENG=".c file located: "
C_DOESNT_EXIST_ENG=".c file doesn't exist"

#SPANISH
EXIT_MESSAGE_ESP="Presiona Ctrl+C para salir\n"
MAIN_MENU_ESP="Elige una opción:\n1) Instalación \n2) Proyecto \n3) Terminal Serie \n4) Ajustes"
INSTALLATION_MENU_ESP="Elige una opción:\n1) Instalación PC \n2) Instalación PI" 
PROJECT_MENU_ESP="Elige una opción:\n1) Nuevo Proyecto \n2) Nuevo Proyecto(FreeRTOS) \n3) Abrir Proyecto \n4) Compilar Proyectos \n5) Cargar Proyectos \n6) Importar Proyectos \n7) Eliminar Proyectos" 
GENERAL_SELECTION_ESP="Has seleccionado:"
BAD_SELECTION_ESP="Seleccion Invalida. Por favor, intenta nuevamente."
LIBRARIES_SELECTION_ESP="Bibliotecas:"
LIBRARIES_INSTRUCTION_ESP="Introduce las bibliotecas que desees utilizar separados por comas: "
SERIAL_COM_SELECTION_ESP="¿Deseas Habilitar la comunicación en serie?\n1) SI \n2) NO"
PROJECTS_LIST_ESP="Lista de Proyectos:\n"
OPEN_PROJECT_INSTRUCTION_ESP="Ingresa el numero de proyecto que deseas abrir:"
UPLOAD_PROJECT_INSTRUCTION_ESP="Ingresa el numero de proyecto que deseas cargar:"
UF2_EXIST_ESP="Archivo .uf2 encontrado: "
UF2_DOESNT_EXIST_ESP="El Archivo.uf2 no existe"
IMPORT_PROJECT_INSTRUCTION_ESP="Ingresa el numero de proyecto que deseas importar:"
DELETE_PROJECT_INSTRUCTION_ESP="Ingresa el numero de proyecto que deseas eliminar:"
SETTINGS_MENU_ESP="Elige una opción:\n1) Editor de Texto \n2) Idioma" 
TEXT_SETTINGS_MENU_ESP="Elige una opción:\n1) Vim \n2) Nano \n3) Editor de Textos"
LANGUAGE_SETTINGS_MENU_ESP="Elige una opción:\n1) Ingles \n2) Español " 
RETURN_ESP="Presiona 0 para regresar\n" 
C_EXIST_ENG="Archivo .c encontrado: "
C_DOESNT_EXIST_ENG="Archivo .c no existe"

if [ -f $DESKTOP_DIR/picomposer.desktop ]; then
	LANGUAGE=$(sed -n '2p' "$CONFIG_FILE")
else	
	LANGUAGE="English"
fi
#echo "$LANGUAGE"
if [[ "$LANGUAGE" == "Spanish" ]]; then
	export M1=$EXIT_MESSAGE_ESP M2=$MAIN_MENU_ESP M3=$INSTALLATION_MENU_ESP M4=$PROJECT_MENU_ESP M5=$GENERAL_SELECTION_ESP M6=$BAD_SELECTION_ESP M7=$LIBRARIES_SELECTION_ESP M8=$LIBRARIES_INSTRUCTION_ESP M9=$SERIAL_COM_SELECTION_ESP M10=$PROJECTS_LIST_ESP M11=$OPEN_PROJECT_INSTRUCTION_ESP M12=$UPLOAD_PROJECT_INSTRUCTION_ESP  M13=$UF2_EXIST_ESP M14=$UF2_DOESNT_EXIST_ESP M15=$IMPORT_PROJECT_INSTRUCTION_ESP M16=$DELETE_PROJECT_INSTRUCTION_ESP M17=$SETTINGS_MENU_ESP M18=$TEXT_SETTINGS_MENU_ESP M19=$LANGUAGE_SETTINGS_MENU_ESP M20=$RETURN_ESP M21=$C_EXIST_ESP M22=$C_DOESNT_EXIST_ESP
elif [[ "$LANGUAGE" == "English" ]]; then
	export M1=$EXIT_MESSAGE_ENG M2=$MAIN_MENU_ENG M3=$INSTALLATION_MENU_ENG M4=$PROJECT_MENU_ENG M5=$GENERAL_SELECTION_ENG M6=$BAD_SELECTION_ENG M7=$LIBRARIES_SELECTION_ENG M8=$LIBRARIES_INSTRUCTION_ENG M9=$SERIAL_COM_SELECTION_ENG M10=$PROJECTS_LIST_ENG M11=$OPEN_PROJECT_INSTRUCTION_ENG M12=$UPLOAD_PROJECT_INSTRUCTION_ENG  M13=$UF2_EXIST_ENG M14=$UF2_DOESNT_EXIST_ENG M15=$IMPORT_PROJECT_INSTRUCTION_ENG M16=$DELETE_PROJECT_INSTRUCTION_ENG M17=$SETTINGS_MENU_ENG M18=$TEXT_SETTINGS_MENU_ENG M19=$LANGUAGE_SETTINGS_MENU_ENG M20=$RETURN_ENG M21=$C_EXIST_ENG M22=$C_DOESNT_EXIST_ENG
fi

#MENU
echo " 
${GREEN}██████╗ ██╗ ██████╗ ██████╗ ███╗   ███╗██████╗  ██████╗ ███████╗███████╗██████╗${RESET}      ${BOLD}${GREEN}.~~.   .~~.${RESET}${NORMAL}
${GREEN}██╔══██╗██║██╔════╝██╔═══██╗████╗ ████║██╔══██╗██╔═══██╗██╔════╝██╔════╝██╔══██╗${RESET}   ${BOLD}${GREEN}'. \ ' ' / .'${RESET}${NORMAL}
${GREEN}██████╔╝██║██║     ██║   ██║██╔████╔██║██████╔╝██║   ██║███████╗█████╗  ██████╔╝${RESET}    ${BOLD}${RED}.~ .~~~..~.${RESET}${NORMAL}
${GREEN}██╔═══╝ ██║██║     ██║   ██║██║╚██╔╝██║██╔═══╝ ██║   ██║╚════██║██╔══╝  ██╔══██╗${RESET}   ${BOLD}${RED}: .~.'~'.~. :${RESET}${NORMAL}
${GREEN}██║     ██║╚██████╗╚██████╔╝██║ ╚═╝ ██║██║     ╚██████╔╝███████║███████╗██║  ██║${RESET}  ${BOLD}${RED}~ (   ) (   ) ~${RESET}${NORMAL}
${GREEN}╚═╝     ╚═╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝      ╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝${RESET} ${BOLD}${RED}( : '~'.~.'~' : )${RESET}${NORMAL}
${RESET}                                                                                ${RESET}  ${BOLD}${RED}~ .~ (   ) ~. ~${RESET}${NORMAL}
${GREEN}██╗   ██╗  ██╗    ██████╗${RESET}                                                          ${BOLD}${RED}(  : '~' :  )${RESET}${NORMAL}
${GREEN}██║   ██║ ███║   ██╔═████╗${RESET}                                                          ${BOLD}${RED}'~ .~~~. ~'${RESET}${NORMAL}
${GREEN}██║   ██║ ╚██║   ██║██╔██║${RESET}                                                              ${BOLD}${RED}'~'${RESET}${NORMAL}
${GREEN}╚██╗ ██╔╝  ██║   ████╔╝██║${RESET}
${GREEN} ╚████╔╝   ██║██╗╚██████╔╝${RESET}
${GREEN}  ╚═══╝    ╚═╝╚═╝ ╚═════╝${RESET}                                                     
"
echo -e "			${BOLD}${CYAN}github.com/AdolfoRojasJ${RESET}${NORMAL} \n"
echo -e "$M1" 
echo -e "$M20" 
echo -e "$M2" 
read main_option
if [ "$main_option" -eq 1 ]; then
	echo -e "$M1"
	echo -e "$M20"  
	echo -e "$M3" 
	read option
	#PC INSTALL
	if [ "$option" -eq 1 ]; then
		mkdir ~/resources
		#DEFAULT CONFIG FILE
		echo -e "vi\nEnglish"> ~/resources/config.txt
		#IMPORT FOLDER
		cd ~/resources
		mkdir Import
		#INSTALL DEPENDENCIES
		sudo apt install git -y
		sudo apt install cmake gcc-arm-none-eabi -y
		sudo apt install build-essential -y
		sudo apt install pkg-config -y
		sudo apt install minicom -y
		sudo apt install gdb-multiarch -y
		sudo apt install automake autoconf texinfo libtool libftdi-dev libusb-1.0-0-dev -y
		sudo apt install gtkterm -y
		sudo apt install cmake -y
		sudo apt install vim -y
		sudo apt install wget -y
		#SHORTCUT
		sudo apt install gnome-terminal -y
		wget -O ~/resources/Picomposer.png https://raw.githubusercontent.com/AdolfoRojasJ/Icon/main/Picomposer.png
		echo -e "[Desktop Entry]\nVersion=1.0\nType=Application\nName=Pi Composer\nExec=gnome-terminal --maximize -- bash -c $SCRIPT_DIR/$VERSION; exec bash\nIcon=$HOME/resources/Picomposer.png\nTerminal=true;" > $DESKTOP_DIR/picomposer.desktop
		chmod a+x $DESKTOP_DIR/picomposer.desktop
		echo -e "[Desktop Entry]\nVersion=1.0\nType=Application\nName=Pi Composer\nExec=gnome-terminal --maximize -- bash -c $SCRIPT_DIR/$VERSION; exec bash\nIcon=$HOME/resources/Picomposer.png\nTerminal=true;" >  ~/.local/share/applications/picomposer.desktop
		chmod a+x ~/.local/share/applications/picomposer.desktop
		#SYSTEM UPDATE/UPGRADE
		sudo apt update -y
		sudo apt upgrade -y
		#PICO-SDK DOWNLOAD
		cd ~/
		mkdir pico
		cd pico
		git clone -b master https://github.com/raspberrypi/pico-sdk
		cd pico-sdk
		git submodule update --init
		git clone -b master https://github.com/raspberrypi/pico-examples
		#FREERTOS
		mkdir freertos-pico
		cd freertos-pico
		git clone -b smp https://github.com/FreeRTOS/FreeRTOS-Kernel --recurse-submodules
		#FIRST BUILD
		export FREERTOS_KERNEL_PATH=~/pico/pico-sdk/freertos-pico/FreeRTOS-Kernel
		export PICO_SDK_PATH=~/pico/pico-sdk
		cd ~/pico/pico-sdk/pico-examples
		mkdir build
		cd build
		cmake .. 
		make 
		#BANNER
		echo "
		
	${PURPLE}██████╗ ███████╗██╗   ██╗███████╗██╗      ██████╗ ██████╗ ███████╗██████╗     ██████╗ ██╗   ██╗${RESET} 
	${PURPLE}██╔══██╗██╔════╝██║   ██║██╔════╝██║     ██╔═══██╗██╔══██╗██╔════╝██╔══██╗    ██╔══██╗╚██╗ ██╔╝${RESET} 
	${PURPLE}██║  ██║█████╗  ██║   ██║█████╗  ██║     ██║   ██║██████╔╝█████╗  ██║  ██║    ██████╔╝ ╚████╔╝${RESET} 
	${PURPLE}██║  ██║██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║     ██║   ██║██╔═══╝ ██╔══╝  ██║  ██║    ██╔══██╗  ╚██╔╝${RESET}   
	${PURPLE}██████╔╝███████╗ ╚████╔╝ ███████╗███████╗╚██████╔╝██║     ███████╗██████╔╝    ██████╔╝   ██║${RESET}    
	${PURPLE}╚═════╝ ╚══════╝  ╚═══╝  ╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚══════╝╚═════╝     ╚═════╝    ╚═╝${RESET}    
																								
	${PURPLE}██╗  ██╗██╗   ██╗███████╗███╗   ██╗ █████╗${RESET}                                                      
	${PURPLE}██║  ██║╚██╗ ██╔╝██╔════╝████╗  ██║██╔══██╗${RESET}                                                     
	${PURPLE}███████║ ╚████╔╝ █████╗  ██╔██╗ ██║███████║${RESET}                                                     
	${PURPLE}██╔══██║  ╚██╔╝  ██╔══╝  ██║╚██╗██║██╔══██║${RESET}                                                     
	${PURPLE}██║  ██║   ██║   ███████╗██║ ╚████║██║  ██║${RESET}                                                     
	${PURPLE}╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═══╝╚═╝  ╚═╝${RESET}  "
		echo "			${BOLD}${CYAN}github.com/AdolfoRojasJ${RESET}${NORMAL} "
		exec "$SCRIPT_DIR/$VERSION"

	#PI INSTALL	
	elif [ "$option" -eq 2 ]; then	
		mkdir ~/resources
		#DEFAULT CONFIG FILE
		echo -e "vi\nEnglish"> ~/resources/config.txt	
		#IMPORT FOLDER
		cd ~/resources
		mkdir Import
		#INSTALL DEPENDENCIES
		sudo apt install git -y
		sudo apt install cmake gcc-arm-none-eabi -y
		sudo apt install build-essential -y
		sudo apt install pkg-config -y
		sudo apt install minicom -y
		sudo apt install gdb-multiarch -y
		sudo apt install automake autoconf texinfo libtool libftdi-dev libusb-1.0-0-dev -y
		sudo apt install gtkterm -y
		sudo apt install cmake -y
		sudo apt install vim -y
		sudo apt install libnewlib-arm-none-eabi -y
		sudo apt install libstdc++-arm-none-eabi-newlib -y
		sudo apt install wget -y
		#SHORTCUT
		sudo apt install gnome-terminal -y
		wget -O ~/resources/Picomposer.png https://raw.githubusercontent.com/AdolfoRojasJ/Icon/main/Picomposer.png
		echo -e "[Desktop Entry]\nVersion=1.0\nType=Application\nName=Pi Composer\nExec=gnome-terminal --maximize -- bash -c $SCRIPT_DIR/$VERSION; exec bash\nIcon=$HOME/resources/Picomposer.png\nTerminal=true;" > $DESKTOP_DIR/picomposer.desktop
		chmod a+x $DESKTOP_DIR/picomposer.desktop
		echo -e "[Desktop Entry]\nVersion=1.0\nType=Application\nName=Pi Composer\nExec=gnome-terminal --maximize -- bash -c $SCRIPT_DIR/$VERSION; exec bash\nIcon=$HOME/resources/Picomposer.png\nTerminal=true;" >  ~/.local/share/applications/picomposer.desktop
		chmod a+x ~/.local/share/applications/picomposer.desktop
		#SYSTEM UPDATE/UPGRADE
		sudo apt update -y
		sudo apt upgrade -y
		#PICO-SDK DOWNLOAD
		cd ~/
		mkdir pico
		cd pico
		git clone -b master https://github.com/raspberrypi/pico-sdk 
		cd pico-sdk
		git submodule update --init
		git clone -b master https://github.com/raspberrypi/pico-examples
		#FREERTOS
		mkdir freertos-pico
		cd freertos-pico
		git clone -b smp https://github.com/FreeRTOS/FreeRTOS-Kernel --recurse-submodules
		#FIRST BUILD
		export FREERTOS_KERNEL_PATH=~/pico/pico-sdk/freertos-pico/FreeRTOS-Kernel
		export PICO_SDK_PATH=~/pico/pico-sdk
		cd ~/pico/pico-sdk/pico-examples
		mkdir build
		cd build
		cmake .. 
		make 
		#BANNER
		echo "
		
	${PURPLE}██████╗ ███████╗██╗   ██╗███████╗██╗      ██████╗ ██████╗ ███████╗██████╗     ██████╗ ██╗   ██╗${RESET} 
	${PURPLE}██╔══██╗██╔════╝██║   ██║██╔════╝██║     ██╔═══██╗██╔══██╗██╔════╝██╔══██╗    ██╔══██╗╚██╗ ██╔╝${RESET} 
	${PURPLE}██║  ██║█████╗  ██║   ██║█████╗  ██║     ██║   ██║██████╔╝█████╗  ██║  ██║    ██████╔╝ ╚████╔╝${RESET} 
	${PURPLE}██║  ██║██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║     ██║   ██║██╔═══╝ ██╔══╝  ██║  ██║    ██╔══██╗  ╚██╔╝${RESET}   
	${PURPLE}██████╔╝███████╗ ╚████╔╝ ███████╗███████╗╚██████╔╝██║     ███████╗██████╔╝    ██████╔╝   ██║${RESET}    
	${PURPLE}╚═════╝ ╚══════╝  ╚═══╝  ╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚══════╝╚═════╝     ╚═════╝    ╚═╝${RESET}    
																								
	${PURPLE}██╗  ██╗██╗   ██╗███████╗███╗   ██╗ █████╗${RESET}                                                      
	${PURPLE}██║  ██║╚██╗ ██╔╝██╔════╝████╗  ██║██╔══██╗${RESET}                                                     
	${PURPLE}███████║ ╚████╔╝ █████╗  ██╔██╗ ██║███████║${RESET}                                                     
	${PURPLE}██╔══██║  ╚██╔╝  ██╔══╝  ██║╚██╗██║██╔══██║${RESET}                                                     
	${PURPLE}██║  ██║   ██║   ███████╗██║ ╚████║██║  ██║${RESET}                                                     
	${PURPLE}╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═══╝╚═╝  ╚═╝${RESET}  "
		echo "			${BOLD}${CYAN}github.com/AdolfoRojasJ${RESET}${NORMAL} "
		exec "$SCRIPT_DIR/$VERSION"

	elif [ "$option" -eq 0 ]; then	
		exec "$SCRIPT_DIR/$VERSION"

	fi

elif [ "$main_option" -eq 2 ]; then
	echo -e "$M1" 
	echo -e "$M20"
	echo -e "$M4" 
	read option
	#NEW PROJECT
	if [ "$option" -eq 0 ]; then
		exec "$SCRIPT_DIR/$VERSION"
	elif [ "$option" -eq 1 ]; then
		#SUPPORTED_LIBRARIES
		declare -A bibliotecas=(
			[0]="pico_stdlib"
			[1]="hardware_adc"
			[2]="hardware_i2c"
		)
		TEXT_EDITOR=$(head -n 1 "$CONFIG_FILE")
		#SELECT MENU
		echo -e "$M7 \n0) PICO STDLIB \n1) ADC \n2) I2C" 
		read -p "$M8" input
		IFS=',' read -r -a seleccionados <<< "$input"
		bibliotecas_seleccionadas=()
		#CONFIRMATION
		echo -e "$M5"
		for numero in "${seleccionados[@]}"; do
				if [[ -n "${bibliotecas[$numero]}" ]]; then
					echo "$numero) ${bibliotecas[$numero]}"
					bibliotecas_seleccionadas+=("${bibliotecas[$numero]}")
				else
					echo "$numero $M6"
					exec "$SCRIPT_DIR/$VERSION"
				fi
		done
		#SERIAL COM
		echo -e "$M9" 
		read serial_opt
		if [ "$serial_opt" -eq 1 ]; then
			SERIAL="1"
		else
			SERIAL="0"
		fi
		#PROJECT CREATION
		echo "Filename: "
		read filename
		mkdir ~/pico/pico-sdk/pico-examples/${filename} 
		echo "add_subdirectory(${filename})" >> ~/pico/pico-sdk/pico-examples/CMakeLists.txt
		cd ~/pico/pico-sdk/pico-examples/${filename}
		touch "${filename}.c"	
		echo "add_executable(${filename} ${filename}.c)">> ~/pico/pico-sdk/pico-examples/${filename}/CMakeLists.txt
		if [ ${#bibliotecas_seleccionadas[@]} -gt 0 ]; then
				line="target_link_libraries(${filename} ${bibliotecas_seleccionadas[*]})"
				echo $line >> ~/pico/pico-sdk/pico-examples/${filename}/CMakeLists.txt
		fi
		echo -e "pico_enable_stdio_uart(${filename} $SERIAL)\npico_enable_stdio_usb(${filename} $SERIAL)\npico_add_extra_outputs(${filename})" >> ~/pico/pico-sdk/pico-examples/${filename}/CMakeLists.txt
		$TEXT_EDITOR "${filename}.c"   
	#FREERTOS PROJECT
	elif [ "$option" -eq 2 ]; then
		TEXT_EDITOR=$(head -n 1 "$CONFIG_FILE")
		#SERIAL COM
		echo -e "$M9" 
		read serial_opt
		if [ "$serial_opt" -eq 1 ]; then
			SERIAL="1"
		else
			SERIAL="0"
		fi
		export FREERTOS_KERNEL_PATH=~/pico/pico-sdk/freertos-pico/FreeRTOS-Kernel
		export PICO_SDK_PATH=~/pico/pico-sdk
		#PROJECT CREATION
		echo "Filename: "
		read filename
		mkdir ~/pico/pico-sdk/pico-examples/${filename} 
		echo "add_subdirectory(${filename})" >> ~/pico/pico-sdk/pico-examples/CMakeLists.txt
		cd ~/pico/pico-sdk/pico-examples/${filename}
		touch "${filename}.c"
		#CMAKELISTS	
		echo -e "cmake_minimum_required(VERSION 3.13)\ninclude(${PICO_SDK_PATH}/external/pico_sdk_import.cmake)\ninclude(${FREERTOS_KERNEL_PATH}/portable/ThirdParty/GCC/RP2040/FreeRTOS_Kernel_import.cmake)\nproject(${filename} C CXX ASM)\nset(CMAKE_C_STANDARD 11)\nset(CMAKE_CXX_STANDARD 17)\npico_sdk_init()\nadd_executable(${filename} ${filename}.c)\ntarget_include_directories(${filename} PRIVATE \${CMAKE_CURRENT_LIST_DIR})\ntarget_link_libraries(${filename} pico_stdlib FreeRTOS-Kernel FreeRTOS-Kernel-Heap4)\npico_enable_stdio_uart(${filename} $SERIAL)\npico_enable_stdio_usb(${filename} $SERIAL)\n\npico_add_extra_outputs(${filename})">> ~/pico/pico-sdk/pico-examples/${filename}/CMakeLists.txt
		wget https://raw.githubusercontent.com/TechieLew/Using-FreeRTOS-with-the-Raspberry-Pi-Pico/main/FreeRTOSConfig.h
		$TEXT_EDITOR "${filename}.c"
	#OPEN PROJECT
	elif [ "$option" -eq 3 ]; then
		#LIST ALL PROJECTS
		echo -e "$M10"
		counter4=1
		declare -a proyectos3
		for proyecto3 in ~/pico/pico-sdk/pico-examples/*/; do
			if [ -e "$proyecto3" ]; then
					echo "$counter4. $(basename "$proyecto3")"
					proyectos3+=("$(basename "$proyecto3")")
					counter4=$((counter4 + 1))
			fi
		done
		#USER SELECTION
		TEXT_EDITOR=$(head -n 1 "$CONFIG_FILE")
		echo -e "$M11" 
		read numerop4
		if [ "$numerop4" -ge 1 ] && [ "$numerop4" -le "${#proyectos3[@]}" ]; then   				
				proyecto_seleccionado_3="${proyectos3[$((numerop4-1))]}"
				echo -e "$M5 $proyecto_seleccionado_3"
				c_file=$(find ~/pico/pico-sdk/pico-examples/$proyecto_seleccionado_3 -type f -name "$proyecto_seleccionado_3.c" | head -n 1)
				#IF .C EXISTS
				if [ -n "$c_file" ]; then
					echo "$M21 $c_file"
					sudo $TEXT_EDITOR ~/pico/pico-sdk/pico-examples/$proyecto_seleccionado_3/*.c
					exec "$SCRIPT_DIR/$VERSION"
				#IF .C DOESNT EXIST, ENTER TO THE SUBDIRECTORIES OF THE MAIN DIRECTORY AND LIST AGAIN
				else
				#LIST OF THE SUBDIRECTORIES
				echo -e "$M10"
				counter5=1
				declare -a subproyectos_c
				for subproyecto_c in ~/pico/pico-sdk/pico-examples/$proyecto_seleccionado_3/*/; do
					if [ -e "$subproyecto_c" ]; then
						echo "$counter5. $(basename "$subproyecto_c")"
						subproyectos_c+=("$(basename "$subproyecto_c")")
						counter5=$((counter5 + 1))
					fi
				done
				#USER SELECT
				echo -e "$M11" 
				read numeropc  
				if [ "$numeropc" -ge 1 ] && [ "$numeropc" -le "${#subproyectos_c[@]}" ]; then  
					subproyecto_seleccionado_c="${subproyectos_c[$((numeropc-1))]}"  
					echo -e "$M5 $subproyecto_seleccionado"
					c_file2=$(find ~/pico/pico-sdk/pico-examples/$proyecto_seleccionado_3/$subproyecto_seleccionado_c -type f -name "*.c" | head -n 1)
					#.c SPOTTED
					echo "$M21 $c_file2"
					sudo $TEXT_EDITOR ~/pico/pico-sdk/pico-examples/$proyecto_seleccionado_3/$subproyecto_seleccionado_c/*.c
					exec "$SCRIPT_DIR/$VERSION"
				#.UF2 DOESNT EXIST
				else
					echo "$M22"
				fi
			fi
		else
				echo -e "$M6"
				exec "$SCRIPT_DIR/$VERSION"
		fi
	#BUILD                           
	elif [ "$option" -eq 4 ]; then
		path="$HOME/pico/pico-sdk/pico-examples"
		path2="$HOME/pico/pico-sdk/pico-examples/build"
		file="$HOME/pico/pico-sdk/pico-examples/CMakeLists.txt"
		exclude=("build" "ide" "pico-examples" ".git" ".github" "blink" "blink_simple" "hello_world" "CMakeFiles" "_deps" "generated" "pico-sdk" "pioasm" "pioasm-install")
		exclude_pattern=$(IFS="|" ; echo "${exclude[*]}")
		lineas=()
		#CHECK ALL ADD_SUBDIRECTORY LINES
		while IFS= read -r linea; do
			if [[ $linea == add_subdirectory\(* ]]; then
				directorio=$(echo "$linea" | sed -E 's/add_subdirectory\(([^)]+)\)/\1/')
				lineas+=("$directorio")
			fi
		done < "$file"
		#TXT TO EXAMPLES
		for l in "${lineas[@]}"; do
			if [ ! -d "$path/$l" ]; then
				echo "El Proyecto '$path/$l' no existe. Creándolo..."
				mkdir -p "$path/$l"
				cd ~/pico/pico-sdk/pico-examples/$l
				touch "$l.c"
				DEFAULT_SCRIPT="add_executable($l $l.c)\ntarget_link_libraries($l pico_stdlib)\npico_enable_stdio_uart($l 0)\npico_enable_stdio_usb($l 0)\npico_add_extra_outputs($l)"
				echo -e "$DEFAULT_CODE">> ~/pico/pico-sdk/pico-examples/$l/$l.c
				echo -e "$DEFAULT_SCRIPT">> ~/pico/pico-sdk/pico-examples/$l/CMakeLists.txt
		#BUILD TO EXAMPLES
		for dir in "$path2"/*; do
			if [ -d "$dir" ]; then
				dirname=$(basename "$dir")
				if [[ ! "$dirname" =~ ^($exclude_pattern)$ ]]; then
					if ! grep -q "add_subdirectory($dirname)" "$file"; then
						echo "add_subdirectory($dirname)" >> "$file"
						mkdir -p "$path/$dirname"
						cd ~/pico/pico-sdk/pico-examples/$dirname
						touch "$dirname.c"                 
						echo -e "$DEFAULT_CODE" >> ~/pico/pico-sdk/pico-examples/$dirname/$dirname.c
						DEFAULT_SCRIPT="add_executable($dirname $dirname.c)\ntarget_link_libraries($dirname pico_stdlib)\npico_enable_stdio_uart($dirname 0)\npico_enable_stdio_usb($dirname 0)\npico_add_extra_outputs($dirname)"
						echo -e "$DEFAULT_SCRIPT" >> ~/pico/pico-sdk/pico-examples/$dirname/CMakeLists.txt
						echo "Agregado: add_subdirectory($dirname)"
					fi
				fi        
			fi
		done
		
		#SKIP ALREADY CREATED PROJECTS
			else
				echo "El proyecto '$path/$l' ya existe."
			fi
		done

		#BUILD
		export PICO_SDK_PATH=~/pico/pico-sdk
		cd ~/pico/pico-sdk/pico-examples
		cd build
		cmake ..
		make
		exec "$SCRIPT_DIR/$VERSION"

	#UPLOAD TO PICO
	elif [ "$option" -eq 5 ]; then
		#LIST ALL AVAILABLE PROJECTS
		echo -e "$M10"
		counter=1
		declare -a proyectos
		for proyecto in ~/pico/pico-sdk/pico-examples/build/*/; do
			if [ -e "$proyecto" ]; then
					echo "$counter. $(basename "$proyecto")"
					proyectos+=("$(basename "$proyecto")")
					counter=$((counter + 1))
			fi
		done
		#USER SELECTION
		echo -e "$M12" 
		read numerop  
		if [ "$numerop" -ge 1 ] && [ "$numerop" -le "${#proyectos[@]}" ]; then    
				proyecto_seleccionado="${proyectos[$((numerop-1))]}"
				echo "$M5 $proyecto_seleccionado"
				uf2_file=$(find ~/pico/pico-sdk/pico-examples/build/$proyecto_seleccionado -type f -name "$proyecto_seleccionado.uf2" | head -n 1)
			#IF .UF2 EXISTS
			if [ -n "$uf2_file" ]; then
					echo "Archivo .uf2 encontrado: $uf2_file"
					sudo cp ~/pico/pico-sdk/pico-examples/build/$proyecto_seleccionado/$proyecto_seleccionado.uf2 /media/$USER/RPI-RP2
					sudo rm -rf /media/$USER/RPI-RP2 > /dev/null 2>&1
					exec "$SCRIPT_DIR/$VERSION"
			#IF .UF2 DOESNT EXIST, ENTER TO THE SUBDIRECTORIES OF THE MAIN DIRECTORY AND LIST AGAIN
			else
			#LIST OF THE SUBDIRECTORIES
				echo -e "$M10"
				counter2=1
				declare -a subproyectos
				for subproyecto in ~/pico/pico-sdk/pico-examples/build/$proyecto_seleccionado/*/; do
					if [ -e "$subproyecto" ]; then
						echo "$counter2. $(basename "$subproyecto")"
						subproyectos+=("$(basename "$subproyecto")")
						counter2=$((counter2 + 1))
					fi
				done
			#USER SELECT
			echo -e "$M12" 
			read numerop2  
			if [ "$numerop2" -ge 1 ] && [ "$numerop2" -le "${#subproyectos[@]}" ]; then  
				subproyecto_seleccionado="${subproyectos[$((numerop2-1))]}"  
				echo "$M5 $subproyecto_seleccionado"
				uf2_file2=$(find ~/pico/pico-sdk/pico-examples/build/$proyecto_seleccionado/$subproyecto_seleccionado -type f -name "*.uf2" | head -n 1)
				#.UF2 SPOTTED
				echo "$M13 $uf2_file2"
				sudo cp ~/pico/pico-sdk/pico-examples/build/$proyecto_seleccionado/$subproyecto_seleccionado/$subproyecto_seleccionado.uf2 /media/$USER/RPI-RP2
				sudo rm -rf /media/$USER/RPI-RP2 > /dev/null 2>&1
				exec "$SCRIPT_DIR/$VERSION"
			#.UF2 DOESNT EXIST
			else
				echo "$M14"
			fi
		fi
		#WRONG SELECTION
		else
			echo "$M6"
			exec "$SCRIPT_DIR/$VERSION"
		fi

	#IMPORT PROJECTS FROM THE Import DIRECTORY
	elif [ "$option" -eq 6 ]; then
		#LIST ALL PROJECTS
		echo -e "$M10"
		counter2=1
		declare -a proyectosimp
		for proyectoimp in ~/resources/Import/*; do
			if [ -e "$proyectoimp" ]; then
					echo "$counter2. $(basename "$proyectoimp")"
					proyectosimp+=("$(basename "$proyectoimp")")
					counter2=$((counter2 + 1))
			fi
		done
		#USER SELECTION
		echo -e "$M15" 
		read numerop2 
		if [ "$numerop2" -ge 1 ] && [ "$numerop2" -le "${#proyectosimp[@]}" ]; then    
				proyecto_seleccionado_imp="${proyectosimp[$((numerop2-1))]}"
				echo "$M5 $proyecto_seleccionado_imp"
				mv ~/resources/Import/$proyecto_seleccionado_imp ~/pico/pico-sdk/pico-examples
				echo "add_subdirectory($proyecto_seleccionado_imp)" >> ~/pico/pico-sdk/pico-examples/CMakeLists.txt
				exec "$SCRIPT_DIR/$VERSION"
		#WRONG SELECTION
		else
				echo -e "$M6"
				exec "$SCRIPT_DIR/$VERSION"
		fi

	#DELETE PROJECT    	
	elif [ "$option" -eq 7 ]; then
		#LIST ALL PROJECTS
		echo -e "$M10"
		counter3=1
		declare -a proyectos2
		for proyecto2 in ~/pico/pico-sdk/pico-examples/*/; do
			if [ -e "$proyecto2" ]; then
					echo "$counter3. $(basename "$proyecto2")"
					proyectos2+=("$(basename "$proyecto2")")
					counter3=$((counter3 + 1))
			fi
		done
		#USER SELECTION
		echo -e "$M16" 
		read numerop3
		if [ "$numerop3" -ge 1 ] && [ "$numerop3" -le "${#proyectos2[@]}" ]; then    
				proyecto_seleccionado_2="${proyectos2[$((numerop3-1))]}"
				echo -e "$M5 $proyecto_seleccionado_2"
				sudo rm -rf ~/pico/pico-sdk/pico-examples/$proyecto_seleccionado_2/
				sudo rm -rf ~/pico/pico-sdk/pico-examples/build/$proyecto_seleccionado_2/ > /dev/null 2>&1
				sudo sed -i "s/add_subdirectory($proyecto_seleccionado_2)//g"  ~/pico/pico-sdk/pico-examples/CMakeLists.txt
				exec "$SCRIPT_DIR/$VERSION"
		else
				echo -e "$M6"
				exec "$SCRIPT_DIR/$VERSION"
		fi
	fi
#SERIAL TERMINAL
elif [ "$main_option" -eq 3 ]; then
	gnome-terminal -- bash -c "sudo gtkterm; exec bash"

#SETTINGS
elif [ "$main_option" -eq 4 ]; then
	echo -e "$M1" 
	echo -e "$M20"
	echo -e "$M17" 
	read option
	#TEXT EDITOR SETTINGS   
	if [ "$option" -eq 1 ]; then	  
		exec "$SCRIPT_DIR/$VERSION" 		         
	elif [ "$option" -eq 1 ]; then
		echo -e "$M18" 
		read numero3
		if [ "$numero3" -eq 1 ]; then
			sudo apt install vim -y
			TEXT_EDITOR=vi
			{ 
  			echo "$TEXT_EDITOR"
  			tail -n +2 "$CONFIG_FILE"
			} > "$CONFIG_FILE.tmp" && mv "$CONFIG_FILE.tmp" "$CONFIG_FILE"
			exec "$SCRIPT_DIR/$VERSION"	
		elif [ "$numero3" -eq 2 ]; then
			sudo apt install nano -y
			TEXT_EDITOR=nano
			{ 
  			echo "$TEXT_EDITOR"
  			tail -n +2 "$CONFIG_FILE"
			} > "$CONFIG_FILE.tmp" && mv "$CONFIG_FILE.tmp" "$CONFIG_FILE"
			exec "$SCRIPT_DIR/$VERSION"
		elif [ "$numero3" -eq 3 ]; then
			sudo apt install gedit -y
			TEXT_EDITOR=gedit
			{ 
  			echo "$TEXT_EDITOR"
  			tail -n +2 "$CONFIG_FILE"
			} > "$CONFIG_FILE.tmp" && mv "$CONFIG_FILE.tmp" "$CONFIG_FILE"
			exec "$SCRIPT_DIR/$VERSION"
		fi	
	#LANGUAGE SETTINGS
	elif [ "$option" -eq 2 ]; then	
		echo -e "$M19" 
		read langnumb
		if [ "$langnumb" -eq 1 ]; then
			LANGUAGE="English"
			awk -v lang="$LANGUAGE" 'NR == 2 { print lang; next } { print }' "$CONFIG_FILE" > "$CONFIG_FILE.tmp" && mv "$CONFIG_FILE.tmp" "$CONFIG_FILE"
			exec "$SCRIPT_DIR/$VERSION"
		elif [ "$langnumb" -eq 2 ]; then
			LANGUAGE="Spanish"
			awk -v lang="$LANGUAGE" 'NR == 2 { print lang; next } { print }' "$CONFIG_FILE" > "$CONFIG_FILE.tmp" && mv "$CONFIG_FILE.tmp" "$CONFIG_FILE"
			exec "$SCRIPT_DIR/$VERSION"
		fi
	else
		echo "$M6"
		exec "$SCRIPT_DIR/$VERSION"
	fi
fi