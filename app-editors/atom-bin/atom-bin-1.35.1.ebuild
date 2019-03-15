# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit eutils

DESCRIPTION="A hackable text editor for the 21st Century"
HOMEPAGE="https://atom.io"
SRC_URI="
	amd64? ( https://github.com/atom/atom/releases/download/v1.35.1/atom-amd64.tar.gz -> ${P}-amd64.tar.gz )
	"
RESTRICT="nomirror"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	app-crypt/libsecret
	dev-libs/glib:2
	dev-libs/libgcrypt
	net-misc/curl
	x11-libs/gtk+:3
	gnome-base/gvfs
	x11-libs/libXtst
	dev-libs/nss
	sys-libs/libcap
	gnome-base/gconf
"

RDEPEND="${DEPEND}"

S="${WORKDIR}/atom-${PV}-amd64"

src_install(){
	doicon atom.png
	dodir /opt/${PN}
	cp -rfl  ${S}/. ${D}/opt/${PN}/
	insinto /usr/share/applications
	doins ${FILESDIR}/atom.desktop
	dobin  ${FILESDIR}/${PN}
}
