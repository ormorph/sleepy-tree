# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="A graphical music visualization plugin similar to milkdrop"
HOMEPAGE="https://github.com/projectM-visualizer/projectm"

if [[ ${PV} == *9999 ]] ; then
	EGIT_REPO_URI="https://github.com/projectM-visualizer/projectm.git"
	inherit git-r3
else
	SRC_URI="https://github.com/projectM-visualizer/projectm/releases/download/v${PV}-rc3/projectM-${PV}-rc3.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~arm64 ~hppa ~ppc64 ~sparc ~x86"
	S=${WORKDIR}/projectM-${PV}-rc3
fi

LICENSE="LGPL-2"
SLOT="0"
IUSE="gles2 qt5 sdl jack"

RDEPEND="gles2? ( media-libs/mesa[gles2] )
	media-libs/glm
	media-libs/mesa
	qt5? (
		dev-qt/qtcore:5
		dev-qt/qtgui:5
		dev-qt/qtwidgets:5
		dev-qt/qtopengl:5
		media-sound/pulseaudio
	)
	jack? ( virtual/jack )
	sdl? ( >=media-libs/libsdl2-2.0.5 )
	sys-libs/zlib"

DEPEND="${RDEPEND}
	virtual/pkgconfig"


src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable gles2 gles ) \
		$(use_enable qt5 qt ) \
		$(use_enable sdl ) \
		$(use_enable jack) \
		--enable-emscripten=no
}

src_install() {
	doicon ${S}/src/projectM-qt/images/icons/prjm16-transparent.svg
	make install DESTDIR=${D}
	if use jack ; then
		insinto /usr/share/applications
		doins ${FILESDIR}/projectM-jack.desktop
	fi
}
