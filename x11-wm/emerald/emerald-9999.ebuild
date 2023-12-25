# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools git-r3

DESCRIPTION="merald – Window decorator for Compiz"
HOMEPAGE="https://gitlab.com/compiz/emerald"
EGIT_REPO_URI="https://gitlab.com/compiz/emerald"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	x11-libs/gtk+:3
	dev-libs/glib
"
DEPEND="
	${RDEPEND}
"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	local myconf=( --with-gtk=3.0
			--disable-mime-update )
	econf ${myconf[@]}
}

src_install() {
	emake install DESTDIR="${D}"
	dobin "${FILESDIR}/emerald-theme"
}
