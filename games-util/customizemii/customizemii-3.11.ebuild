# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit xdg-utils
DESCRIPTION="a custom channel creator for the wii"
HOMEPAGE="https://code.google.com/archive/p/customizemii/"
SRC_URI="https://storage.googleapis.com/google-code-archive-source/v2/code.google.com/customizemii/source-archive.zip"
S="${WORKDIR}/customizemii"
PATCHES=("${FILESDIR}/Fix-paths.diff")
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
RDEPEND=">=app-shells/bash-5.1_p16-r1 >=sys-apps/coreutils-8.32-r1 >=dev-lang/mono-6.12.0.122"
DEPEND="${RDEPEND}"

src_compile() {
	cd trunk/CustomizeMii
	xbuild /p:Configuration=Release
}

src_install() {
	cd trunk/CustomizeMii/bin
	mkdir -pv "${D}/usr/bin"
	cp -v "${FILESDIR}/customizemii" "${D}/usr/bin"
	chmod -v +x "${D}/usr/bin/customizemii"
	mkdir -pv "${D}/usr/share/applications"
	cp -v "${FILESDIR}/CustomizeMii.desktop" "${D}/usr/share/applications"
	mkdir -pv "${D}/usr/share/icons/hicolor/128x128/apps"
	cp -v "${FILESDIR}/customizemii.png" "${D}/usr/share/icons/hicolor/128x128/apps"
	mkdir -pv "${D}/opt"
	mv -v Release "${D}/opt/customizemii"
	cd ../../../branches
	rm -rfv Base_WADs/.svn
	mv -v Base_WADs "${D}/opt/customizemii"
}

pkg_postinst() {
	xdg_icon_cache_update
}
