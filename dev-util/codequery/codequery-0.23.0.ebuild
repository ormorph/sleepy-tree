
# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit cmake-utils desktop

DESCRIPTION="A code-understanding tool based on cscope and ctags"
HOMEPAGE="http://ruben2020.github.io/codequery"

SRC_URI="https://github.com/ruben2020/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="-qt5"

DEPEND="dev-libs/icu
	dev-db/sqlite
	qt5? ( dev-qt/qtwidgets:5=
		dev-qt/qtgui:5=
		dev-qt/qtcore:5=
		dev-qt/qtxml:5= )"

RDEPEND="$DEPEND"

src_configure() {
	mycmakeargs=(
	-DNO_GUI=$(usex qt5 OFF ON)
	-DBUILD_QT5=$(usex qt5 ON OFF)
	)
	cmake-utils_src_configure
}
