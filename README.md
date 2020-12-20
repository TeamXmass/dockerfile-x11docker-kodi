  # dockerfile-x11docker-kodi
  Goal is to run kodi in docker container on Raspberry Pi.

  ## Getting Started
  ### Prepare Pi:
  * Prepare Pi image:
  Easiest way is to start with **Raspberry Pi OS with desktop**: https://www.raspberrypi.org/software/operating-systems/
  * Install docker:
  ```
  sudo apt update && sudo apt upgrade
  curl -fsSL https://get.docker.com -o get-docker.sh
  sudo sh get-docker.sh
  sudo usermod -aG docker pi
  ```
  Login && logout and check docker is running
  ```
  docker version
  docker info
  docker run hello-world
  ```
  * Install x11docker:
  ```
  curl -fsSL https://raw.githubusercontent.com/mviereck/x11docker/master/x11docker | sudo bash -s -- --update
  ```
  * Download lxde Docker file and build the Docker image on the Pi:
  ```
  curl -fsSL https://raw.githubusercontent.com/mviereck/dockerfile-x11docker-lxde/master/Dockerfile
  docker build -t lxde .
  ```
  Check x11docker lxde image
  ```
  x11docker --desktop lxde
  ```
  ### Build the kodi image:
  ```
  docker build -t xmass2/kodi .
  ```
  ### Run:
  ```
  export DISPLAY=:0
  x11docker --gpu --pulseaudio --home="/home/pi/tmp/home/" --share="/home/pi/tmp/home/video/" -- --privileged --  kodi
  ```
