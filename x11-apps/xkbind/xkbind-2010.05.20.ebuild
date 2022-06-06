# Copyright 2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Keyboard Extension Indicator"
HOMEPAGE="http://xkbind.sourceforge.net/"
SRC_URI="https://sourceforge.net/projects/${PN}/files/${PN}/${P}/source/${P}.tar.gz"



LICENSE="GPL"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND="x11-libs/libX11"
RDEPEND="${DEPEND}"
