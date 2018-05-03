# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils qmake-utils

MY_P="555-${P}-1-9"
DESCRIPTION="A soundfont editor for quickly designing musical instruments."
HOMEPAGE="http://polyphone-soundfonts.com"

SRC_URI="http://polyphone-soundfonts.com/en/download/file/${MY_P}-src-zip/latest/download -> ${P}-src.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
S="${WORKDIR}/trunk"
IUSE=""

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtprintsupport
	dev-qt/qtsvg:5
	dev-qt/qtwidgets
	media-libs/rtmidi
	media-libs/libicns
	media-libs/stk
	media-libs/libvorbis
	media-libs/libogg
"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i 's/#DEFINES += USE_LOCAL_QCUSTOMPLOT/DEFINES += USE_LOCAL_QCUSTOMPLOT/' polyphone.pro || die
}

src_configure() {
		eqmake5 ||die error eqmake
}

src_compile() {
	cd ${S}
	emake || die error emake
}

src_install() {
	cd ${S}
	mkdir -p ${D}/usr/share/applications
	cp ${FILESDIR}/${PN}.desktop ${D}/usr/share/applications
	icns2png -x -s 128x128 polyphone.icns
	mv polyphone_128x128x32.png polyphone.png
	dobin "${S}/RELEASE/polyphone"
	doicon "${S}/polyphone.png"
}

pkg_postinst(){
  gnome2_icon_cache_update
}
