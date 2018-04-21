#update and upgrade packages
sudo apt-get -y update
sudo apt-get -y upgrade

#Set up mail
sudo apt-get -y install mailutils ssmtp
sudo mv /etc/ssmtp/ssmtp.conf /etc/ssmtp/ssmtp.conf.org
read -s -p "Please enter password for ucmms.pi@gmail.com: " password
#Write config file
sudo touch /etc/ssmtp/ssmtp.conf
echo "root=ucmms.pi@gmail.com" | sudo tee --append /etc/ssmtp/ssmtp.conf
echo "mailhub=smtp.gmail.com:587" | sudo tee --append /etc/ssmtp/ssmtp.conf
echo "FromLineOverride=YES" | sudo tee --append /etc/ssmtp/ssmtp.conf
echo "AuthUser=ucmms.pi@gmail.com" | sudo tee --append /etc/ssmtp/ssmtp.conf
echo "AuthPass=$password" | sudo tee --append /etc/ssmtp/ssmtp.conf > /dev/null
echo "UseSTARTTLS=YES" | sudo tee --append /etc/ssmtp/ssmtp.conf
echo "UseTLS=YES" | sudo tee --append /etc/ssmtp/ssmtp.conf

#Setup IP at boot
wget https://raw.githubusercontent.com/sirebellum/UC-RPi-Setup/master/boot-ip.sh
wget https://raw.githubusercontent.com/sirebellum/UC-RPi-Setup/master/boot-ip.desktop
mkdir /home/pi/.config/autostart
mv boot-ip.desktop /home/pi/.config/autostart/

#Setup auto digital signage
sudo apt-get -y install unclutter
wget https://raw.githubusercontent.com/sirebellum/UC-RPi-Setup/master/startup.sh
wget https://raw.githubusercontent.com/sirebellum/UC-RPi-Setup/master/startup.desktop
mv startup.desktop /home/pi/.config/autostart/

#enable ssh
sudo systemctl enable ssh
sudo systemctl start ssh

#Set up hostname
read -p "What would you like the hostname to be?: " hostname
echo $hostname | sudo tee /etc/hostname
sudo sed -i '$ d' /etc/hosts
echo "127.0.1.1 $hostname" | sudo tee --append /etc/hosts

#Change password
passwd

echo "Done!"