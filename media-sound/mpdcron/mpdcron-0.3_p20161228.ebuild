# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

_GIT_COMMIT="e49e6049b8693d31887c538ddc7b19f5e8ca476b"

DESCRIPTION="A 'cron' like program for mpd"
HOMEPAGE="https://github.com/alip/mpdcron"
SRC_URI="https://codeload.github.com/alip/mpdcron/tar.gz/${_GIT_COMMIT} -> mpdcron-${_GIT_COMMIT}.tar.gz"
RESTRICT="mirror"
S="${WORKDIR}/mpdcron-${_GIT_COMMIT}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

DEPEND=">=dev-libs/libdaemon-0.13 >=media-libs/libmpdclient-2.1"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	eautoreconf
}

src_install() {
	default
	newconfd "${FILESDIR}/mpdcron.confd" mpdcron
	newinitd "${FILESDIR}/mpdcron.initd" mpdcron
	insinto /etc/mpdcron
	doins "${FILESDIR}/mpdcron.conf"
}
