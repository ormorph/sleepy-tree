# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 multiprocessing prefix pypi

DESCRIPTION="High-performance RPC framework (python libraries)"
HOMEPAGE="https://grpc.io"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	dev-libs/openssl[-bindist(-)]
	dev-libs/re2
	dev-python/protobuf-python[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	net-dns/c-ares
	sys-libs/zlib
"

BDEPEND="${RDEPEND}
	dev-python/cython[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
