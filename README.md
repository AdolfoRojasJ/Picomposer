# Picomposer
Raspberry Pi Pico Development Tool for Debian-Based LInux Systems!

<div align="center">
  <img src="https://raw.githubusercontent.com/AdolfoRojasJ/Icon/main/Picomposer.png" alt="Picomposer Logo" />
</div>


## Brief History
Picomposer (Pronounced "pi-kompóser" or "pai-kampóuzer", both correct) is a script developed for an easily manage of C projects for the Raspberry Pi Pico on my last years of university, it started as a script just for the installation of all the resources, but due all the needs that arose, it evolved until this first version, that allows the user create, build and upload projects for this microcontroller in a few minutes.

## Instructions
1. Clone this repository. (Download Directly or `git clone -b main https://github.com/AdolfoRojasJ/Picomposer`).
2. `cd Picomposer`
3. `chmod +x Picomposer.sh`
4. `./Picomposer.sh`

## Installation
1. Type option number '1'.
2. Select an option:
- PC Installation: Download the [PICO-SDK](https://github.com/RaspberryPi/pico-sdk), [FREERTOS KERNEL](https://github.com/FreeRTOS/FreeRTOS-Kernel) and all the resources that you need to create projects for the Raspberry Pi Pico on your PC.
- PI Installation: Download the [PICO-SDK](https://github.com/RaspberryPi/pico-sdk), [FREERTOS KERNEL](https://github.com/FreeRTOS/FreeRTOS-Kernel) and all the resources that you need to create projects for the Raspberry Pi Pico on a PI Board (Raspberry Pi, Orange Pi, etc).
3. Execute on terminal (`./Picomposer.sh`) or use The Desktop Icon.

## Project
- New Project: Select the libraries for the project, consider that PICO STDLIB is obligatory, modify the Serial Communication for your project (UART & USB) and choose a name for your project, this option automatically creates the `.c file` and the `CMakeLists.txt` file with all the parameters that you've selected on the `~/pico/pico-sdk/pico-examples` directory.
- New FreeRTOS Project: Modify the Serial Communication for your project and choose a name for your project, this option allows you to create a project for the Raspberry Pi Pico using the [FREERTOS KERNEL](https://github.com/FreeRTOS/FreeRTOS-Kernel) on the `~/pico/pico-sdk/pico-examples` directory.
- Open Project: Fetch all the available projects on the `~/pico/pico-sdk/pico-examples` directory, so you can edit the `.c file` of the selected project.
- Build Projects: Automatically does the `make` command on the `~/pico/pico-sdk/pico-examples/build` directory, creating all the binaries for the pico-examples directory.
- Upload Projects: First you need to connect your RPi Pico on Boot mode, once it's done, select this option, then type the number of the project that you want to upload to your board.
- Import Projects: Paste on the directory `~/resources/Import` all the directories with the Projects that you want to use, then select this option, type the number of the project that you want to import to the `~/pico/pico-sdk/pico-examples` directory.
- Delete Project: Type the number of the project that you want to delete form the `~/pico/pico-sdk/pico-examples` directory.

## Serial Terminal
It opens the `gtkterminal` with super user privileges, so you can select the Port for the RPi Pico and by Serial Communication (UART & USB) visualize readings from the microcontroller.

## Settings
This option modifies the parameters on the `~/resources/config.txt` file.
- Text Editor: It Allows you to modify the Text Editor of the `.c files` between Vim, Nano and gedit.
- Language: It Allows you to select the language of the script, English and Spanish included.
