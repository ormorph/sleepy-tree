# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
PYTHON_COMPAT=( python3_{7..12} )
inherit git-r3 distutils-r1

DESCRIPTION="A simple, cross-platform module for obtaining GUI information on and controlling application's windows"
HOMEPAGE="https://github.com/asweigart/pygetwindow"
EGIT_REPO_URI="https://github.com/asweigart/pygetwindow"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
RESTRICT="nomirror"

DEPEND="dev-python/pyrect"
RDEPEND="${DEPEND}"
