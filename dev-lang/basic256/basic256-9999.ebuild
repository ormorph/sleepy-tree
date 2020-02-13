# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit subversion qmake-utils desktop

DESCRIPTION=""
HOMEPAGE="https://sourceforge.net/p/kidbasic"
ESVN_REPO_URI="svn://svn.code.sf.net/p/kidbasic/code/trunk"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	dev-qt/qtmultimedia:5
	dev-qt/qtnetwork:5
	dev-qt/qtcore:5
	app-accessibility/espeak
	"
DEPEND="${RDEPEND}"

src_prepare() {
	eapply ${FILESDIR}/${PN}.patch
	sed -i ${S}/BASIC256.pro -e "s|/usr/share/basic256|${D}/usr/share/basic256|g"
	sed -i ${S}/BASIC256.pro -e "s|/usr/bin|${D}/usr/bin|g"
	eapply_user
}

src_configure() {
	eqmake5 BASIC256.pro
}

src_install() {
	emake install || die
	dodir /usr/share/applications
	insinto /usr/share/applications
	doins ${FILESDIR}/${PN}.desktop
	cd debian
	doicon basic256.xpm
}

pkg_postrm() {
	xdg_desktop_database_update
}
