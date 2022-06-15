# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="HTML, CSS, and JS framework for developing responsive, mobile first on the web"
HOMEPAGE="https://getbootstrap.com/"
SRC_URI="https://github.com/twbs/bootstrap/releases/download/v${PV}/${P}-dist.zip"

LICENSE="MIT"
SLOT="3"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND="${DEPEND}
	dev-javascript/jquery:3"

S=${WORKDIR}/${P}-dist

src_install() {
	insinto "/usr/share/${PN}-${SLOT}/"
	doins -r css js fonts
}
