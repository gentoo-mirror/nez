# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Original ebuild from salfter
# https://gitlab.com/salfter/portage/-/blob/master/media-sound/tagparser/tagparser-12.1.0.ebuild
# What I did: change version, change cpp-utilities category (dev-util -> dev-libs)
# This would fit more in media-libs than media-sound I think? but keeping it

EAPI=8

inherit cmake

DESCRIPTION="C++ library for reading and writing MP4/M4A/AAC (iTunes), ID3, Vorbis, Opus, FLAC and Matroska tags"
HOMEPAGE="https://github.com/Martchus/tagparser"
SRC_URI="https://github.com/Martchus/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-libs/cpp-utilities"
DEPEND="${RDEPEND}"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_BUILD_TYPE=Release
	)

	cmake_src_configure
}
