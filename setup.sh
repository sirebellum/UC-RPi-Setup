#update and upgrade packages
sudo apt-get update
sudo apt-get upgrade

#Set up hostname
read -p "What would you like the hostname to be?: " hostname
sudo echo $hostname > /etc/hostname

#Set up mail
sudo apt-get -y install ssmtp
sudo mv /etc/ssmtp/ssmtp.conf /etc/ssmtp/ssmtp.conf.org
read -p "Please enter password for ucmms.pi@gmail.com: " password
#Write config file
sudo touch /etc/ssmtp/ssmtp.conf
sudo echo "root=postmaster" >> /etc/ssmtp/ssmtp.conf
sudo echo "mailhub=smtp.gmail.com:587" >> /etc/ssmtp/ssmtp.conf
sudo echo "hostname=$hostname" >> /etc/ssmtp/ssmtp.conf
sudo echo "mailhub=smtp.gmail.com:587" >> /etc/ssmtp/ssmtp.conf
sudo echo "FromLineOverride=YES" >> /etc/ssmtp/ssmtp.conf
sudo echo "AuthUser=ucmms.pi@gmail.com" >> /etc/ssmtp/ssmtp.conf
sudo echo "AuthPass=$password" >> /etc/ssmtp/ssmtp.conf
sudo echo "UseSTARTTLS=YES" >> /etc/ssmtp/ssmtp.conf

#Setup IP at boot
curl https://raw.githubusercontent.com/sirebellum/UC-RPi-Setup/master/boot-ip.sh
curl https://raw.githubusercontent.com/sirebellum/UC-RPi-Setup/master/boot-ip.desktop
mv boot-ip.desktop /home/pi/.config/autostart/

#Setup auto digital signage
sudo apt-get -y install unclutter
curl https://raw.githubusercontent.com/sirebellum/UC-RPi-Setup/master/startup.sh
curl https://raw.githubusercontent.com/sirebellum/UC-RPi-Setup/master/startup.desktop
mv startup.desktop /home/pi/.config/autostart/

echo "Done!"