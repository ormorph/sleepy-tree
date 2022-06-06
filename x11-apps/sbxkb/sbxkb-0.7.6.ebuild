# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit eutils

DESCRIPTION="keyboard layout switcher"
HOMEPAGE="http://sourceforge.net/projects/staybox"
SRC_URI="http://ftp.uni-stuttgart.de/pub/mirrors/mirror.slitaz.org/slitaz/sources/packages/s/${P}.tar.gz"


LICENSE="GPL"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND="x11-libs/libXrandr
	x11-libs/libX11
	x11-libs/pango
        >=x11-libs/gtk+-2
	x11-libs/gdk-pixbuf"
RDEPEND="${DEPEND}"

src_prepare() {
  eapply -p0 "${FILESDIR}/sbxkb-x11.patch"
  default
}

src_configure() {
  econf
}

src_compile() {
  emake || die
}
src_install() {
  emake install DESTDIR="${D}"|| die
}
