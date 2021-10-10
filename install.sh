#!/bin/bash

#Written By Prince

#Installing Ngrok
#Taking Credentials--------------
chmod +x *
apt-get install figlet -y >> server/agif.txt 
figlet FILEXPOSER
echo "---->>>"
echo "Enter your distribution"
echo "1. x86"
echo "2. x64"
echo "3. Termux"
echo "4. arm64"
echo "---->>>"
read distribution
echo "Setting Up Login Credentials---------->>>"
echo "Enter Your Username"
echo "---->>>"
read username

echo "Enter Your Password"
echo "---->>>"
read passwd
echo "---->>>"
echo "Choose The Nearest Continent From you"
echo "'us(United States)','eu(Europe)','ap(Asia Pacific)','au(Australia)'"
echo "---->>>"
read region
echo "---->>>"
echo "Enter your Ngrok url here"
echo "Sign up at: https://dashboard.ngrok.com/signup"
echo "Make an account on ngrok.com and copy your authtoken"
echo "Look like this 1fx3u8******************************3g3h6"
echo "Don't copy paste this type of stuff ./ngrok authtoken **************************"
echo "Paste only numeric and alphabetically combined code/text"
echo "---->>>"
read authtkn

echo "Wait installation is in progress"

sleep 4s

#------------------------------->>>
mkdir server
echo "-------------------------------------->>>"
echo "Installing Prerequisites-------------->>>"
apt install jq -y
if [ $distribution == "1" ]
then
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip
fi

if [ $distribution == "2" ]
then
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
fi

if [ $distribution == "3" ]
then
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip
fi

if [ $distribution == "4" ]
then
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm64.zip
fi

echo "-------------------------------------->>>"
#Setting Up
echo "Setting Up---------------------------->>>"
unzip ngrok-stable-linux-*

#---------------------------------------------------------------------------------

if [ $distribution == "1" ]
then
cp start_fxr /usr/local/bin/
cp stop_fxr /usr/local/bin/
fi

if [ $distribution == "2" ]
then
cp start_fxr /usr/local/bin/
cp stop_fxr /usr/local/bin/
fi
if [ $distribution == "3" ]
then
cp start_fxr /data/data/com.termux/files/usr/bin/
cp stop_fxr /data/data/com.termux/files/usr/bin/
fi

if [ $distribution == "4" ]
then
cp start_fxr /usr/local/bin/
cp stop_fxr /usr/local/bin/
fi

#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
if [ $distribution == "1" ]
then
cp ngrok /usr/local/bin
mv ngrok server/
mv ngrok-stable-linux-* server/server.zip
cd server
touch creds
echo username:"$username":password:"$passwd":region:"$region":distribution:"$distribution" >> creds
cp creds /
cd /
cp creds /usr/local/bin/
cd /
mkdir filexposer
mv creds filexposer/
mkdir internet_shared
fi

if [ $distribution == "2" ]
then
cp ngrok /usr/local/bin
mv ngrok server/
mv ngrok-stable-linux-* server/server.zip
cd server
touch creds
echo username:"$username":password:"$passwd":region:"$region":distribution:"$distribution" >> creds
cp creds /
cd /
cp creds /usr/local/bin/
cd /
mkdir filexposer
mv creds filexposer/
mkdir internet_shared
fi

if [ $distribution == "3" ]
then
cp ngrok /data/data/com.termux/files/usr/bin/ 
mv ngrok server/
mv ngrok-stable-linux-* server/server.zip
cd server/
touch creds
echo username:"$username":password:"$passwd":region:"$region":distribution:"$distribution" >> creds
cp creds /data/data/com.termux/files/usr/
cp creds /data/data/com.termux/files/usr/bin/
cd /data/data/com.termux/files/usr/
mkdir filexposer
mv creds filexposer/
cd /data/data/com.termux/files/usr/
mkdir internet_shared
cd /data/data/com.termux/files/home/
fi

if [ $distribution == "4" ]
then
cp ngrok /usr/local/bin
mv ngrok server/
mv ngrok-stable-linux-* server/server.zip
cd server
touch creds
echo username:"$username":password:"$passwd":region:"$region":distribution:"$distribution" >> creds
cp creds /
cd /
cp creds /usr/local/bin/
cd /
mkdir filexposer
mv creds filexposer/
mkdir internet_shared
fi

ngrok authtoken $authtkn
echo "------------------------------------------------------------>>>"
echo " -----------------------------------------------"
echo "|Use this command to start server:   'start_fxr'|"
echo "|Use this command to stop server :   'stop_fxr' |"
echo " -----------------------------------------------"
echo "------------------------------------------------------------>>>"

#-------------------------------------------------------------------------------

echo " --------------------------------------------------------------------------------->>>"
echo "|The file you want to share move it to the directory named 'internet_shared'|"
echo "|'internet_shared' directory present in your root directory                 |"
echo " --------------------------------------------------------------------------------->>>"
