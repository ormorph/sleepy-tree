# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="4"

inherit rpm eutils qt4-r2 multilib

DESCRIPTION="ROSA Media Player Plugin is designed to use with internet browsers like Firefox and Chrome/Chromium."
HOMEPAGE="http://www.rosalab.ru/"
SRC_URI="https://mirror.yandex.ru/rosa/rosa2014.1/repository/SRPMS/main/release/${P}-3.src.rpm"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="media-video/mplayer"
DEPEND="${RDEPEND}
	dev-libs/glib
	dev-qt/qtcore:4
	dev-qt/qtgui:4"

src_unpack() {
        rpm_unpack ${A}
	mkdir ${S}
	cd ${S}
        unpack ./../${P}.tar.gz
}

src_compile() {
	mkdir build
	cd build
	eqmake4 ../rosa-media-player-plugin.pro
	emake || die
	lrelease ../rosa-media-player-plugin.pro
}
src_install() {
	cd ${S}/build
	dodir /usr/$(get_libdir)/nsbrowser/plugins/
	insinto /usr/$(get_libdir)/nsbrowser/plugins/
	doins rosamp-plugin/build/librosa-media-player-plugin-*.so

	dodir usr/$(get_libdir)/
	dolib romp/rosa-media-player/build/librosampcore.so*

	dodir /usr/$(get_libdir)/mozilla/plugins/translations
	insinto /usr/$(get_libdir)/mozilla/plugins/translations
	doins ../translations/rosamp_plugin_*.qm
}
