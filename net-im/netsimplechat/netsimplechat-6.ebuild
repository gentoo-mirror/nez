# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DESCRIPTION="simple c# .net chat client that can be adapted to many services"
HOMEPAGE="https://github.com/kawaiizenbo/netsimplechat"
SRC_URI="https://github.com/kawaiizenbo/netsimplechat/archive/refs/tags/${PV}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RDEPEND=">=dev-lang/mono-6.12.0.122 >=app-shells/bash-5.1 >=sys-apps/coreutils-8.32"
DEPEND="${RDEPEND}"

src_configure() {
	echo "build:" >> "Makefile"
	echo "	xbuild /property:Configuration=Release" >> "Makefile"
	echo "install:" >> "Makefile"
	echo "	mkdir -p \"\${DESTDIR}/usr/bin\"" >> "Makefile"
	echo "	echo \"#!/bin/bash\" > \"\${DESTDIR}/usr/bin/netsimplechat\"" >> "Makefile"
	echo "	echo \"mono \\\"\\\$\$(dirname \\\"\\\$\$0\\\")/../share/netsimplechat.exe\\\"\" >> \"\${DESTDIR}/usr/bin/netsimplechat\"" >> "Makefile"
	echo "	chmod +x \"\${DESTDIR}/usr/bin/netsimplechat\"" >> "Makefile"
	echo "	mkdir -p \"\${DESTDIR}/usr/share\"" >> "Makefile"
	echo "	cp \"netsimplechat/bin/Release/netsimplechat.exe\" \"\${DESTDIR}/usr/share/netsimplechat.exe\"" >> "Makefile"
	echo "	chmod +x \"\${DESTDIR}/usr/share/netsimplechat.exe\"" >> "Makefile"
}
