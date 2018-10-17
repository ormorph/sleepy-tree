# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1

S="${WORKDIR}/Flask-Compress-${PV}"

DESCRIPTION="Compress responses in a Flask app with gzip"
HOMEPAGE="https://launchpad.net/oblogout"
SRC_URI="https://files.pythonhosted.org/packages/0e/2a/378bd072928f6d92fd8c417d66b00c757dc361c0405a46a0134de6fd323d/Flask-Compress-1.4.0.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-python/flask"
RDEPEND=""


python_install_all() {
        distutils-r1_python_install_all
}
