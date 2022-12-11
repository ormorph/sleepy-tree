# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit qmake-utils

MY_P="893-${PN}-2-3-1"
DESCRIPTION="A soundfont editor for quickly designing musical instruments."
HOMEPAGE="http://polyphone-soundfonts.com"

SRC_URI="https://www.polyphone-soundfonts.com/download/file/${MY_P}-zip/latest/download  -> ${P}-src.zip"

LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtprintsupport
	dev-qt/qtsvg:5
	dev-qt/qtwidgets
	media-libs/libicns
	media-libs/rtmidi
	media-libs/libvorbis
	media-libs/libogg
	media-libs/stk
	media-libs/portaudio
"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_prepare() {
	sed -e 's|#DEFINES += USE_LOCAL_QCUSTOMPLOT|DEFINES += USE_LOCAL_QCUSTOMPLOT|' -e 's|/usr/local|/usr|' -i polyphone.pro || die
eapply_user
}

src_configure() {
#		$(qt5_get_bindir)/qmake || die
		eqmake5 || die
}

src_install() {
	cd ${S}
	insinto /usr/share/applications
	doins ${FILESDIR}/${PN}.desktop
	insinto /usr/share/mime/packages
	doins ${FILESDIR}/${PN}.xml
	doman ${FILESDIR}/polyphone.1
	icns2png -x -s 128x128 polyphone.icns
	mv polyphone_128x128x32.png polyphone.png
	dobin "${S}/bin/polyphone"
	doicon "${S}/polyphone.png"
}

pkg_postinst(){
  gnome2_icon_cache_update
}
