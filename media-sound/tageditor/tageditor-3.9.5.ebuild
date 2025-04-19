# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
EAPI=8

# Original ebuild from salfter
# https://gitlab.com/salfter/portage/-/blob/master/media-sound/tageditor/tageditor-3.9.0.ebuild
# What I did: changed version, changed cpp-utilities from dev-util to dev-libs
# added Qt interface building;
# Please add Case_Of overlay for qtutilities + cpp-utilities!

inherit cmake

DESCRIPTION="A tag editor with command-line interface supporting MP4/M4A/AAC (iTunes), ID3, Vorbis, Opus, FLAC and Matroska"
HOMEPAGE="https://github.com/Martchus/tageditor"
SRC_URI="https://github.com/Martchus/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"
IUSE="qt"

RDEPEND="dev-libs/cpp-utilities
	 media-sound/tagparser
	 qt? ( dev-libs/qtutilities[-qt6] dev-qt/qtconcurrent )"
DEPEND="${RDEPEND}"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_BUILD_TYPE=Release
		-DWIDGETS_GUI="$(usex qt)"
		-DQUICK_GUI="$(usex qt)"
	)

	cmake_src_configure
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
