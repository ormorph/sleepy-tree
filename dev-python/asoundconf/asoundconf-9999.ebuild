# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
PYTHON_COMPAT=( python3_{9..12} )
inherit git-r3 distutils-r1

DESCRIPTION="Utility to read and change the user's ALSA library configuration"
HOMEPAGE="https://bitbucket.org/stativ/asoundconf"
EGIT_REPO_URI="https://bitbucket.org/stativ/asoundconf"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
RESTRICT="nomirror"

DEPEND="dev-python/pygobject"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/0001-python3-syntax.patch"
	"${FILESDIR}/0002-python3-spaces.patch"
	"${FILESDIR}/0003-python3-gobject.patch"
	"${FILESDIR}/0004-python-re.patch"
)
