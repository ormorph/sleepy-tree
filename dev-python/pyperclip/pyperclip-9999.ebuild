# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
PYTHON_COMPAT=( python3_{7..12} )
inherit git-r3 distutils-r1

DESCRIPTION="Pyperclip is a cross-platform Python module for copy and paste clipboard functions"
HOMEPAGE="https://github.com/asweigart/pyperclip"
EGIT_REPO_URI="https://github.com/asweigart/pyperclip"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
RESTRICT="nomirror"
