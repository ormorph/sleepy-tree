# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6..9} )

inherit eutils distutils-r1

MY_PN="oblogout-py3"

DESCRIPTION="OBLogout is a expandable, configurable, and theme-able logout script designed to be used in a Openbox desktop environment."
HOMEPAGE="https://github.com/trizen/oblogout-py3/"
SRC_URI="https://github.com/trizen/${MY_PN}/archive/${PV}.tar.gz -> ${MY_PN}-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm ~arm64"
IUSE="elogind upower"
RESTRICT="nomirror"

DEPEND="dev-python/python-distutils-extra
	dev-python/pillow
	upower? ( || ( sys-power/upower-pm-utils sys-power/upower ) )
	x11-libs/cairo
	elogind? ( sys-auth/elogind )"

RDEPEND=""

S="${WORKDIR}/${MY_PN}-${PV}"

python_install_all() {
        distutils-r1_python_install_all
	if use elogind ; then
		cp ${FILESDIR}/oblogout-elogind.conf ${S}/oblogout.conf
	else
		cp ${FILESDIR}/oblogout.conf ${S}/oblogout.conf
	fi
	insinto /etc
	doins ${S}/oblogout.conf || die
	if use upower ; then
		sed 's/, lock/, suspend, hibernate, lock/' \
		-i ${D}/etc/oblogout.conf || die
	fi
}
