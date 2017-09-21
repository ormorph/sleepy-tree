# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils
DESCRIPTION=""
HOMEPAGE=""
SRC_URI="amd64? ( http://vkaudiosaver.ru/downloads/vkaudiosaver-debian-amd64 -> vkaudiosaver-debian-amd64.deb )
	x86? ( http://vkaudiosaver.ru/downloads/vkaudiosaver-debian-i386 -> vkaudiosaver-debian-i386.deb )"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-qt/qtdeclarative:4
	dev-libs/openssl:0.9.8
	dev-libs/openssl:0
	dev-qt/qtgui:4
	dev-qt/qtdbus:4
	dev-qt/qtcore:4
	dev-qt/qtsql:4
	dev-qt/qtxmlpatterns:4"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_prepare(){
	unpack ${A}
	unpack ./data.tar.xz
}
src_install(){
	cd opt/VkAudioSaver/lib/
	rm {libssl.so.0.9.8,libssl.so.1.0.0,libcrypto.so.1.0.0,libcrypto.so.0.9.8}
	cd "${S}"
	cp -R opt "${D}"
	cp -R usr "${D}"
	dosym /opt/VkAudioSaver/vkaudiosaver /usr/bin/vkaudiosaver
	dosym /usr/lib/libssl.so.0.9.8 /opt/VkAudioSaver/lib/libssl.so.0.9.8
	dosym /usr/lib/libssl.so.1.0.0 /opt/VkAudioSaver/lib/libssl.so.1.0.0
	dosym /usr/lib/libcrypto.so.1.0.0 /opt/VkAudioSaver/lib/libcrypto.so.1.0.0
	dosym /usr/lib/libcrypto.so.0.9.8 /opt/VkAudioSaver/lib/libcrypto.so.0.9.8
}
