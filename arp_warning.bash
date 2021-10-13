Update(){
	devices=$(arp -a|grep -v "incomplete"|grep -v "_gateway"|grep -v "vmnet*"|wc -l)
}
Start(){
	declare -i devices=$(arp -a|grep -v "incomplete"|grep -v "_gateway"|grep -v "vmnet*"|wc -l)
	while [ $devices -ge 0 ]
	do
		Update
		while [ $devices -ge 1 ]
		do
			zenity --notification --text="Warning! ARP table has $devices strang device(s).\nMaybe you need to take a look for secure."
			ip neigh flush all 
			ping -c 5 127.0.0.1 >/dev/null
			Update
		done
	done
}
Start
