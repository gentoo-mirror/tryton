# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="A JavaScript event calendar"
HOMEPAGE="https://fullcalendar.io/"
SRC_URI="https://github.com/${PN}/${PN}/releases/download/v${PV}/${P}.zip"

LICENSE="MIT"
SLOT="3"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND="${DEPEND}
	>=dev-javascript/jquery-2.0.0
	>=dev-javascript/moment-2.20.1:2"

src_install() {
	insinto "/usr/share/${PN}-${SLOT}/"
	cd dist
	doins -r *.js *.css locale
}
