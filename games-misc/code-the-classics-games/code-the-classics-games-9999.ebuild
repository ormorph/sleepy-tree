# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6..9} )

inherit git-r3 desktop

MY_PN="Code-the-Classics"

DESCRIPTION="Games from the book, Code the Classics"
HOMEPAGE="https://wireframe.raspberrypi.org/books/code-the-classics1"
EGIT_REPO_URI="https://github.com/Wireframe-Magazine/${MY_PN}"

SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm ~arm64"
IUSE=""
RESTRICT="nomirror"

DEPEND="
	dev-python/pgzero
"

RDEPEND=""

src_install() {
	local dir install_dir
	install_dir="/usr/share/code-the-classics"
	dodir ${install_dir}
	for dir in *
	do
		if [[ ${dir} =~ "-master" ]] ; then
			dodir "${install_dir}/${dir/-master/}"
			pushd ${dir}
			cp -rf . "${D}/${install_dir}/${dir/-master/}"
			popd
		fi
	done

	# Install desktop files for /usr/share/applications dir
	insinto /usr/share/applications
	doins ${FILESDIR}/boing.desktop
	doins ${FILESDIR}/bunner.desktop
	doins ${FILESDIR}/cavern.desktop
	doins ${FILESDIR}/myriapod.desktop
	doins ${FILESDIR}/soccer.desktop

	# Install icon files for /usr/share/pixmaps dir
	insinto /usr/share/pixmaps
	pushd ${FILESDIR}/icon
	doins  *
	popd
}
