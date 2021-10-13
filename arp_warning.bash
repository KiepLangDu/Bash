Update(){
	devices=$(arp -a|grep -v "incomplete"|grep -v "_gateway"|grep -v "vmnet*"|wc -l)
}
Start(){
	date >.MAC
	devices=$(arp -a|grep -v "incomplete"|grep -v "_gateway"|grep -v "vmnet*"|wc -l)
	while [ $devices -ge 0 ]
	do
		Update
		while [ $devices -ge 1 ]
		do
			zenity --notification --text="Warning! ARP table has $devices strange device(s).\nMaybe you need to take a look for secure."
			echo $(arp -a |grep -v "_gateway"|awk {'print $4'};date) >>.MAC
			ip neigh flush all 
			ping -c 5 127.0.0.1 >/dev/null
			Update
		done
	done
}
Start
