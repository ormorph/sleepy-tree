# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit git-r3 cmake desktop

DESCRIPTION="Digital Storage Oscilloscope"
HOMEPAGE="http://www.openhantek.org/"
EGIT_REPO_URI="https://github.com/OpenHantek/OpenHantek6022"

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
	dev-qt/qtcore:5
	virtual/libusb"

RDEPEND="${DEPEND}"

BUILD_DIR="${S}"

src_prepare() {
	sed '/include(CMakeDetermineSystem)/d' -i cmake/CPackInfos.cmake
	cmake_src_prepare
}
