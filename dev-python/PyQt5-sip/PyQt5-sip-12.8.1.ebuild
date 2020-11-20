# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )
inherit distutils-r1

DESCRIPTION="Private sip module for PyQt5"
HOMEPAGE="https://www.riverbankcomputing.com/software/sip/intro"

MY_PN=sip
MY_P=${MY_PN}-${PV/_pre/.dev}
if [[ ${PV} == *_pre* ]]; then
	SRC_URI="https://dev.gentoo.org/~pesa/distfiles/${MY_P}.tar.gz"
else
	SRC_URI="https://pypi.python.org/packages/source/P/${PN}/PyQt5_sip-${PV}.tar.gz -> ${P}.tar.gz"
fi

# Sub-slot based on SIP_API_MAJOR_NR from siplib/sip.h
SLOT="0/12"
LICENSE="|| ( GPL-2 GPL-3 SIP )"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~x86"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}"
RDEPEND="${DEPEND}
	!<dev-python/PyQt5-5.12.2
"

S=${WORKDIR}/PyQt5_sip-${PV}
