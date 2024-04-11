# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
PYTHON_COMPAT=( python3_{7..12} )
inherit git-r3 distutils-r1

DESCRIPTION="A collection of tweening (aka easing) functions implemented in Python"
HOMEPAGE="https://github.com/asweigart/pytweening"
EGIT_REPO_URI="https://github.com/asweigart/pytweening"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
RESTRICT="nomirror"
