#Fedora2022CCDC script - RyanKleffman


#Password change. Users with UID over 1000 are usually actual (non system) accounts

echo Edit Passwords


echo changing root password cause security bro
echo changing root password cause security bro >> /var/log/ryanlog.log
passwd root
echo root password is changed

echo listing all users with UID above 999
cat /etc/passwd | grep '[0-9][0-9][0-9]'

read -p "Press enter to continue"


echo Turning on firewalld
	sudo systemctl start firewalld
		echo "Firewall is on"
        echo $(date): firewalld turned on >> /var/log/ryanlog.log

read -p "Press enter to lock files with chattr"

echo using chattr to lock files
echo $(date): using chattr +i to lock files >> /var/log/ryanlog.log
	chattr +i /sbin/nologin
	chattr +i /etc/sudoers
	chattr +i /etc/sudoers.d
	chattr +i /etc/shadow
	chattr +i /etc/passwd
	chattr +i /etc/gpasswd
	chattr +i /etc/group
	chattr +i /etc/inittab