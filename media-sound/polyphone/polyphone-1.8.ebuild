# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils qmake-utils

MY_P="76-${P}-1-8"
DESCRIPTION="A soundfont editor for quickly designing musical instruments."
HOMEPAGE="http://polyphone-soundfonts.com"

SRC_URI="http://polyphone-soundfonts.com/en/download/file/${MY_P}-src-zip/latest/download -> ${P}-src.zip"

LICENSE="GPL-2"
SLOT="5"
KEYWORDS=""
S="${WORKDIR}/trunk"
IUSE=""

DEPEND="
	dev-qt/qtcore:4
	dev-qt/qtgui:4
	dev-libs/qcustomplot
	media-libs/rtmidi
	media-libs/libicns
"
RDEPEND="${DEPEND}
"

src_prepare() {
	sed -i 's/#DEFINES += USE_LOCAL_STK/DEFINES += USE_LOCAL_STK/' polyphone.pro || die
}

src_configure() {
		eqmake4 ||die error eqmake
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
