# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools flag-o-matic

DESCRIPTION="merald – Window decorator for Compiz"
HOMEPAGE="https://gitlab.com/compiz/emerald"
SRC_URI="https://gitlab.com/compiz/${PN}/-/archive/v${PV}/${PN}-v${PV}.tar.bz2"

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
S="${WORKDIR}/${PN}-v${PV}"

PATCHES=(
	"${FILESDIR}/${PN}-tar-${PV}".patch
	"${FILESDIR}/${PN}-g_memdup-${PV}".patch
)

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	local myconf=( --with-gtk=3.0
			--enable-dependency-tracking
			--disable-mime-update 
)
	econf ${myconf[@]}
}

src_install() {
	emake install DESTDIR="${D}"
	dobin "${FILESDIR}/emerald-theme"
}

