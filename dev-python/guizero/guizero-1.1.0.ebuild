# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6..9} )

inherit distutils-r1

DESCRIPTION="guizero is a Python 3 library for creating simple GUIs"
HOMEPAGE="https://lawsie.github.io/guizero"
SRC_URI="https://github.com/lawsie/${PN}/releases/download/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm ~arm64"
IUSE=""
RESTRICT="nomirror"

DEPEND="dev-lang/python[tk]"

RDEPEND="${DEPEND}"
