# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

SRC_URI="https://github.com/HOST-Oman/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

RESTRICT="primaryuri"
KEYWORDS="~amd64 ~x86"

inherit autotools

DESCRIPTION="A library for complex text layout"
HOMEPAGE="https://github.com/HOST-Oman/${PN}"

LICENSE="MIT"
SLOT="0"
IUSE="apidocs"

RDEPEND="
	media-libs/freetype:2
	media-libs/harfbuzz
	dev-libs/fribidi
"
DEPEND="
	${RDEPEND}
	dev-util/gtk-doc
"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable apidocs gtk-doc)
}
