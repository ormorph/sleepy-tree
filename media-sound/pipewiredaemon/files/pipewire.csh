if (( $user != "pipewire" )) then
	rc-status | grep -q pipewire
	if ( $? == 0 ) then
		setenv PULSE_SERVER "unix:/tmp/pipewire-daemon-socket"
		if ( ( ! -e "/run/user/$uid/pipewire-0" ) ) then
			ln -sf "/run/user/`id -u pipewire`/pipewire-0" "/run/user/$UID/pipewire-0"
		endif
	endif
endif
