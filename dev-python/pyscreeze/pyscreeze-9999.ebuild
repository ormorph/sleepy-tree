# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
PYTHON_COMPAT=( python3_{7..12} )
inherit git-r3 distutils-r1

DESCRIPTION="PyScreeze is a simple, cross-platform screenshot module for Python"
HOMEPAGE="https://github.com/asweigart/pyscreeze"
EGIT_REPO_URI="https://github.com/asweigart/pyscreeze"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
RESTRICT="nomirror"

DEPEND="dev-python/pillow
	dev-python/numpy"
RDEPEND="${DEPEND}"
