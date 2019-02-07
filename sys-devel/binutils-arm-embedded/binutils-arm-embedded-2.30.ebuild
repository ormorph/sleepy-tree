# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils libtool flag-o-matic gnuconfig multilib versionator

DESCRIPTION="Tools necessary to build programs"
HOMEPAGE="https://sourceware.org/binutils/"
LICENSE="GPL-3+"
IUSE="test"


PATCH_VER=5

case ${PV} in
	9999)
		BVER="git"
		EGIT_REPO_URI="https://sourceware.org/git/binutils-gdb.git"
		inherit git-r3
		S=${WORKDIR}/binutils
		EGIT_CHECKOUT_DIR=${S}
		;;
	*)
		BVER=${PV}
		SRC_URI="mirror://gnu/binutils/binutils-${BVER}.tar.xz https://sourceware.org/pub/binutils/releases/binutils-${BVER}.tar.xz"
		;;
esac
SLOT="${BVER}"
KEYWORDS="amd64 arm x86 "

#
# The Gentoo patchset
#

RDEPEND="
	sys-libs/zlib
"
DEPEND="${RDEPEND}
"

S=${WORKDIR}/binutils-${PV}

src_unpack() {
	case ${PV} in
		9999)
			git-r3_src_unpack;
			;;
		*)
			default
			;;
	esac
	mkdir -p "${MY_BUILDDIR}"
}


src_configure() {
	./configure --target=arm-linux \
		--prefix=/opt/embarm/ \
		--program-prefix=arm-embedded- \
		--disable-werror
}

src_compile() {
	emake
}

src_test() {
	emake -k check
}

src_install() {
	local x d

	cd "${MY_BUILDDIR}"
	# see Note [tooldir hack for ldscripts]
	emake DESTDIR="${D}" install

	dodir /etc/env.d
	cat <<EOF >"${D}/etc/env.d/44binutils-arm-embedded" # number goes down with version upgrade
PATH=/opt/embarm/bin
ROOTPATH=/opt/embarm/bin
EOF
}
