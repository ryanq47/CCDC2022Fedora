#Fedora2022CCDC script - RyanKleffman


#Password change. Users with UID over 1000 are usually actual (non system) accounts

echo Edit Passwords


echo changing root password cause security bro
echo changing root password cause security bro >> /var/log/ryanlog.log
passwd root
echo root password is changed

echo listing all users with UID above 999
cat /etc/passwd | grep '1[0-9][0-9][0-9]'

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
	
read -p "Press enter to delete unused media"

	
echo Getting rid of media 
echo $(date): Logging media >> /var/log/ryanlog.log

	find / -name "*.mp3" -type f >> /var/log/ryanlog.log
	find / -name "*.wav" -type f >> /var/log/ryanlog.log
	find / -name "*.wmv" -type f >> /var/log/ryanlog.log
	find / -name "*.mp4" -type f >> /var/log/ryanlog.log
	find / -name "*.mov" -type f >> /var/log/ryanlog.log
	find / -name "*.avi" -type f >> /var/log/ryanlog.log
	find / -name "*.mpeg" -type f >> /var/log/ryanlog.log
	find /home -name "*.jpeg" -type f >> /var/log/ryanlog.log
	find /home -name "*.jpg" -type f >> /var/log/ryanlog.log
	find /home -name "*.png" -type f >> /var/log/ryanlog.log
	find /home -name "*.gif" -type f >> /var/log/ryanlog.log
	find /home -name "*.tif" -type f >> /var/log/ryanlog.log
	find /home -name "*.tiff" -type f >> /var/log/ryanlog.log
	find / -name "*.mp3" -type f -delete
	find / -name "*.wav" -type f -delete
	find / -name "*.wmv" -type f -delete
	find / -name "*.mp4" -type f -delete
	find / -name "*.mov" -type f -delete
	find / -name "*.avi" -type f -delete
	find / -name "*.mpeg" -type f -delete
	find /home -name "*.jpeg" -type f -delete
	find /home -name "*.jpg" -type f -delete
	find /home -name "*.png" -type f -delete
	find /home -name "*.gif" -type f -delete
	find /home -name "*.tif" -type f -delete
	find /home -name "*.tiff" -type f -delete
	
read -p "Press enter to install RKhunter"

	dnf install rkhunter -y

	rkhunter –propupd

	rkhunter --check

	echo results logged at /var/log/rkhunter/rkhunter.log