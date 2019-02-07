# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit desktop

FPCVER="3.0.4"

DESCRIPTION="Free Pascal Compiler"
HOMEPAGE="https://www.freepascal.org/"
SRC_URI="mirror://sourceforge/freepascal/fpc-${PV}.source.tar.gz"

LICENSE="GPL-2 LGPL-2.1-with-linking-exception"
SLOT="0" # Note: Slotting Lazarus needs slotting fpc, see DEPEND.
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-lang/fpc-${FPCVER}[source]
	sys-devel/binutils-arm-embedded"

RDEPEND="${DEPEND}"

RESTRICT="strip" #269221

S="${WORKDIR}/fpc-${PV}"


src_compile() {
	export PATH=$PATH:/opt/embarm/bin
	emake clean buildbase CROSSINSTALL=1 OS_TARGET=embedded CPU_TARGET=arm SUBARCH=armv7m
}

src_install() {
	export PATH=$PATH:/opt/embarm/bin
	set -- INSTALL_PREFIX="${ED}"/usr

	emake -j1 "$@" installbase CROSSINSTALL=1 OS_TARGET=embedded CPU_TARGET=arm SUBARCH=armv7m
	dosym /usr/lib/fpc/${PV}/ppcrossarm /usr/bin/ppcarm
}
