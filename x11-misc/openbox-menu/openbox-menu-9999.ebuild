# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit eutils toolchain-funcs mercurial

DESCRIPTION="Another dynamic menu generator for Openbox"
HOMEPAGE="http://fabrice.thiroux.free.fr/openbox-menu_en.html"
#SRC_URI="https://bitbucket.org/fabriceT/${PN}/downloads/${P}.tar.bz2"
EHG_REPO_URI="https://bitbucket.org/fabriceT/openbox-menu"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+icons svg"
REQUIRED_USE="svg? ( icons )"

COMMON_DEPEND="
	dev-libs/glib:2
	lxde-base/menu-cache
	x11-libs/gtk+:2
"
RDEPEND="
	${COMMON_DEPEND}
	icons? ( x11-wm/openbox[imlib,svg?] )
	!icons? ( x11-wm/openbox )
"
DEPEND="
	${COMMON_DEPEND}
	virtual/pkgconfig
"

src_prepare() {
#	epatch "${FILESDIR}"/${PN}-0.5.0-build.patch
	epatch "${FILESDIR}"/${PN}-cache-1.patch
	epatch_user
	tc-export CC PKG_CONFIG
}

src_compile() {
	emake \
		$(usex icons 'ICONS=1' 'ICONS=0') \
		$(usex svg 'SVG_ICONS=1' 'SVG_ICONS=0')
}
