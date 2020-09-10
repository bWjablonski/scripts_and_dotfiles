#/bin/bash
HOSTS_PATH='/etc/hosts'
WDIR=$HOME/.custom_hosts/

echo "It'll always use base_host and filename from command to cat new host file"
read modevar
tput cuu1

if ![[-d "$WDIR"] && [ -f "${WDIR}${modevar$}" ] && [-f "${WDIR}base_host" ]]; then
	echo "No required structure!"
fi

if [ ! -f "${WDIR}original_host_backup" ]; then
	# do backup here
fi

cat $WDIR basefile $WDIR modevarfile >> HOSTS_PATH
