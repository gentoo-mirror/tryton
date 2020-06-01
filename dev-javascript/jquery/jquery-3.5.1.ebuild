# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="a fast, small, and feature-rich JavaScript library"
HOMEPAGE="https://jquery.com/"
SRC_URI="https://code.jquery.com/${P}.js
	https://code.jquery.com/${P}.min.js
	https://code.jquery.com/${P}.min.map
	https://code.jquery.com/${P}.slim.js
	https://code.jquery.com/${P}.slim.min.js
	https://code.jquery.com/${P}.slim.min.map"

LICENSE="MIT"
SLOT="3"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	mkdir ${P}
	cp "${DISTDIR}"/${P}.js "${S}"/${PN}.js || die
	cp "${DISTDIR}"/${P}.min.js "${S}"/${PN}.min.js || die
	cp "${DISTDIR}"/${P}.min.map "${S}"/${PN}.min.map || die
	cp "${DISTDIR}"/${P}.slim.js "${S}"/${PN}.slim.js || die
	cp "${DISTDIR}"/${P}.slim.min.js "${S}"/${PN}.slim.min.js || die
	cp "${DISTDIR}"/${P}.slim.min.map "${S}"/${PN}.slim.min.map || die
}

src_install() {
	insinto "/usr/share/${PN}-${SLOT}/"
	doins ${PN}*.js ${PN}*.map
}
