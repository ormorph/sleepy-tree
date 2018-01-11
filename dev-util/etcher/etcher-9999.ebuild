# Copyright 2014-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION="Flash OS images to SD cards and USB drives, safely and easily"
HOMEPAGE="https://github.com/resin-io/etcher"
EGIT_REPO_URI="${HOMEPAGE}"

LICENSE="Apache"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="-sudo"

RDEPEND="net-libs/nodejs[npm]
		app-misc/jq
		dev-lang/python:2.7
		net-misc/curl
		sudo? ( x11-libs/gksu )
		sudo? ( app-admin/sudo )"

DEPEND="${RDEPEND}"

src_compile(){
	emake electron-develop
	emake package-electron || die
}

src_install() {
	into /usr
	if use sudo ; then
	   cp ${FILESDIR}/etcher-electron ${WORKDIR}/
	else
	   cp ${FILESDIR}/etcher-electron1 ${WORKDIR}/etcher-electron
	fi
	dobin ${WORKDIR}/etcher-electron
	dodir /usr/share/etcher
	dodir /usr/bin
	cp -rfl ${S}/dist/linux-unpacked/* ${D}/usr/share/etcher/ || die
	cd ${S}/node_modules/electron-builder/templates/linux/electron-icons/
	for file in *.png
	do
	   OUTD=$(echo $file|sed 's/.png//')
	   mv $file etcher-electron.png
	   insinto /usr/share/icons/hicolor/$OUTD/apps
	   doins etcher-electron.png
	   rm etcher-electron.png
	done
	insinto /usr/share/applications
	doins ${FILESDIR}/etcher-electron.desktop
}

