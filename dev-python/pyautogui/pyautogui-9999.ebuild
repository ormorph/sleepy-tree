# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
PYTHON_COMPAT=( python3_{7..12} )
inherit git-r3 distutils-r1

DESCRIPTION="PyAutoGUI supports Python"
HOMEPAGE="https://github.com/asweigart/pyautogui"
EGIT_REPO_URI="https://github.com/asweigart/pyautogui"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
RESTRICT="nomirror"

DEPEND="dev-python/mouseinfo
	dev-python/pillow
	dev-python/pygetwindow
	dev-python/pymsgbox
	dev-python/pyperclip
	dev-python/pyrect
	dev-python/pyscreeze
	dev-python/python-xlib
	dev-python/pytweening"

RDEPEND="${DEPEND}"
