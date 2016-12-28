# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI="5"
inherit git-2

DESCRIPTION="Yad interface for ffmpeg for capture video from the screen."
HOMEPAGE="https://github.com/ormorph/xgrab"
EGIT_REPO_URI="https://github.com/ormorph/xgrab.git"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="virtual/ffmpeg
         x11-apps/xrandr
         x11-apps/xwininfo
         x11-apps/xrectsel"

DEPEND="${RDEPEND}"

src_install() {
    mkdir -p ${D}/usr/share/{${PN},applications}
    cp ${FILESDIR}/${PN}.desktop ${D}/usr/share/applications
    rm -rf ${S}/.git
    cp -rf ${S}/. ${D}/usr/share/${PN}
    dobin ${FILESDIR}/${PN}
}
