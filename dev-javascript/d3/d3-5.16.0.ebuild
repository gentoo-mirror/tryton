# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="a JavaScript library for manipulating documents based on data"
HOMEPAGE="https://d3js.org/"
SRC_URI="https://github.com/d3/${PN}/releases/download/v${PV}/${PN}.zip -> ${P}.zip"

LICENSE="BSD"
SLOT="5"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_install() {
	insinto "/usr/share/${PN}-${SLOT}/"
	doins *.js
}
