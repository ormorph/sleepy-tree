# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6..9} )

inherit distutils-r1

DESCRIPTION="A tool to remove comments from Python scripts"
HOMEPAGE="https://github.com/zanderbrown/nudatus"
SRC_URI="https://github.com/ZanderBrown/${PN}/archive/0.0.4.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm ~arm64"
IUSE=""
RESTRICT="nomirror"

DEPEND=""

RDEPEND=""
