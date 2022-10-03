# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit rpm

# Revision used by upstream
SRC_REV="1"

MY_P="${P}-${SRC_REV}"

DESCRIPTION="Epson Perfection V10/V100 PHOTO scanner plugin for SANE 'epkowa' backend."
HOMEPAGE="http://www.avasys.jp/english/linux_e/dl_scan.html"
SRC_URI="
	x86?   ( http://pkgs.fedoraproject.org/lookaside/pkgs/iscan-firmware/${MY_P}.i386.rpm/0a3a83dbbb2630c5e9453cc78983ab81/${MY_P}.i386.rpm )
	amd64? ( https://src.fedoraproject.org/repo/extras/iscan-firmware/${MY_P}.x86_64.rpm/9e36fd80b1f8ffa3f658b6a025d5e186/${MY_P}.x86_64.rpm )"

LICENSE="AVASYS"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE=""

DEPEND=">=media-gfx/iscan-2.18.0"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install() {
	# install scanner firmware
	insinto /usr/share/iscan
	doins "${WORKDIR}"/usr/share/iscan/*

	# install docs
	dodoc usr/share/doc/"${P}"/AVASYSPL.ja.txt
	dodoc usr/share/doc/"${P}"/AVASYSPL.en.txt

	# install scanner plugins
	insinto "/usr/$(get_libdir)"/iscan
	INSOPTIONS="-m0755"
	doins "${WORKDIR}/usr/$(get_libdir)/iscan"/libesint66.so.2.0.1
	dosym libesint66.so.2.0.1 "/usr/$(get_libdir)"/iscan/libesint66.so.2
	dosym libesint66.so.2.0.1 "/usr/$(get_libdir)"/iscan/libesint66.so
}

pkg_postinst() {
	# Needed for scaner to work properly.
	iscan-registry --add interpreter usb 0x04b8 0x012d "/usr/$(get_libdir)"/iscan/libesint66 /usr/share/iscan/esfw66.bin

	elog
	elog "Firmware file esfw66.bin for Epson Perfection V10 /"
	elog "V100 PHOTO has been installed in /usr/share/iscan and"
	elog "registered for use"
	elog
}

pkg_prerm() {
	# Uninstall interpreter from iscan-registry before removal
	iscan-registry --remove interpreter usb 0x04b8 0x012d "/usr/$(get_libdir)"/iscan/libesint66 /usr/share/iscan/esfw66.bin
}
