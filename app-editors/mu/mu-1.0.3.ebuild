# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6..9} )

inherit distutils-r1

DESCRIPTION="A simple editor for beginner programmers"
HOMEPAGE="https://codewith.mu/"
SRC_URI="https://github.com/mu-editor/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm ~arm64"
IUSE=""
RESTRICT="nomirror"

DEPEND="dev-python/PyQt5[serialport]
	dev-python/PyQt5-sip
	dev-python/pillow
	dev-python/pyflakes
	dev-python/pycodestyle
	dev-python/nudatus
	dev-python/semver
	dev-libs/pigpio
	dev-python/gpiozero
	dev-python/guizero
	dev-python/PyQtChart
	dev-python/qscintilla-python
	dev-python/matplotlib
	dev-python/qtconsole
	dev-python/pyserial
	dev-python/colorzero"

RDEPEND=""

PATCHES=( ${FILESDIR}/mu-setup.patch )

python_install_all() {
	pushd ${S}/conf > /dev/null
		insinto /lib/udev/rules.d
		doins 90-usb-microbit.rules
		insinto /usr/share/applications
		doins mu.codewith.editor.desktop
		insinto /usr/share/pixmaps
		doins mu.codewith.editor.png
	popd > /dev/null
        distutils-r1_python_install_all
}
