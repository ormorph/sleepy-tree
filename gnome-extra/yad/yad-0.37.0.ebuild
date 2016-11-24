# Copyright 1999-2010 Tiziano Müller
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

DESCRIPTION="Display graphical dialogs from shell scripts or command line (a Zenity-fork)"
HOMEPAGE="http://code.google.com/p/yad/"
SRC_URI="https://sourceforge.net/projects/yad-dialog/files/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="gtk2 +gtk3"

RDEPEND="|| ( gtk2? ( x11-libs/gtk+:2 )
	gtk3? ( x11-libs/gtk+:3 ) )
	dev-libs/glib:2"

DEPEND="${RDEPEND}
	dev-util/pkgconfig
	sys-devel/gettext
	dev-util/intltool
	app-arch/xz-utils"

src_configure() {
	econf \
		 gtk2? --with-gtk=gtk2 \
		gtk3? --with-gtk=gtk3
}
