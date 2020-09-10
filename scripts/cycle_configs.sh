#/bin/bash
CONFIG_LIST+=('/etc/resolv.conf')
CONFIG_LIST+=($HOME/.config/pypoetry/config.toml)
CONFIG_LIST+=($HOME/.config/pip/pip.conf)

CONFIG_LIST_SUDO+=(1)
CONFIG_LIST_SUDO+=(0)
CONFIG_LIST_SUDO+=(0)

echo "Input config prefix, ex. private, work, etc."
read modevar
tput cuu1

for ((i=0;i<${#CONFIG_LIST[@]};++i)); 
	do
		CONFIG_PATH=${CONFIG_LIST[i]}
		CONFIG_FILENAME=$(basename $CONFIG_PATH)
		CONFIG_DIR=$(dirname $CONFIG_PATH)
		NEW_CONFIG="$CONFIG_DIR/$modevar.$CONFIG_FILENAME"
		USE_SUDO=${CONFIG_LIST_SUDO[i]}
		if [ "$USE_SUDO" -eq "1" ]; then
			sudo rm $CONFIG_PATH
			sudo cp $NEW_CONFIG $CONFIG_PATH
		else
			rm $CONFIG_PATH
			cp $NEW_CONFIG $CONFIG_PATH
		fi
	done
	
