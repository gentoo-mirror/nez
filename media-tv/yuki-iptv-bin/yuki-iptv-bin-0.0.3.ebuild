# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
REQUIRED_USE="${PYTHON_REQUIRED_USE}"
inherit python-single-r1 xdg-utils

DESCRIPTION="IPTV player with EPG support (Astroncia IPTV fork)"
HOMEPAGE="https://github.com/yuki-iptv/yuki-iptv"
SRC_URI="https://github.com/yuki-iptv/yuki-iptv/releases/download/${PV}/yuki-iptv_${PV}_all.deb"

LICENSE="MIT CC-BY-4.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="${PYTHON_DEPS} dev-python/PyQt5[widgets] dev-python/chardet dev-python/requests dev-python/setproctitle dev-python/unidecode"
RDEPEND="${DEPEND}"
BDEPEND="${PYTHON_DEPS} app-alternatives/gzip app-alternatives/tar"

src_unpack() {
	mkdir -v "yuki-iptv-bin-${PV}"
	ar xv "${DISTDIR}/yuki-iptv_${PV}_all.deb" data.tar.xz
	tar -C "yuki-iptv-bin-${PV}" -xvf data.tar.xz
	rm -v data.tar.xz
}

src_install() {
	pwd
	ls
	cp -rv . "${D}"
	mv -v "${D}/usr/share/doc/yuki-iptv/changelog.gz" .
	rmdir -v "${D}/usr/share/doc/yuki-iptv"
	mkdir -v "${D}/usr/share/doc/${PF}"
	gunzip -v changelog.gz
	mv -v changelog "${D}/usr/share/doc/${PF}"
}

pkg_postinst() {
	xdg_icon_cache_update
}
