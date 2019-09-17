# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="lightweight yet complete and accurate GNU gettext port for node and the browser"
HOMEPAGE="https://guillaumepotier.github.io/gettext.js/"
SRC_URI="https://github.com/guillaumepotier/${PN}.js/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}.js-${PV}

src_install() {
	insinto "/usr/share/${PN}.js-${SLOT}/"
	cd "${S}"/dist
	doins -r *.js
}
