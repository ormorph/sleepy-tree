# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
PYTHON_COMPAT=( python3_{9..13} )
inherit distutils-r1

MY_PN="speech_recognition"
DESCRIPTION="Library for performing speech recognition, with support for several engines and APIs, online and offline"
HOMEPAGE="https://github.com/Uberi/speech_recognition"
SRC_URI="https://github.com/Uberi/${MY_PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
RESTRICT="nomirror"

DEPEND="dev-python/certifi
	dev-python/charset-normalizer
	dev-python/idna
	dev-python/pyaudio
	dev-python/requests
	dev-python/setuptools
	dev-python/typing-extensions
	dev-python/urllib3"

RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_PN}-${PV}"
