# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="D3-based reusable chart library"
HOMEPAGE="http://c3js.org/"
SRC_URI="https://github.com/c3js/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	=dev-javascript/d3-3.5*"

src_install() {
	insinto "/usr/share/${PN}-${SLOT}/"
	doins c3.css c3.js c3.min.css c3.min.js
	doins -r extensions
}
