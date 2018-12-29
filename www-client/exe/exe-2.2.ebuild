# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="off-line authoring environment to assist teachers and academics in the publishing of web content"
HOMEPAGE="http://exelearning.net/"

SRC_URI="http://descargas.pntic.mec.es/cedec/exe_learning/${PV}/intef-exe-${PV}-source.tgz -> intef-exe-${PV}-source.tgz"
LICENSE="GPL-2"
RESTRICT="nomirror" # This is only because it's not in the gentoo tree yet
SLOT="0"
KEYWORDS="~x86 ~amd64 ~ppc"
S="${WORKDIR}/exe"
DEPEND="dev-python/lxml
		dev-python/zope-interface
		dev-python/beautifulsoup:python-2
		dev-python/python-dateutil
		dev-python/requests-oauthlib
		dev-python/suds
                dev-python/chardet
                dev-python/pillow
		dev-python/feedparser
		dev-python/cssmin
                dev-lang/python:2.7
		dev-python/webassets
		dev-python/lxml
		dev-python/rjsmin"

src_unpack() {
        unpack intef-exe-${PV}-source.tgz
}

python_install_all() {
        distutils-r1_python_install_all
}

pkg_postinst() {
	echo
	elog "After running eXe, open the page http://localhost:51235"
	echo
}

