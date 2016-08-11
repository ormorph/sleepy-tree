# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit eutils rpm

DESCRIPTION="Multimedia player that supports most of audio and video formats."
HOMEPAGE="http://www.rosalab.ru/"
SRC_URI="https://mirror.yandex.ru/rosa/rosa2014.1/repository/SRPMS/main/release/${P}-1.src.rpm"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="media-video/mplayer"
DEPEND="${RDEPEND}
	dev-libs/glib
	dev-qt/qtcore:4
	dev-qt/qtgui:4
	dev-qt/qtmultimedia:4
	dev-libs/qjson
	media-sound/wildmidi"

S="${WORKDIR}/${PN}"

src_unpack() {
        rpm_unpack ${A}
        unpack ./${P}.tar.gz
}

src_prepare() {
	cd ${S}
	sed -i '1i#define OF(x) x' \
                src/findsubtitles/quazip/ioapi.{c,h} \
                src/findsubtitles/quazip/{zip,unzip}.h || die
}

src_compile() {
	export QT_SELECT=qt4
	emake PREFIX=/usr || die
}

src_install() {
	emake PREFIX=/usr DESTDIR="${D}" install || die
}
