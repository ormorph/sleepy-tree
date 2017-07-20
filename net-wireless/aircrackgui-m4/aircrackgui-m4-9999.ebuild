# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit qt4-r2 eutils

DESCRIPTION=""
HOMEPAGE="http://www.antepedia.com/Detail/p/aircrackgui-m4.html"
SRC_URI="https://storage.googleapis.com/google-code-archive-source/v2/code.google.com/aircrackgui-m4/source-archive.zip -> ${P}.zip"


LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""
S=${WORKDIR}/aircrackgui-m4

DEPEND="dev-qt/qtgui:4
	dev-qt/qtcore:4
	dev-db/sqlite"

RDEPEND="${DEPEND}
	net-analyzer/macchanger
	net-wireless/aircrack-ng
	net-wireless/reaver
	x11-libs/gksu
	app-admin/sudo"


src_prepare() {
	sed -i 's#aircrack-ng-1.1-M4/airodump-ng#/usr/share/aircrackgui-m4/airodump-ng#g' ${S}/trunk/DEFINES.h
	sed -i 's#aircrack-ng-1.1-M4/aireplay-ng#/usr/share/aircrackgui-m4/aireplay-ng#g' ${S}/trunk/DEFINES.h
	sed -i 's#aircrack-ng-1.1-M4/aircrack-ng#/usrshare/aircrackgui-m4/aircrack-ng#g' ${S}/trunk/DEFINES.h
	sed -i 's#binutils/macchanger#/usr/bin/macchanger#g' ${S}/trunk/DEFINES.h
	sed -i 's#utils/reaver#/usr/bin/reaver#g' ${S}/trunk/DEFINES.h
	sed -i 's#airodump.M4#/tmp/airodump.M4#g' ${S}/trunk/DEFINES.h
	sed -i 's#airodump.M4#/tmp/airodump.M4#g' ${S}/aircrack-ng/src/common.h

	epatch "${FILESDIR}/aircrack-ng_radiotrap.path"
	epatch "${FILESDIR}/aircrackgui.path"
}

src_compile() {
	cd ${S}/trunk/
	eqmake4 -config release
	emake
	cd ${S}/aircrack-ng 
	emake CC="$(tc-getCC)" LD="$(tc-getLD)" sqlite=true UNSTABLE=true|| die "emake failed"
}

src_install() {
	cd ${S}/trunk/
	dobin ${FILESDIR}/aircrackgui
	exeinto /usr/share/aircrackgui-m4
	doexe aircrack-GUI
	cd ${S}/aircrack-ng/src/
	doexe aircrack-ng aireplay-ng airodump-ng
	insinto /usr/share/icons
	mv ${S}/trunk/icons/irkickflash.png ${S}/trunk/icons/aircrackgui.png
	doins ${S}/trunk/icons/aircrackgui.png
	insinto /usr/share/applications
	doins ${FILESDIR}/aircrackgui.desktop
}
