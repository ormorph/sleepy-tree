# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

# The current commit corresponds to version 0.2.2
COMMIT="afe60da062ea315b92f2a9857e50b77e0b3a4b7e"
DESCRIPTION="Utility for miscellaneous wlroots extensions"
HOMEPAGE="https://git.sr.ht/~brocellous/wlrctl"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.sr.ht/~brocellous/wlrctl"
else
	SRC_URI="https://git.sr.ht/~brocellous/${PN}/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm64"
	S="${WORKDIR}/${PN}-${COMMIT}"
fi

SLOT="0"

DEPEND="
	dev-libs/wayland
	x11-libs/libxkbcommon
"
RDEPEND="${DEPEND}"
