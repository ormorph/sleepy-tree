# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Main features player"
HOMEPAGE="http://www.foobnix.com"
SRC_URI="http://ftp.eq.uc.pt/software/unix/Linux/deb-multimedia/pool/main/f/foobnix/foobnix_3.1.01.orig.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-2"
RESTRICT="nomirror" # This is only because it's not in the gentoo tree yet
SLOT="0"
KEYWORDS="~x86 ~amd64"

S="${WORKDIR}/${P}"
DEPEND="dev-python/setuptools
	dev-python/pygobject
	sys-devel/gettext
	dev-python/chardet
	dev-python/notify-python
	media-libs/mutagen
	dev-python/simplejson
	dev-python/gst-python:1.0
	media-plugins/gst-plugins-meta:1.0
	media-plugins/gst-plugins-soup:1.0
	dev-libs/keybinder
	net-libs/webkit-gtk:3
	"

src_unpack() {
        unpack ${A}
	mv $(ls) ${P}
}

src_prepare() {
	epatch "${FILESDIR}"/${PN}.patch
	distutils-r1_src_prepare
}

python_install_all() {
        distutils-r1_python_install_all
}
