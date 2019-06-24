# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=( python2_7 )

inherit eutils distutils-r1

MY_PV="0.2"
S=${WORKDIR}/${PN}

DESCRIPTION="OBLogout is a expandable, configurable, and theme-able logout script designed to be used in a Openbox desktop environment."
HOMEPAGE="https://launchpad.net/oblogout"
SRC_URI="http://launchpad.net/oblogout/${MY_PV}/${PV}/+download/${PN}-${MY_PV}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="consolekit elogind"
REQUIRED_USE="consolekit? ( !elogind ) elogind? ( !consolekit )"

DEPEND="dev-python/python-distutils-extra
dev-python/pillow
dev-python/dbus-python
|| ( sys-power/upower-pm-utils sys-power/upower )
x11-libs/cairo
dev-python/pygtk
consolekit? ( sys-auth/consolekit )
elogind? ( sys-auth/elogind )"

RDEPEND=""

src_prepare(){
	epatch "${FILESDIR}/${P}_archlinux.patch" || die
	epatch "${FILESDIR}/oblogout-pil.patch" || die
	eapply_user
}

python_install_all() {
        distutils-r1_python_install_all
	if use elogind ; then
		cp ${FILESDIR}/oblogout-elogind.conf ${S}/oblogout.conf
	elif use consolekit ; then
		cp ${FILESDIR}/oblogout-consolekit.conf ${S}/oblogout.conf
	else
		cp ${FILESDIR}/oblogout.conf ${S}/oblogout.conf
	fi
	insinto /etc
	doins ${S}/oblogout.conf || die
}
