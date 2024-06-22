if [ "$USER" != "pipewire" ] ; then
	if rc-status | grep -q pipewire ; then
		export PULSE_SERVER="tcp:127.0.0.1:4713"
		if ! [[ -f "/run/user/$UID/pipewire-0" ]] ; then
			ln -sf /run/user/509/pipewire-0 "/run/user/$UID/pipewire-0"
		fi
	fi
fi
