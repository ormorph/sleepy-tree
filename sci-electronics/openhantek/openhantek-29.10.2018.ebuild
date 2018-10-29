# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:$

EAPI="6"

inherit git-r3 cmake-utils

DESCRIPTION="Digital Storage Oscilloscope"
HOMEPAGE="http://www.openhantek.org/"
EGIT_REPO_URI="https://github.com/OpenHantek/openhantek.git"
EGIT_COMMIT="57e0bebcc1d4cf99d70071eae48604149332abd3"

SRC_URI=""

LICENSE="GPL-3"

SLOT="0"

IUSE="test"

DEPEND="sci-libs/fftw
	dev-libs/libusb
	dev-qt/qtprintsupport
	dev-qt/qtopengl:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets
	dev-qt/qtcore:5"

RDEPEND="${DEPEND}"

KEYWORDS="*"

BUILD_DIR="${S}"

src_prepare() {
	sed '/include(CMakeDetermineSystem)/d' -i cmake/CPackInfos.cmake
	cmake-utils_src_prepare
}

src_configure() {
	cmake-utils_src_configure
}

src_install() {
	emake install DESTDIR=${D} || die
	insinto /usr/share/applications
	doins ${FILESDIR}/openhantek.desktop
	newicon openhantek/res/images/openhantek.png openhantek.png
}

pkg_postinst() {
	echo
	elog "You will need the firmware for your DSO installed."
	elog "Visit https://github.com/OpenHantek for futher configuration instructions."
	echo
}

