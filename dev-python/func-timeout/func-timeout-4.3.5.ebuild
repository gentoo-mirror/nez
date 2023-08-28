# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

RESTRICT="mirror test"

inherit distutils-r1 pypi

DESCRIPTION="Python module which allows you to specify timeouts when calling functions"
HOMEPAGE="https://pypi.org/project/func-timeout/ https://github.com/kata198/func_timeout"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"
