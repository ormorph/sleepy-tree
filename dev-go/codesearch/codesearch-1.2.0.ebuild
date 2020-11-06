# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

DESCRIPTION="Code Search is a tool for indexing and searches"
HOMEPAGE="https://github.com/google/codesearch"
SRC_URI="https://github.com/google/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="nomirror"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm64 arm"
IUSE=""

DEPEND=""
RDEPEND=""

src_compile() {
	pushd cmd/cindex
	go build cindex.go
	popd
	pushd cmd/csearch
	go build csearch.go
	popd
	pushd cmd/cgrep
	go build cgrep.go
	popd
}

src_install() {
	dobin cmd/cindex/cindex
	dobin cmd/csearch/csearch
	dobin cmd/cgrep/cgrep
}
