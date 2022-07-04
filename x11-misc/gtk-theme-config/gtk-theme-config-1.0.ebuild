# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Configure GTK theme colors"
HOMEPAGE="https://github.com/satya164/gtk-theme-config"
SRC_URI="https://github.com/satya164/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	x11-libs/gtk+:3
	dev-libs/glib
	dev-lang/vala
"
DEPEND="
	${RDEPEND}
"
