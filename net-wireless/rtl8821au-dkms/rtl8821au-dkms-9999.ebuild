# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils linux-info linux-mod git-r3

DESCRIPTION="Decode OOK modulated signals"
HOMEPAGE="https://github.com/meoow/rtl8821au-dkms"
EGIT_REPO_URI="${HOMEPAGE}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""
#ARCH="x86_64"
S="${S}/8821au-1.0"

DEPEND="virtual/linux-sources"
RDEPEND="${DEPEND}"

MODULE_NAMES="8821au(net/wireless)"

src_compile(){
	if [ "${ARCH}" = "amd64" ] ; then
#		export ARCH="x86_64"
		emake ARCH="x86_64" || die
	else 
		emake || die
	fi
}


src_install(){
	linux-mod_src_install
}
