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

	$(python_gen_cond_dep '
	>=dev-python/requests-2.31.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-24.0[${PYTHON_USEDEP}]
	>=dev-python/markdown-3.6[${PYTHON_USEDEP}]
	>=dev-python/pillow-10.2.0-r1[${PYTHON_USEDEP}]
	>=dev-python/pyserial-3.5-r2[${PYTHON_USEDEP}]
	>=dev-python/pyside6-6.6.2-r1[${PYTHON_USEDEP}]

	>=dev-python/darkdetect-0.8.0[${PYTHON_USEDEP}]
	>=dev-python/func-timeout-4.3.5[${PYTHON_USEDEP}]
	')
"
# ^ those last two dependencies have to be pulled
# from outside of the gentoo repository

RDEPEND="${DEPEND}"

src_install() {
	mkdir -p "${D}/opt/osc-dl"
	cp -rv "${S}/." "${D}/opt/osc-dl/"

	echo "#!/usr/bin/env python3" > "${WORKDIR}/osc-dl"
	echo "import sys" >> "${WORKDIR}/osc-dl"
	echo "import subprocess" >> "${WORKDIR}/osc-dl"
	echo "subprocess.call([sys.executable, \"/opt/osc-dl/oscdl.py\"] + sys.argv[1:])" >> "${WORKDIR}/osc-dl"

	python_doscript "${WORKDIR}/osc-dl"

	make_desktop_entry /usr/bin/osc-dl "Open Shop Channel Downloader" /opt/osc-dl/assets/gui/windowicon.png "Game;"
}
