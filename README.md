# EcomMediaPlayer
a project make for rakathon 2024




## to add hosts, execute this is powershell in admin mode

- for windows, 
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
.\Add-Hosts.ps1

- for mac
./add_hosts.sh


## to setup repos run,
./setup.sh

## to run the application via containers,
docker compose up -build -d



## Application URLs
- Frontend - awesomemediaplayer.local
- Backend - api.awesomemediaplayer.local
- EcomAPI - api.ecom.local
