#/bin/bash

if [[ $1 =~ ^[0-9]+$ ]]; then
   timer=$1
   echo = "restarting server in $timer minutes"
else
   timer=5
   echo "no valid number supplied. Restarting server in 5 minutes"
fi

announce () {
	screen -S vintagestory_server -p 0 -X stuff "/announce $1^M"
}
command () {
	screen -S vintagestory_server -p 0 -X stuff "$1^M"
}

echo "This is reboot script, please be patient"

while [ $timer -gt 1 ]
do
	unset $1
	announce "server is rebooting in $timer minutes please get to safety"
	echo "$timer minute warning sent nya~"
	timer=$(( timer - 1))
	sleep 60
done

announce "Server will reboot in 60 seconds, please log off if able. Get to safety otherwise."
echo "one minute warning sent nya~"
sleep 50
announce "Saving uwu"
screen -S vintagestory_server -p 0 -X stuff "/autosavenow^M"
echo "starting loop"
i=10
while [ $i -ge 0 ]
do
	echo "warning $i"
	screen -S vintagestory_server -p 0 -X stuff "/announce server will reboot in "$i" seconds.^M"
	i=$(( i - 1 ))
	sleep 1
done
announce "Restarting server now have a nice day nya~^M"
screen -S vintagestory_server -p 0 -X stuff "/stop^M"
echo "server stopped waited then restarting"
sleep 10
~/server.sh start