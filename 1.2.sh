#Fedora2022CCDC script - RyanKleffman


#Password change. Users with UID over 1000 are usually actual (non system) accounts

echo Edit Passwords
#List users with UID over 1000
echo echo $(date): Parsing passwd for UID 1000 or more >> /var/log/ryanlog.log
cut -d: -f1,3 /etc/passwd | egrep ':[0-9]{4}$' | cut -d: -f1 > u$
echo root >> usersover1000
for ryankleffman in `cat usersover1000`
do
   echo $ryankleffman password being changed
   echo $ryankleffman':-Pokemon1' | chpasswd
        if [ "$?" -eq "0" ]; then
                echo "Password change successful - you know what it is"
                echo $(date): $ryankleffman password changed >> /var/log/ryanlog.log
        else
                echo "Password change failed"
                echo $(date): $ryankleffman password failed to change >> /var/log/ryanlog.log

        fi

done

echo changing root password cause security bro
echo changing root password cause security bro >> /var/log/ryanlog.log
passwd root
echo root password is changed

echo Turning on firewalld
	sudo systemctl start firewalld
		echo "Firewall is on"
        echo $(date): firewalld turned on >> /var/log/ryanlog.log
		
		
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