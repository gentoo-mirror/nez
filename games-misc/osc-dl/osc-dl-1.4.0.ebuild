# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

RESTRICT="mirror test"

PYTHON_COMPAT=( python3_{10..12} )
inherit python-single-r1 desktop

DESCRIPTION="Desktop utility for downloading homebrew apps from the Open Shop Channel"
HOMEPAGE="https://github.com/dhtdht020/osc-dl"
SRC_URI="https://codeload.github.com/dhtdht020/osc-dl/tar.gz/refs/tags/1.4.0 -> osc-dl-1.4.0.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	${PYTHON_DEPS}

	>=dev-python/requests-2.31.0
	>=dev-python/packaging-24.0
	>=dev-python/markdown-3.6
	>=dev-python/pillow-10.2.0-r1
	>=dev-python/pyserial-3.5-r2
	>=dev-python/pyside6-6.6.2-r1

	>=dev-python/darkdetect-0.8.0
	>=dev-python/func-timeout-4.3.5
"
# ^ those last two dependencies have to be pulled
# from outside of the gentoo repository

RDEPEND="${DEPEND}"

src_install() {
	mkdir -p "${D}/opt/osc-dl"
	cp -rv "${S}/." "${D}/opt/osc-dl/"

	echo "#!/bin/sh" > "${WORKDIR}/osc-dl"
	echo "python /opt/osc-dl/oscdl.py" >> "${WORKDIR}/osc-dl"

	python_doexe "${WORKDIR}/osc-dl"

	make_desktop_entry /usr/bin/osc-dl "Open Shop Channel Downloader" /opt/osc-dl/assets/gui/windowicon.png "Game;"
}
