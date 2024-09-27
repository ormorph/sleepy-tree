# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{9..13} )
inherit distutils-r1

DESCRIPTION="Typer is a library for building CLI applications
that users will love using and developers will love creating."
HOMEPAGE="
	https://pypi.org/project/typer/
"
SRC_URI="https://github.com/tiangolo/typer/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-python/pdm
	dev-python/click
"

distutils_enable_tests pytest
