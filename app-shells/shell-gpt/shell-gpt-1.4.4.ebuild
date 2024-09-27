# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{9..12} )
inherit distutils-r1

DESCRIPTION="A command-line productivity tool powered by OpenAI's GPT models."
HOMEPAGE="https://github.com/TheR1D/shell_gpt"
SRC_URI="https://github.com/TheR1D/shell_gpt/archive/refs/tags/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-python/click
	dev-python/distro
	dev-python/jiter
	dev-python/openai
	dev-python/pydantic
	dev-python/requests
	dev-python/rich
	dev-python/typer
"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/${PN}-proxy.patch"
)

S="${WORKDIR}/shell_gpt-${PV}"

pkg_postinst () {
	elog "You can specify http proxy in SGPT_HTTP_PROXY variable."
	elog "To do this, you can do the following"
        elog "Example:"
	elog "$ export SGPT_HTTP_PROXY='127.0.0.1:9055'"
	elog "$ sgpt 'hello'"
	elog "You must have your own proxy address available."
}
