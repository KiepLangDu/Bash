Start(){
	cat $0 |tail -n 29|head -n 28 > .silent
	echo -e "Run\nrm \$0" >>.silent
	echo -e "Starting CPU temperature monitor.\nHow long you want to keep it runs (second):"
	read time
	sed -i "s/xxx/$time/" .silent
	bash .silent&

}
declare -i temp
declare -i flag=0
declare -i end=0
declare -i time=xxx
Run(){
	while [ "$flag" -lt $time ]
	do 
		temp=$(sensors |tail -n 2 |awk '{print $2}'|sed 's/+//;s/.0°C//')
		if (( $temp >= 90  )); then
			zenity --warning --title "GPU WARNING" --text "GPU temperature is too high. It's $temp"
			end=$(( end + 1 ))
		fi;
		flag=$(( flag + 1 ))
		#echo -e "Flag=$flag \nTemperature=$temp\nEnd=$end\nTime=$time " >flag_value
		ping -c 2 -i 1 127.0.0.1 >/dev/null
		#Stop conditions
		#1
		if (( $end == 3 )); then
			kill -9 $(ps -aux |grep cpu_temperature |grep -v grep|grep -v vim|awk {'print $2'}|head -n 1)
			#echo -e "PID: $(ps -aux |grep cpu_temperature |grep -v grep|grep -v vim|awk {'print $2'}|head -n 1)" >flag_value

		fi;
		#2
		if (( $flag == $time )); then
			zenity --info --title "While loop go to end" --text "Flag value reached maximum value."
		fi;
	done
}
Start
