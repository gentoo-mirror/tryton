# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="a fast, small, and feature-rich JavaScript library"
HOMEPAGE="https://jquery.com/"
SRC_URI="https://code.jquery.com/${P}.js
	https://code.jquery.com/${P}.min.js
	https://code.jquery.com/${P}.min.map"

LICENSE="MIT"
SLOT="2"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	mkdir ${P}
	cp "${DISTDIR}"/${P}.js "${S}"/${PN}.js || die
	cp "${DISTDIR}"/${P}.min.js "${S}"/${PN}.min.js || die
	cp "${DISTDIR}"/${P}.min.map "${S}"/${PN}.min.map || die
}

src_install() {
	insinto "/usr/share/${PN}-${SLOT}/"
	doins ${PN}*.js ${PN}*.map
}
