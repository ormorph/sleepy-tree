# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
CMAKE_MAKEFILE_GENERATOR="emake"
inherit cmake-utils

DESCRIPTION="Sonic Pi - The Live Coding Music Synth for Everyone."
HOMEPAGE="https://sonic-pi.net"
SRC_URI="https://github.com/sonic-pi-net/sonic-pi/archive/v3.2.2.tar.gz -> ${PN}-${PV}.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE=""

BDEPEND="dev-lang/erlang
	dev-lang/ruby"

DEPEND="media-libs/aubio
	media-sound/supercollider
	dev-qt/qtwidgets:5
	dev-qt/qtopengl:5
	dev-qt/qtnetwork:5
	virtual/jack"
RDEPEND="${DEPEND}"


S="${WORKDIR}/${P}/app/gui/qt"
BUILD_DIR="${S}/build"

src_prepare() {
	./unix-prebuild.sh || die
	cmake-utils_src_prepare
}

src_configure() {
	${S}/unix-config.sh || die
}

src_install() {
	insinto /usr/share/applications
	doins ${FILESDIR}/sonic-pi.desktop
	insinto /usr/share/pixmaps
	doins ${FILESDIR}/sonic-pi.png
	exeinto /opt/sonic-pi/app/gui/qt/build
	doexe ${S}/build/sonic-pi
	cp -rf ${S}/theme ${D}/opt/sonic-pi/app/gui/qt/ || die
	cp -rf ${S}/../../server ${D}/opt/sonic-pi/app/ || die
	cp -rf ${S}/../../../bin ${D}/opt/sonic-pi || die
	cp -rf ${S}/../../../etc ${D}/opt/sonic-pi || die
	exeinto /usr/bin
	doexe ${FILESDIR}/sonic-pi
}
