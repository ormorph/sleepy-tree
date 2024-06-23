if [ "$USER" != "pipewire" ] ; then
	if rc-status | grep -q pipewire ; then
		export PULSE_SERVER="unix:/tmp/pipewire-daemon-socket"
		if ! [[ -f "/run/user/$UID/pipewire-0" ]] ; then
			ln -sf /run/user/509/pipewire-0 "/run/user/$UID/pipewire-0"
		fi
	fi
fi
