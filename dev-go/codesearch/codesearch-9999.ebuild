# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
EGO_PN=github.com/google/codesearch/cmd/...

inherit golang-vcs golang-base

DESCRIPTION="Code Search is a tool for indexing and searches"
HOMEPAGE="https://github.com/google/codesearch"
LICENSE="BSD"
SLOT="0"
IUSE=""
DEPEND=""
RDEPEND=""

src_compile() {
	cd ${S}/src/github.com/google/codesearch/cmd/cindex
	go build cindex.go
	cd ../csearch
	go build csearch.go
}
src_install() {
	dobin ${S}/src/github.com/google/codesearch/cmd/cindex/cindex
	dobin ${S}/src/github.com/google/codesearch/cmd/csearch/csearch
}
