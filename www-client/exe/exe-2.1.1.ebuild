# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="off-line authoring environment to assist teachers and academics in the publishing of web content"
HOMEPAGE="http://exelearning.net/"
SRC_URI="http://cedec.educalab.es/es/docman/doc_download/192-intef-exe-211-sourcetgz -> intef-exe-2.1.1-source.tgz"
LICENSE="GPL-2"
RESTRICT="nomirror" # This is only because it's not in the gentoo tree yet
SLOT="0"
KEYWORDS="~x86 ~amd64 ~ppc"
S="${WORKDIR}/exe"
DEPEND="dev-python/lxml
		dev-python/zope-interface
		dev-python/beautifulsoup:python-2
		dev-python/python-dateutil
		dev-python/lxml
		dev-python/requests-oauthlib
		dev-python/suds
                dev-python/chardet
                dev-python/pillow
		dev-python/feedparser
		dev-python/cssmin
                dev-lang/python:2.7"

src_unpack() {
        unpack intef-exe-2.1.1-source.tgz
}

python_install_all() {
        distutils-r1_python_install_all
}