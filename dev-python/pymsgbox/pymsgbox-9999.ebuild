# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
PYTHON_COMPAT=( python3_{7..12} )
inherit git-r3 distutils-r1

DESCRIPTION="A simple, cross-platform, pure Python module for JavaScript-like message boxes"
HOMEPAGE="https://github.com/asweigart/pymsgbox"
EGIT_REPO_URI="https://github.com/asweigart/pymsgbox"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
RESTRICT="nomirror"

DEPEND="dev-lang/python[tk]"
RDEPEND="${DEPEND}"
