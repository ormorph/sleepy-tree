# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1

DESCRIPTION="pygdbmi - Get Structured Output from GDB's Machine Interface"
HOMEPAGE="https://launchpad.net/oblogout"
SRC_URI="https://github.com/cs01/pygdbmi/archive/0.8.3.0.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-lang/python"
RDEPEND=""

