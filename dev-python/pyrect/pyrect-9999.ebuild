# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
PYTHON_COMPAT=( python3_{7..12} )
inherit git-r3 distutils-r1

DESCRIPTION="PyRect is a simple module with a Rect class for Pygame-like rectangular areas"
HOMEPAGE="https://github.com/asweigart/pyrect"
EGIT_REPO_URI="https://github.com/asweigart/pyrect"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
RESTRICT="nomirror"
