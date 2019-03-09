# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools eutils

DESCRIPTION="A Qt GUI for projectM that visualizes"
HOMEPAGE="http://projectm.sourceforge.net"
SRC_URI="https://github.com/projectM-visualizer/${PN}/releases/download/v${PV}-rc3/projectM-${PV}-rc3.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+pulseaudio jack gles"

RDEPEND="
	dev-qt/qtgui:5
	dev-qt/qtwebkit:5
	dev-qt/qtdbus:5
	dev-qt/qtserialport:5
	dev-qt/qtsvg:5
	jack? ( virtual/jack )
	pulseaudio? ( media-sound/pulseaudio )
	gles? ( media-libs/mesa[gles2] )
"
DEPEND="${RDEPEND}"

DOCS=( AUTHORS )

#S=${WORKDIR}/${PN}-${PV}-rc3
S=${WORKDIR}/projectM-${PV}-rc3

#src_prepare() {
#	cd ${S}
#	./autogen.sh
#	eapply_user
#}

src_configure() {
	CFLAGS="$CFLAGS -Wint-conversion" econf \
		--enable-qt \
		$(use_enable jack) \
		$(use_enable gles) \
		$(use_enable pulseaudio)
}

src_install() {
	doicon ${S}/src/projectM-qt/images/icons/prjm16-transparent.svg
	make install DESTDIR=${D}
	if use jack ; then
		insinto /usr/share/applications
		doins ${FILESDIR}/projectM-jack.desktop
	fi
}
