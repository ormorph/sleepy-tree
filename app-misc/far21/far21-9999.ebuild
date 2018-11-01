# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils desktop flag-o-matic gnome2-utils git-r3

DESCRIPTION="Linux port of FAR Manager v2"
HOMEPAGE="http://farmanager.com"
EGIT_REPO_URI="https://github.com/elfmz/far2l"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
	x11-libs/wxGTK
	x11-libs/gtk+:2
	x11-libs/libXrandr
	x11-libs/pango
	media-gfx/graphite2
	media-libs/libpng
	dev-libs/glib:2
	virtual/jpeg
	x11-libs/gdk-pixbuf
	media-libs/tiff
"
DEPEND="${RDEPEND}
"

src_configure() {
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
}

pkg_postinst() {
	gnome2_icon_cache_update
}
