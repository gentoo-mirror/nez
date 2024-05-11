# Copyright 2023 nezbednik
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="splits directory into multiple with equal size"
HOMEPAGE="https://linux.die.net/man/1/dirsplit"
SRC_URI="http://download.lunar-linux.org/lunar/patches/dirsplit-${PV}.tar.bz2"

RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=">=dev-lang/perl-5.8.1"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin dirsplit
	doman dirsplit.1
}
