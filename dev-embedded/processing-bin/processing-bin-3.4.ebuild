# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

MY_PN='processing'
MY_P="${MY_PN}-${PV}"
DESCRIPTION="Visual context programming language"
HOMEPAGE="https://www.processing.org/"
SRC_URI="amd64? ( http://download.processing.org/${MY_P}-linux64.tgz )
	x86? ( http://download.processing.org/${MY_P}-linux32.tgz )"

LICENSE="all-rights-reserved"  # actually not, TODO
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}/${MY_P}"
RESTRICT="strip"

src_install() {
	dodir /usr/share/applications
	insinto /usr/share/applications
	doins "${FILESDIR}/processing.desktop"

	local dest=/opt/${MY_P}

	dodir ${dest}
	insinto ${dest}
	doins -r .

	dodir /usr/bin
	for command in processing processing-java ; do
		dosym ${dest}/${command} /usr/bin/${command} || die
	done

	# Cannot use fperms with wildcards, it seems
	chmod a+x "${D}"/${dest}/java/bin/* || die
	chmod a+x "${D}"/${dest}/processing* || die
	gnome2_icon_cache_update
}
