Start(){
	##Check for conky
	ps -aux|grep conky|grep -v grep >/dev/null 2>/dev/null
	if (( $? != 0 )); then
		conky -dc ~/.OPTIONS/custom.bash >/dev/null 2>/dev/null
		conky -dc ~/.OPTIONS/custom1.bash >/dev/null 2>/dev/null
	else
		echo -e "Conky is already running!"
	fi;

	##Check for oneko
	ps -aux|grep oneko|grep -v grep >/dev/null 2>/dev/null
	if (( $? == 0 )); then
		echo -e "Oneko is running"
	else
		~/.OPTIONS/oneko -dog -speed 20 &
		~/.OPTIONS/oneko -sakura -speed 15&
	fi;
	Check_device
}
Check_device(){
	##Check for network mode
	echo -e "\nChecking network device"

	ifconfig wlan0 >/dev/null 2>/dev/null
	if [ $? == 0 ]; then
		CheckMAC
	else
		echo -e "Maybe network interface is in monitor mode. Trying to disable monitor mode before connect"
		airmon-ng stop wlan0mon >/dev/null 2>/dev/null
		if [ $? == 0 ]; then
			CheckMAC
		else
			ip a |grep wlan >/dev/null 2>/dev/null
			if [ $? != 0 ]; then
				echo -e "Can't find out your wireless devices.\nPlease check your USB port if you are using a USB wifi."
			fi;
		fi;
	fi;
}
UpdateMAC(){
	fMAC=00:11:22:33:44:55
	crMAC=$(macchanger -s wlan0|grep Current |awk {'print $3'})
	rMAC=$(macchanger -s wlan0|grep Permanent|awk {'print $3'})
}
CheckMAC(){
	#sleep 2 
	ifconfig wlan0 down
	#ip link set wlan0 down
	#sleep 2
	UpdateMAC
	if [ $crMAC == $rMAC ]; then
		echo -e "You're using real MAC address.\nChanging MAC address before connect to network."
		macchanger -m $fMAC wlan0 >/dev/null
		UpdateMAC
		Connect
	elif [ $crMAC == $fMAC ]; then
		echo -e "Your MAC address has changed. Start to connect "
		Connect
	else
		echo -e "Changing your MAC address before connect to network"
		macchanger -m $fMAC wlan0 >/dev/null
		UpdateMAC
		Connect
	fi;
}

Connect(){

	airmon-ng check kill >/dev/null 2>/dev/null
	echo -e "\nThis is Connect method \nChoose your wifi access point to connect\n1: Epal   \t2: Phuc"
	read N
	clear
	case $N in
		1) echo -e "Connecting to Epal network"
			wpa_supplicant -D wext -B -i wlan0 -c ~/.WIFI/Epal >/dev/null 2>/dev/null;;
		2) echo -e "Connecting to Phuc network"
			wpa_supplicant -D wext -B -i wlan0 -c ~/.WIFI/Phuc >/dev/null 2>/dev/null;;
		*) echo -e "Your input cannot accept\n Please check again."
	esac
		echo -e "Getting IP address from DNS server"
		ping -c 5 127.0.0.1 >/dev/null 2>/dev/null
		dhclient wlan0 >/dev/null 2>/dev/null
		if [ $? == 0 ]; then
			echo -e "Connect successful. Your IP address is $(ifconfig |grep broadcast|tr " " "\n"|head -n 10|tail -n 1)" 2>/dev/null;
		rm /etc/resolv.conf.dhclient-new* 2>/dev/null;
		Update
		else
			echo -e "Can't get IP address from DNS server. May be you need to check wifi config file."
		fi;
}
Update(){
	echo -e  "\n\nThis is Update method"
	flag=$(date|head -c 15)
	if [ "$flag" == "$(cat ~/.OPTIONS/.date)" ]; then
		echo  -e "Your system was updated today"
	else
		echo -e "Your system was not update today. Now we are going to update it."
		apt-get update && apt-get upgrade -y
	fi;
	date |head -c 15 > ~/.OPTIONS/.date
	echo -e "Done!"
	ping -c 5 127.0.0.1 >/dev/null 
	clear

}
Start
