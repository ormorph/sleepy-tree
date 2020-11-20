# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6..9} )

inherit distutils-r1

DESCRIPTION="A simple interface to GPIO devices with Raspberry Pi"
HOMEPAGE="https://gpiozero.readthedocs.io/"
SRC_URI="https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm ~arm64"
IUSE=""
RESTRICT="nomirror"

DEPEND=""

RDEPEND="${DEPEND}"
