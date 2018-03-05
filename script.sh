#!/usr/bin/env bash

if [ ! -f cod4x18_dedrun ]; then
    echo "Downloading codx18 (cod4x18_dedrun not found)..."
    curl https://cod4x.me/downloads/cod4x_server-linux.zip > cod4x.zip && unzip -o cod4x.zip && rm cod4x.zip
    chmod +x cod4x18_dedrun
else
    echo "cod4x18_dedrun found, not downloading anything."
fi
if [ "$(ls -A mods)" ]; then
     echo "Mods Good"
else
    echo "ERROR Mods is Empty"
fi
if [ "$(ls -A usermaps)" ]; then
     echo "Usermaps Good"
else
    echo "ERROR Usermaps is Empty"
fi
if [ "$(ls -A zone)" ]; then
     echo "Zone is Good"
else
    echo "ERROR Zone is"
fi
echo "Setting port"
if [[ -z "${PORT}" ]]; then
  echo "The PORT variable is empty."
  PORT="28960"
fi
echo "Setting MAP"
if [[ -z "${MAP}" ]]; then
  echo "The MAP variable is empty."
  MAP="+map_rotate"
fi
echo "Checking if READY"
if [[ ! -z "${READY}" ]]; then
	echo "Config is Ready"
	if [[ ! -z "${MODNAME}" ]]; then
		echo "Mod enabled (using $MODNAME mod)"
		./cod4x18_dedrun "+set net_port $PORT" "+set fs_game mods/$MODNAME" "$EXTRA" "+exec server.cfg" "$MAP"
	else
		echo "Not using Mod"
		./cod4x18_dedrun "+set net_port $PORT" "$EXTRA" "+exec server.cfg" "$MAP"
	fi

fi
