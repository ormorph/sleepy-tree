# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop pax-utils unpacker xdg

DESCRIPTION="Code editing. Redefined"
HOMEPAGE="https://code.visualstudio.com"
SRC_URI="arm64? ( https://packagecloud.io/headmelted/codebuilds/packages/debian/stretch/code-oss_1.45.0-1586135971_arm64.deb/download.deb -> ${P}_arm64.deb )
	arm? ( https://packagecloud.io/headmelted/codebuilds/packages/debian/stretch/code-oss_1.45.0-1586135927_armhf.deb/download.deb -> ${P}_arm.deb )"

RESTRICT="nomirror"

LICENSE="MIT"
SLOT="0"

KEYWORDS="~arm ~arm64"

DEPEND=""

RDEPEND="${DEPEND}"

S=${WORKDIR}
src_install() {
	cp -a ${S}/* ${D}
}
