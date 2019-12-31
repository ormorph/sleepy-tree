# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit eutils

DESCRIPTION="Web development IDE."
HOMEPAGE="http://www.aptana.com"
SRC_URI="
	amd64? ( https://github.com/aptana/studio3/releases/download/${PV}.201807301111/aptana.studio-linux.gtk.x86_64.zip -> ${P}-amd64.zip )
	"
RESTRICT="nomirror"

LICENSE="GPL3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	>=virtual/jdk-1.8
	x11-libs/gtk+:2
"

RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install(){
	cp icon.xpm ${PN}.xpm
	doicon ${PN}.xpm
	rm ${PN}.xpm
	dodir /opt/${PN}
	cp -rfl  ${S}/. ${D}/opt/${PN}/
	insinto /usr/share/applications
	doins ${FILESDIR}/${PN}.desktop
	dobin  ${FILESDIR}/AptanaStudio3
	fperms +x /opt/${PN}/{AptanaStudio3,AptanaStudio3.sh}
}
