# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DESCRIPTION="SysTray-X is a system tray extension for Thunderbird"
HOMEPAGE="https://github.com/Ximi1970/systray-x"
SRC_URI="https://github.com/Ximi1970/systray-x/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
RESTRICT="nomirror"

DEPEND="dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5"

RDEPEND=""

src_prepare() {
	sed 's/qmake-qt5/qmake5/' -i "${S}/Makefile"
	eapply_user
}

src_compile() {
	emake OPTIONS="DEFINES+=NO_KDE_INTEGRATION"
	sed 's/"path".*$/"path": "\/usr\/bin\/SysTray-X",/' -i "${S}/app/config/linux/SysTray_X.json"
}

src_install() {
	insinto /usr/lib/mozilla/native-messaging-hosts
	doins app/config/linux/SysTray_X.json
	insinto /usr/lib/thunderbird-addons/extensions
	doins systray-x@Ximi1970.xpi
	dobin SysTray-X
}

pkg_postinst () {
	echo
	elog "  Install the systray-x@Ximi1970.xpi plugin in Thunderbird settings."
	echo
}
