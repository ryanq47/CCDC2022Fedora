# need 
#System Name
hostname >> inventory.txt
#Purpose
echo -------------
echo Enter your machines purpose:
read PURPOSE
echo $PURPOSE >> inventory.txt
#OS and Version
cat /etc/os-release | grep 'NAME\|ID\|VERSION' >> inventory.txt
#IP adresses
echo -------------
echo IPADDRESS
ifconfig | grep inet >> inventory.txt

#Critical Applications
echo -------------
echo Enter your critical Applications:
read CRITAPP
echo $CRITAPP >> inventory.txt
#List of admin/user/service accounts
echo -------------
cat /etc/passswd | grep [0-9][0-9][0-9] >> inventory.txt


echo -------------
#List of services running 
systemctl | grep service >> inventory.txt
#List of open ports
echo -------------
sudo lsof -i -P -n | grep LISTEN >> inventory.txt