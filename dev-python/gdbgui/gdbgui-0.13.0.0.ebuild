# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1


DESCRIPTION="A modern, browser-based frontend to gdb (gnu debugger) "
HOMEPAGE="https://github.com/cs01/gdbgui"
SRC_URI="https://github.com/cs01/gdbgui/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-python/pygdbmi
	!>dev-python/flask-0.12.4
	dev-python/flask-compress
	>=dev-python/flask-socketio-2.9.0
	!>dev-python/flask-socketio-3.0
	>=dev-python/gevent-1.2.2
	>=dev-python/pygments-2.2.0
	!>dev-python/pygments-3.0
	dev-python/python-socketio"
RDEPEND=""

src_prepare(){
	rm -rf ${S}/tests
        eapply_user
}
