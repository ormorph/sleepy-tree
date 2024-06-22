# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Daemon to run Pipewire for openrc"
HOMEPAGE=""
KEYWORDS="~amd64 ~arm64 ~x86"

LICENSE="GPL-2"
SLOT="0"

IUSE=""

DEPEND="acct-user/pipewire
	media-video/pipewire
	sys-apps/coreutils
"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_prepare() {
	cp /usr/share/pipewire/pipewire-pulse.conf "${S}/" || die
	sed 's/#"tcp:4713"/"tcp:4713"/' -i "${S}/pipewire-pulse.conf" || die
	eapply_user
}

src_install() {
	exeinto "/etc/init.d"
	doexe "${FILESDIR}/pipewire"
	exeinto "/usr/bin"
	doexe "${FILESDIR}/pipewiredaemon"
	insinto "/etc/pipewire"
	doins "pipewire-pulse.conf"
	insinto "/etc/profile.d"
	doins "${FILESDIR}/pipewire.sh" "${FILESDIR}/pipewire.csh"
}
