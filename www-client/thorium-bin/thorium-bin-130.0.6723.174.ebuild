
# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CHROMIUM_LANGS="af am ar bg bn ca cs da de el en-GB en-US es-419
	es et fa fil fi fr gu he hi hr hu id it ja kn ko lt lv ml
	mr ms nb nl pl pt-BR pt-PT ro ru sk sl sr sv sw ta te th
	tr uk ur vi zh-CN zh-TW"

inherit chromium-2 desktop readme.gentoo-r1 xdg-utils

TN="thorium"
DESCRIPTION="Chromium fork for linux named after radioactive element No. 90."
HOMEPAGE="https://thorium.rocks/ https://github.com/Alex313031/thorium/releases"
SRC_URI="https://github.com/Alex313031/${TN}/releases/download/M${PV}/${TN}-browser_${PV}_SSE4.zip"

RESTRICT="mirror"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE="convert-dict"

CDEPEND="
	x11-libs/libX11
	x11-libs/libXcomposite
	x11-libs/libXcursor
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXrandr
	x11-libs/libXtst
	x11-libs/libxcb
	>=net-print/cups-1.3.11
	dev-libs/expat
	dev-libs/glib:2
	dev-libs/nspr
	>=dev-libs/nss-3.26
	>=media-libs/alsa-lib-1.0.19
	media-libs/fontconfig
	media-libs/freetype
	sys-apps/dbus
	sys-apps/pciutils
	virtual/udev
	x11-libs/cairo
	x11-libs/pango
	app-accessibility/at-spi2-core
	x11-libs/gtk+:3"

RDEPEND="${CDEPEND}
	x11-misc/xdg-utils
	virtual/opengl
	virtual/ttf-fonts"

DISABLE_AUTOFORMATTING="yes"

QA_PREBUILT="*"
S="${WORKDIR}"

src_prepare() {
	sed 's/\.\///' -i "${S}/thorium-portable.desktop"
	eapply_user
}

src_install() {
	local CHROMIUM_HOME="/opt/thorium-browser"
	exeinto "${CHROMIUM_HOME}"
	doexe ./thorium
	doexe ./xdg-mime
	doexe ./xdg-settings
	doexe ./chrome_crashpad_handler
	doexe ./chromedriver
	doexe ./chrome-management-service
	doexe ./chrome-sandbox
	doexe ./THORIUM-PORTABLE
	doexe ./THORIUM-SHELL
	doexe ./thorium_shell

	dosym "${CHROMIUM_HOME}/thorium" /usr/bin/thorium-bin

	insinto "${CHROMIUM_HOME}"
	doins ./*.bin
	doins ./*pak
	doins ./*.so
	doins ./*.json
	doins ./*.txt
	doins ./*.dat
	doins ./initial_preferences
	doins ./default-app-block
	doins -r ./ClearKeyCdm
	doins -r ./default_apps
	doins -r ./lib
	doins -r ./locales
	doins -r ./MEIPreload
	doins -r ./PrivacySandboxAttestationsPreloaded
	doins -r ./resources
	doins -r ./WidevineCdm

	# Install icons
	local branding size
	for size in 16 24 32 48 64 128 256 ; do
		newicon -s ${size} "./product_logo_${size}.png" thorium-bin.png
	done

	local desktop_entry_name="Thorium"

	local mime_types="text/html;text/xml;application/xhtml+xml;"
	mime_types+="x-scheme-handler/http;x-scheme-handler/https;" # bug #360797
	mime_types+="x-scheme-handler/ftp;" # bug #412185
	mime_types+="x-scheme-handler/mailto;x-scheme-handler/webcal;" # bug #416393
	make_desktop_entry \
		thorium-bin \
		"${desktop_entry_name}" \
		thorium-bin \
		"Network;WebBrowser" \
		"MimeType=${mime_types}\nStartupWMClass=chromium-browser-bin"
	sed -e "/^Exec/s/$/ %U/" -i "${ED}"/usr/share/applications/*.desktop || die

	readme.gentoo_create_doc
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postinst() {
	elog "VA-API is disabled by default at runtime. You have to enable it"
	elog "by adding --enable-features=VaapiVideoDecoder and "
	elog "--disable-features=UseChromeOSDirectVideoDecoder to CHROMIUM_FLAGS"
	elog "in /etc/chromium/default."

	xdg_icon_cache_update
	xdg_desktop_database_update
	readme.gentoo_print_elog
}
