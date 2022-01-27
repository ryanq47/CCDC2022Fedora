#Fedora2022CCDC script - RyanKleffman


#Password change. Users with UID over 1000 are usually actual (non system) accounts

echo Edit Passwords
#List users with UID over 1000
echo echo $(date): Parsing passwd for UID 1000 or more >> /var/log/ryanlog.log
cut -d: -f1,3 /etc/passwd | egrep ':[0-9]{4}$' | cut -d: -f1 > u$
echo root >> usersover1000
for ScottStorch in `cat usersover1000`
do
   echo $ScottStorch password being changed
   echo $ScottStorch':Y0L0SWAg1!' | chpasswd
        if [ "$?" -eq "0" ]; then
                echo "Password change successful"
                echo $(date): $ScottStorch password changed >> /var/log/mikescript.log
        else
                echo "Password change failed"
                echo $(date): $ScottStorch password failed to change >> /var/log/mikescript.log

        fi
done

