# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

RESTRICT="mirror test"

DISTUTILS_USE_PEP517=setuptools

# officially supports python2 and does not support python3_11 and 3_12
# after testing it seems to be able to handle 3_11 and 3_12
PYTHON_COMPAT=( python3_{4..12} )

inherit distutils-r1

DESCRIPTION="Allows you to specify timeouts when calling any existing function"
HOMEPAGE="https://github.com/kata198/func_timeout"
SRC_URI="https://codeload.github.com/kata198/func_timeout/tar.gz/70b48494bbee1974d0eaad0d025629d3e1930f67 -> func_timeout-70b48494bbee1974d0eaad0d025629d3e1930f67.tar.gz"
S="${WORKDIR}/func_timeout-70b48494bbee1974d0eaad0d025629d3e1930f67"

LICENSE="LGPL-3"
SLOT="0"

# no keywords. you have to willingly use this
#KEYWORDS="~amd64"
